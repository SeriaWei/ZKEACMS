/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace Easy.Encrypt
{
    public interface IEncryptService
    {
        byte[] Encrypt(byte[] source);
        byte[] Decrypt(byte[] source);
    }
}