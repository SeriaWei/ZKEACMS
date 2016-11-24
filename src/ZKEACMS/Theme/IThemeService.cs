/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;

namespace ZKEACMS.Theme
{
    public interface IThemeService : IService<ThemeEntity>
    {
        void SetPreview(string id);
        void CancelPreview();
        ThemeEntity GetCurrentTheme();
        void ChangeTheme(string id);
    }
}