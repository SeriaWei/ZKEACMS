using Easy;
using Easy.Reflection;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Text;

namespace EasyFrameWork.Test
{
    [TestClass]
    public class PropertyHelperTest
    {
        class People
        {
            public int Age { get; set; }
            public string Name { get; set; }
            public string[] Hobby { get; set; }
            public Dictionary<string, string> Properties { get; set; }
            public People[] Children { get; set; }
        }
        private People CreateTestPeople()
        {
            return new People
            {
                Name = "Wayne",
                Age = 10,
                Hobby = new string[] { "Basketball", "Football" },
                Properties = new Dictionary<string, string> { { "City", "ShenZhen" }, { "Address", "Home" } },
                Children = new People[] { new People { Name = "Nancy", Hobby = new string[] { "Run" } } }
            };
        }
        [TestMethod]
        public void TestGetPropertyValue()
        {
            var people = CreateTestPeople();
            Assert.AreEqual("Wayne", PropertyHelper.GetPropertyValue(people, "Name"));
            Assert.AreEqual(10, PropertyHelper.GetPropertyValue(people, "Age"));
            Assert.AreEqual(2, PropertyHelper.GetPropertyValue(people, "Hobby.Length"));
            Assert.AreEqual("Football", PropertyHelper.GetPropertyValue(people, "Hobby[1]"));
            Assert.AreEqual("ShenZhen", PropertyHelper.GetPropertyValue(people, "Properties[\"City\"]"));
            Assert.AreEqual("Run", PropertyHelper.GetPropertyValue(people, "Children[0].Hobby[0]"));
        }
    }
}
