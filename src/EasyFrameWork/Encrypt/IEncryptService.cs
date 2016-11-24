/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy.Encrypt
{
    public interface IEncryptService
    {
        byte[] Encrypt(byte[] source);
        byte[] Decrypt(byte[] source);
    }
}