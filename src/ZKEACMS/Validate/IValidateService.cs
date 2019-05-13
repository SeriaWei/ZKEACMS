/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
//using Easy.IOC;
namespace ZKEACMS.Validate
{
    public interface IValidateService
    {
        byte[] GenerateCode(int num);
        bool ValidateCode(string code);

        string GetCode();
    }
}
