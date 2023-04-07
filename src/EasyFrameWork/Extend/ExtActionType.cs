using Easy.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Extend
{
    public static class ExtActionType
    {
        public static bool HasFlag(this ActionType? actionType, ActionType flag)
        {
            if (actionType == null) return false;

            return actionType.Value.HasFlag(flag);
        }
    }
}
