/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.ViewPort.Descriptor;
using System;
using System.Collections.Generic;
using System.Reflection;

namespace Easy.ViewPort
{

    public class TagsHelper
    {
        private readonly string _key;
        private readonly Dictionary<string, BaseDescriptor> _attributes;
        private readonly Type _modelType;
        private readonly Type _dataType;
        private readonly PropertyInfo _targetType;
        public TagsHelper(string Key, Dictionary<string, BaseDescriptor> Attributes, Type modelType, PropertyInfo targetType)
        {
            _key = Key;
            _attributes = Attributes;
            _targetType = targetType;
            _modelType = modelType;
            _dataType = targetType.PropertyType.GetTypeInfo().IsGenericType ? targetType.PropertyType.GetGenericArguments()[0] : targetType.PropertyType;
        }
        /// <summary>
        /// 基本输入框
        /// </summary>
        /// <returns></returns>
        public TextBoxDescriptor AsTextBox()
        {
            TextBoxDescriptor tag = new TextBoxDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 基本输入框
        /// </summary>
        /// <returns></returns>
        public TextAreaDescriptor AsTextArea()
        {
            TextAreaDescriptor tag = new TextAreaDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 下拉框
        /// </summary>
        /// <returns></returns>
        public DropDownListDescriptor AsDropDownList()
        {
            DropDownListDescriptor tag = new DropDownListDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 文件上传
        /// </summary>
        /// <returns></returns>
        public FileDescriptor AsFileInput()
        {
            FileDescriptor tag = new FileDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 多选项
        /// </summary>
        /// <returns></returns>
        public MutiSelectDescriptor AsMutiSelect()
        {
            MutiSelectDescriptor tag = new MutiSelectDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 密码输入框
        /// </summary>
        /// <returns></returns>
        public PassWordDescriptor AsPassWord()
        {
            PassWordDescriptor tag = new PassWordDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 隐藏框
        /// </summary>
        /// <returns></returns>
        public HiddenDescriptor AsHidden()
        {
            HiddenDescriptor tag = new HiddenDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        /// <summary>
        /// 勾选框
        /// </summary>
        /// <returns></returns>
        public CheckBoxDescriptor AsCheckBox()
        {
            CheckBoxDescriptor tag = new CheckBoxDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        public ListEditorDescriptor AsListEditor()
        {
            ListEditorDescriptor tag = new ListEditorDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
        public ObjectDescriptor AsObject()
        {
            ObjectDescriptor tag = new ObjectDescriptor(_modelType, _key);
            tag.DataType = _dataType;
            _attributes[this._key] = tag;
            return tag;
        }
    }
}
