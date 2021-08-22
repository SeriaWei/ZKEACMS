/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using Easy.Notification.Queue;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;

namespace ZKEACMS.Mail.Queue
{
    public class PersistentEmailQueue : IEmailQueue
    {
        private Stack<string> stack = new Stack<string>();
        private object lockObj = new object();
        private object lockReceive = new object();
        private const string Folder = "EmailQueue";
        public PersistentEmailQueue()
        {
            if (!Directory.Exists(Folder))
            {
                Directory.CreateDirectory(Folder);
            }
            string[] files = Directory.GetFiles(Folder, "*.json");
            if (files.Length > 0)
            {
                foreach (var item in files)
                {
                    stack.Push(Path.GetFileName(item));
                }
            }
        }

        public async Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            Monitor.Exit(lockReceive);
            try
            {
                if (CanReceive())
                {
                    return await ReceiveFromFile();
                }

                Monitor.Enter(lockObj);
                try
                {
                    if (Monitor.Wait(lockObj))
                    {
                        return await ReceiveFromFile();
                    }
                }
                finally
                {
                    Monitor.Exit(lockObj);
                }
                return null;
            }
            finally
            {
                Monitor.Exit(lockReceive);
            }
        }

        private async Task<EmailContext> ReceiveFromFile()
        {
            string fileName = stack.Pop();
            string path = Path.Combine(Folder, fileName);
            if (!File.Exists(path)) return null;

            string fileJson = await File.ReadAllTextAsync(path, Encoding.UTF8);
            File.Delete(path);
            return JsonSerializer.Deserialize<EmailContext>(fileJson);
        }

        public async Task Send(EmailContext emailMessage)
        {
            Monitor.Enter(lockObj);
            try
            {
                await SaveToFile(emailMessage);
                Monitor.PulseAll(lockObj);
            }
            finally
            {
                Monitor.Exit(lockObj);
            }
        }

        private async Task SaveToFile(EmailContext emailMessage)
        {
            string fileName = $"{Guid.NewGuid()}.json";
            stack.Push(fileName);
            byte[] data = JsonSerializer.SerializeToUtf8Bytes(emailMessage);
            await File.WriteAllBytesAsync(Path.Combine(Folder, fileName), data);
        }

        private bool CanReceive()
        {
            return stack.Count > 0;
        }
    }
}
