/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using Easy.Mvc;
using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Hosting;

namespace Easy.Encrypt
{
    public class EncryptService : IEncryptService
    {
        private const string Path = "/Encrypt/";
        private const string PrivateKeyFile = "Private.config";
        private const string PublicKeyFile = "Public.config";
        private readonly string _folder;
        private readonly string _privateKeyFileName;
        private readonly string _publicKeyFileName;
        public EncryptService(IWebHostEnvironment hostingEnvironment)
        {
            _folder = System.IO.Path.Combine(hostingEnvironment.ContentRootPath, Path);
            _privateKeyFileName = System.IO.Path.Combine(_folder, PrivateKeyFile);
            _publicKeyFileName = System.IO.Path.Combine(_folder, PublicKeyFile);
        }
        public byte[] Encrypt(byte[] source)
        {
            Func<byte[], byte[]> encrypt = sou =>
            {

                using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
                {                    
                    if (!Directory.Exists(_folder))
                    {
                        Directory.CreateDirectory(_folder);
                    }
                    if (!File.Exists(_privateKeyFileName))
                    {
                        File.WriteAllText(_privateKeyFileName, rsa.ToXmlString(true));
                        File.WriteAllText(_publicKeyFileName, rsa.ToXmlString(false));
                    }
                    rsa.FromXmlString(File.ReadAllText(_publicKeyFileName));
                    int maxBlockSize = rsa.KeySize / 8 - 11;
                    if (sou.Length <= maxBlockSize)
                        return rsa.Encrypt(sou, false);

                    using (MemoryStream plaiStream = new MemoryStream(sou))
                    {
                        using (MemoryStream crypStream = new MemoryStream())
                        {
                            byte[] buffer = new byte[maxBlockSize];
                            int blockSize = plaiStream.Read(buffer, 0, maxBlockSize);

                            while (blockSize > 0)
                            {
                                byte[] toEncrypt = new byte[blockSize];
                                Array.Copy(buffer, 0, toEncrypt, 0, blockSize);

                                byte[] cryptograph = rsa.Encrypt(toEncrypt, false);
                                crypStream.Write(cryptograph, 0, cryptograph.Length);

                                blockSize = plaiStream.Read(buffer, 0, maxBlockSize);
                            }

                            return crypStream.ToArray();
                        }
                    }
                }
            };
            return MarkData(encrypt(source));
        }

        public byte[] Decrypt(byte[] source)
        {
            if (IsEncrypt(source))
            {
                Func<byte[], byte[]> decrypt = sou =>
                {
                    using (RSACryptoServiceProvider rsa = new RSACryptoServiceProvider())
                    {
                        if (File.Exists(_folder + PrivateKeyFile))
                        {
                            rsa.FromXmlString(File.ReadAllText(_privateKeyFileName));
                        }
                        int maxBlockSize = rsa.KeySize / 8;

                        if (sou.Length <= maxBlockSize)
                            return rsa.Decrypt(sou, false);

                        using (MemoryStream crypStream = new MemoryStream(sou))
                        {
                            using (MemoryStream plaiStream = new MemoryStream())
                            {
                                byte[] buffer = new byte[maxBlockSize];
                                int blockSize = crypStream.Read(buffer, 0, maxBlockSize);

                                while (blockSize > 0)
                                {
                                    byte[] toDecrypt = new byte[blockSize];
                                    Array.Copy(buffer, 0, toDecrypt, 0, blockSize);

                                    byte[] plaintext = rsa.Decrypt(toDecrypt, false);
                                    plaiStream.Write(plaintext, 0, plaintext.Length);

                                    blockSize = crypStream.Read(buffer, 0, maxBlockSize);
                                }

                                return plaiStream.ToArray();
                            }
                        }
                    }
                };
                return decrypt(ClearDataMark(source));
            }
            return source;
        }
        private byte[] MarkData(byte[] source)
        {
            byte[] newBytes = new byte[source.Length + 200];
            for (int i = 0; i < newBytes.Length; i++)
            {
                if (i < 100 || i > newBytes.Length - 100 - 1)
                {
                    newBytes[i] = 0;
                }
                else
                {
                    newBytes[i] = source[i - 100];
                }
            }
            return newBytes;
        }

        private byte[] ClearDataMark(byte[] source)
        {
            byte[] newBytes = new byte[source.Length - 200];
            for (int i = 100; i < source.Length - 100; i++)
            {
                newBytes[i - 100] = source[i];
            }
            return newBytes;
        }
        private bool IsEncrypt(byte[] source)
        {
            for (int i = 0; i < 100; i++)
            {
                if (source[i] != 0 || source[source.Length - i - 1] != 0)
                {
                    return false;
                }
            }
            return true;
        }
    }
}