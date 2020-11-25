/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Easy
{
    public class Version
    {
        static Regex regex = new Regex(@"^(\d+\.)?(\d+\.)?(\d+\.)?(\d+)$", RegexOptions.Compiled);

        public int Major { get; set; }
        public int Minor { get; set; }
        public int Revision { get; set; }
        public int Build { get; set; }

        public static Version Parse(string version)
        {
            if (!regex.IsMatch(version))
            {
                throw new Exception("Version format is not supported.");
            }
            Version v = new Version();
            string[] versionParts = version.Split('.', StringSplitOptions.RemoveEmptyEntries);
            if (versionParts.Length > 0)
            {
                v.Major = int.Parse(versionParts[0]);
            }
            if (versionParts.Length > 1)
            {
                v.Minor = int.Parse(versionParts[1]);
            }
            if (versionParts.Length > 2)
            {
                v.Revision = int.Parse(versionParts[2]);
            }
            if (versionParts.Length > 3)
            {
                v.Build = int.Parse(versionParts[3]);
            }
            return v;
        }

        public static bool operator ==(Version v1, Version v2)
        {
            if (ReferenceEquals(v1, v2))
            {
                return true;
            }
            if (ReferenceEquals(v1, null))
            {
                return false;
            }
            if (ReferenceEquals(v2, null))
            {
                return false;
            }
            return v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision == v2.Revision && v1.Build == v2.Build;
        }
        public static bool operator !=(Version v1, Version v2)
        {
            return v1.Major != v2.Major || v1.Minor != v2.Minor || v1.Revision != v2.Revision || v1.Build != v2.Build;
        }

        public static bool operator >(Version v1, Version v2)
        {
            if (v1.Major > v2.Major)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor > v2.Minor)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision > v2.Revision)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision == v2.Revision && v1.Build > v2.Build)
            {
                return true;
            }
            return false;
        }
        public static bool operator <(Version v1, Version v2)
        {
            if (v1.Major < v2.Major)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor < v2.Minor)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision < v2.Revision)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision == v2.Revision && v1.Build < v2.Build)
            {
                return true;
            }
            return false;
        }
        public static bool operator >=(Version v1, Version v2)
        {
            if (v1.Major > v2.Major)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor > v2.Minor)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision > v2.Revision)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision == v2.Revision && v1.Build >= v2.Build)
            {
                return true;
            }
            return false;
        }
        public static bool operator <=(Version v1, Version v2)
        {
            if (v1.Major < v2.Major)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor < v2.Minor)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision < v2.Revision)
            {
                return true;
            }
            if (v1.Major == v2.Major && v1.Minor == v2.Minor && v1.Revision == v2.Revision && v1.Build <= v2.Build)
            {
                return true;
            }
            return false;
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(this, obj))
            {
                return true;
            }

            if (ReferenceEquals(obj, null))
            {
                return false;
            }

            return this == (obj as Version);
        }

        public override int GetHashCode()
        {
            return ToString().GetHashCode();
        }
        public override string ToString()
        {
            return $"{Major}.{Minor}.{Revision}.{Build}";
        }
    }
}
