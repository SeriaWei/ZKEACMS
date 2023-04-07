/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

namespace Easy.Constant
{
    public enum SourceType
    {
        None = 1,
        Dictionary = 2,
        ViewData = 3
    }
    public enum RecordStatus
    {
        Active = 1,
        InActive = 2
    }
    public enum ActionType
    {
        Create = 1,
        Update = 2,
        Delete = 4,
        Design = 8,
        Publish = 16,
        Exit = 32,
        Continue = 64,
        UnAttach = 128,
        CreateAndExit = Create | Exit,
        UpdateAndExit = Update | Exit
    }
    public enum UserType
    {
        Administrator = 1,
        Customer = 2
    }
}
