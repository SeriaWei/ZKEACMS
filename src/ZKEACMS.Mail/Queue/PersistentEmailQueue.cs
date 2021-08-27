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
        private Stack<string> _stack = new Stack<string>();
        private Stack<BlockedEmailQueueReader> _queueReaders = new Stack<BlockedEmailQueueReader>();
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
                    _stack.Push(Path.GetFileName(item));
                }
            }
        }

        public async Task<EmailContext> Receive(CancellationToken cancellationToken = default)
        {
            var result = await ReceiveFromFileAsync();
            if (result != null) return result;

            BlockedEmailQueueReader queueReader = new BlockedEmailQueueReader(this, cancellationToken);
            _queueReaders.Push(queueReader);
            return await queueReader.Task;
        }

        public async Task<EmailContext> ReceiveFromFileAsync()
        {
            string path;
            lock (_stack)
            {
                if (_stack.Count == 0) return null;

                string fileName = _stack.Pop();
                path = Path.Combine(Folder, fileName);
                if (!File.Exists(path)) return null;
            }
            string fileJson = await File.ReadAllTextAsync(path, Encoding.UTF8);
            File.Delete(path);
            return JsonSerializer.Deserialize<EmailContext>(fileJson);
        }

        public async Task Send(EmailContext emailMessage)
        {
            await SaveToFile(emailMessage);
            BlockedEmailQueueReader reader;
            lock (_queueReaders)
            {
                _queueReaders.TryPop(out reader);
            }
            if (reader != null)
            {
                bool success = await reader.TryDequeueAsync();
                if (!success)
                {
                    _queueReaders.Push(reader);
                }
            }
        }

        private async Task SaveToFile(EmailContext emailMessage)
        {
            string fileName = $"{Guid.NewGuid()}.json";
            byte[] data = JsonSerializer.SerializeToUtf8Bytes(emailMessage);
            await File.WriteAllBytesAsync(Path.Combine(Folder, fileName), data);
            lock (_stack)
            {
                _stack.Push(fileName);
            }
        }
    }
}
