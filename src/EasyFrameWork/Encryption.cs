/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

namespace Easy
{
    /// <summary>
    /// 加密算法
    /// </summary>
    public class EncryptionTool
    {

        public static string Encryption(object target)
        {
            return target.ToString();
        }

        public static object Decryption(string target)
        {
            return target;
        }
    }
}