/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */

/*Easy通用JS插件包
方法说明 以下方法均在Easy命名空间下
↘ Processor(); 函数节流（禁止函数因频繁运行而影响性能）
↘ WindowSize();例:WindowSize().width;WindowSize().height 获取窗体大小
↘ MousePosition(e)  例:MousePosition(e).X;MousePosition(e).Y 获取鼠标坐标
↘ OpacityBackGround 半透明遮罩层
↘ ShowMessageBox(title, msg, fnOk, ShowCancel, zindex) 弹出提示窗口
↘ MessageTip.Show(msg); 显示消息框
↘ Cookie 设置和获取Cookie
↘ ShowUrlWindow(); 打开窗口

///以下是jQuery扩展方法

↘ $("#box").DragElement();  这样box就可以拖动了;
↘ $("#about-text").mousewheel(function (e, delta) {$(this).scrollTop($(this).scrollTop() - delta * 10);}); 鼠标滚轮事件
↘ $("#imgBox").AutoScroll(); 鼠标移动，滚动内容查看
↘ $("#MarqueeH").MarqueeH(); 水平跑马灯
↘ $("#MarqueeV").MarqueeV(); 垂直跑马灯
↘ $("#img").ImageCenter_Adapt(); 完全居中显示图片，缩小图片以适应
↘ $("#img").ImageCenter_Full(); 完全居中显示图片，放大图片以适应
*/

Array.prototype.ContainsValue = function (val) {
    /// <summary>是否包含某值</summary>
    /// <param name="val" type="Object">要查询的值</param>
    /// <returns type="Boolean" />
    var index = -1;
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val)
            index = i;
    }
    if (index == -1)
        return false;
    else return true;
}
Array.prototype.ValueIndex = function (val) {
    /// <summary>是否包含某值</summary>
    /// <param name="val" type="Object">要查询的值</param>
    /// <returns type="Int" />
    var index = -1;
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) {
            index = i;
            break;
        }
    }
    return index;
}
String.prototype.replaceAll = function (oldValue, newVlaue) {
    var target = this;
    return target.split(oldValue).join(newVlaue);
}
var Easy = {};
Easy.MaxZindex = 1;
Easy.Processor = function (fun, delay) {
    /// <summary>函数节流（禁止函数因频繁运行而影响性能）</summary>
    /// <param name="fun" type="Function">要推迟执行的函数</param>
    /// <param name="delay" type="Int">推迟执行的时间</param>
    clearTimeout(this.tid);
    if (typeof delay != "number")
        delay = 60;
    this.tid = setTimeout(function () { if (fun) fun.call(); }, delay);
}
Easy.WindowSize = function () {
    /// <summary>浏览器窗体大小</summary>
    var w, h;
    if (!!(window.attachEvent && !window.opera)) {
        h = document.documentElement.clientHeight;
        w = document.documentElement.clientWidth;
    } else {
        h = window.innerHeight;
        w = window.innerWidth;
    }
    return { width: w, height: h };
}

Easy.Cookie = (function () {
    /// <summary>设置Cookie</summary>
    function SetCookie(c_name, value, expiredays) {
        /// <summary>设置Cookie</summary>
        /// <param name="c_name" type="String">Cookie的名称</param>
        /// <param name="value" type="String">Cookie值</param>
        /// <param name="expiredays" type="Int">有效天数</param>
        var exdate = new Date()
        exdate.setDate(exdate.getDate() + expiredays)
        document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + ";path=/;";
    }

    function GetCookie(c_name) {
        /// <summary>获取Cookie值</summary>
        /// <param name="c_name" type="String">Cookie的名称</param>
        /// <returns type="String" />
        if (document.cookie.length > 0) {
            c_start = document.cookie.indexOf(c_name + "=")
            if (c_start != -1) {
                c_start = c_start + c_name.length + 1
                c_end = document.cookie.indexOf(";", c_start)
                if (c_end == -1) c_end = document.cookie.length
                return unescape(document.cookie.substring(c_start, c_end))
            }
        }
        else return ""
    }
    function DeleteCookie(c_name) {
        if (GetCookie(c_name)) {
            document.cookie = c_name + "=" +
            "; expires=Thu, 01-Jan-70 00:00:01 GMT";
        }
    }
    return { SetCookie: SetCookie, GetCookie: GetCookie, DeleteCookie: DeleteCookie }
})();


Easy.MousePosition = function (e) {
    /// <summary>获取鼠标坐标(接用jQuery事件)</summary>
    /// <param name="e" type="jQuery">jQuery事件e对象</param>
    var x, y;
    var eX = e || window.event;
    x = eX.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
    y = eX.clientY + document.body.scrollTop + document.documentElement.scrollTop;
    return { X: x, Y: y }

}

Easy.OpacityBackGround = (function () {
    var opa = 0.5;
    var ref = 0;
    function ShowOpactiyBg(zindex, callBack) {

        if (typeof zindex != "number")
            zindex = 1;
        var Ele;
        if (ref === 0) {
            Ele = $("<div class='OpacityBackGround OtherFixed'></div>");
            $("body").append(Ele);
            Ele.fadeTo(0, 0);
            Ele.css("z-index", zindex);
        }
        else {
            Ele = $("div.OpacityBackGround");
        }
        Ele.fadeTo(300, opa, function () {
            if (callBack) callBack.call();
        });
        ref++;
    }
    function CloseOpacityBg(callBack) {
        ref--;
        if (ref < 0) {
            ref = 0;
        }
        if (ref === 0) {
            var Bele = $(".OpacityBackGround");
            Bele.fadeTo(300, 0, function () {
                if (ref === 0) {
                    $(this).remove();
                }
                if (callBack)
                    callBack.call();
            });
        } else if (callBack) {
            callBack.call();
        }
    }
    function SetOpacity(opacity) {
        opa = opacity;
    }
    return { Show: ShowOpactiyBg, Close: CloseOpacityBg, SetOpacity: SetOpacity }
})();

Easy.Block = function () {
    if ($(".easy-block").size() === 0) {
        Easy.OpacityBackGround.Show();
        $(".OpacityBackGround").addClass("busy");
        $("body").append("<div class='easy-block' />");
    }
}
Easy.UnBlock = function () {
    $(".OpacityBackGround").removeClass("busy");
    Easy.OpacityBackGround.Close();
    $(".easy-block").remove();
}

Easy.ShowMessageBox = function (title, msg, fnOk, ShowCancel, zindex) {
    /// <summary>弹出消息提示窗口</summary>
    /// <param name="title" type="String">显示的标题</param>
    /// <param name="msg" type="String">消息内容</param>
    /// <param name="fnOk" type="Function">单击确定时的回调函数</param>
    /// <param name="ShowCancel" type="Boolean">是否显示取消按钮</param>
    /// <param name="zindex" type="Int">z方向的层次</param>
    var box = $("<div class='MessageBox BoxShadow'>" +
            "<div class='MBContent'>" +
                "<div id='MessageBoxTitle' class='MBTitle'></div>" +
                "<div id='MessageBoxMsg' class='MBMSgText'></div>" +
                "<div class='MBFoot'>" +
                    "<div id='MessageBoxActions' class='MBActions'></div>" +
                    "<div style='clear: both'></div></div></div></div>");
    box.find("#MessageBoxMsg").html(msg);
    box.find("#MessageBoxTitle").html(title);

    box.css("position", "fixed");

    if (typeof zindex != "number")
        zindex = 1;
    box.css("z-index", zindex);
    box.fadeTo(0, 0);
    var okButton = $("<input id='MessageBoxOkBtn' type='button' class='btn btn-primary' value='确定' />");
    box.find("#MessageBoxActions").append(okButton);
    okButton.click(function () {
        if (fnOk) {
            fnOk.call();
        }
        Easy.OpacityBackGround.Close();
        box.animate({ top: "45%", opacity: 0 }, 200, function () { $(this).remove(); });
    });
    if (typeof ShowCancel == "boolean") {
        if (ShowCancel) {
            var CancelButton = $("<input id='MessageBoxCancelBtn' type='button' class='btn btn-default' value='取消' />");
            CancelButton.click(function () {
                Easy.OpacityBackGround.Close();
                box.animate({ top: "45%", opacity: 0 }, 200, function () { $(this).remove(); });
            });
            box.find("#MessageBoxActions").append(CancelButton);
        }
    }
    Easy.OpacityBackGround.Show(zindex);
    $("body").append(box);
    box.animate({ top: "50%", opacity: 1 }, 200, function () { box.find("#MessageBoxOkBtn").focus(); });
}

Easy.MessageTip = (function () {
    var timeId = 0;
    function Show(msg) {
        var $tip = $(".MessageTip");
        if ($tip.size() == 0) {
            var tipHtml = new Array();
            tipHtml.push("<div class='MessageTip'>");
            tipHtml.push("</div>");
            $tip = $(tipHtml.join(""));
            $tip.css("bottom", 10);
            $tip.append("<p>" + msg + "</p>");
            $("body").append($tip);
            $tip.css("right", 0 - $tip.width());
            $tip.animate({ right: -2 }, 200, function () {
                timeId = setTimeout(function () {
                    $tip.animate({ right: (0 - $tip.width()) }, 200, function () { $(this).remove(); });
                }, 5000);
            });
        }
        else {
            $tip.append("<p>" + msg + "</p>");
            clearTimeout(timeId);
            timeId = setTimeout(function () {
                $tip.animate({ right: (0 - $tip.width()) }, 200, function () { $(this).remove(); });
            }, 5000);
        }
    }

    return { Show: Show }
})();

Easy.ShowUrlWindow = function (op) {
    /// <summary>打开窗口 Op = { url: "", title: "", width: 800, height: 600, callBack: function () { },isDialog:false ,zindex:0}</summary>
    var boxWindow = $("<div class='WeiWindow BoxShadow'><div class='TitleBar'><div class='Left TitleBarLeft'></div><div class='Mid TitleBarMid'></div>" +
            "<div class='Right TitleBarRight'><div class='CloseWindow'></div></div></div><div class='Content'><div class='Left ContentLeft'></div><div class='Mid ContentMid'>" +
            "<iframe src='' width='100%' height='100%' frameborder='0'></iframe></div><div class='Right ContentRight'></div></div><div class='Botoom'>" +
            "<div class='Left BottomLeft'></div><div class='Mid BottomMid'></div><div class='Right BottomRight'></div></div></div>");
    var deOp = { url: "", title: "", width: 800, height: 500, callBack: function () { }, isDialog: true, animate: false, onLoad: function () { } };
    deOp = $.extend(deOp, op);
    if (deOp.isDialog) {
        Easy.OpacityBackGround.Show(++Easy.MaxZindex);
    }
    boxWindow.appendTo("body");
    boxWindow.find(".Mid.TitleBarMid").DragElement(boxWindow, boxWindow.find(".CloseWindow"), boxWindow.find(".Right.ContentRight"), boxWindow.find(".Right.BottomRight"), boxWindow.find(".Mid.BottomMid"));
    if (!op.zindex) {
        boxWindow.css("z-index", ++Easy.MaxZindex);
    } else {
        boxWindow.css("z-index", op.zindex);
    }

    boxWindow.find(".CloseWindow").click(function () {
        if (deOp.isDialog) {
            Easy.OpacityBackGround.Close(deOp.callBack);
        } else {
            deOp.callBack.call();
        }
    });
    boxWindow.close = function () {
        boxWindow.find(".CloseWindow").click();
    }
    boxWindow.center = function () {
        boxWindow.animate({ left: (Easy.WindowSize().width - deOp.width) / 2, top: (Easy.WindowSize().height - deOp.height) / 2 }, { speed: 200 });
    }
    $(window).resize(function () {
        Easy.Processor(boxWindow.center, 300);
    });
    boxWindow.width(deOp.width);
    boxWindow.height(deOp.height);
    boxWindow.css("left", (Easy.WindowSize().width - deOp.width) / 2);
    boxWindow.css("top", (Easy.WindowSize().height - deOp.height) / 2);
    boxWindow.find(".Mid.TitleBarMid").html(deOp.title);

    var reSet = true;
    boxWindow.find("iframe").on("load", function () {
        if (deOp.title == "") {
            boxWindow.find(".Mid.TitleBarMid").html(this.contentWindow.document.title);
        }
        var w = Number($(this.contentWindow.document).find("body").attr("width"));
        var h = Number($(this.contentWindow.document).find("body").attr("height"));
        var anop = { width: boxWindow.width(), left: boxWindow.css("left"), height: boxWindow.height(), top: boxWindow.css("top"), go: false };
        if (w) {
            anop.width = w;
            anop.go = true;
            anop.left = Number(boxWindow.css("left").replace("px", "")) - ((w - boxWindow.width()) / 2);
        }
        if (h) {
            anop.height = h;
            anop.go = true;
            anop.top = Number(boxWindow.css("top").replace("px", "")) - ((h - boxWindow.height()) / 2);
        }
        if (anop.go && reSet) {
            boxWindow.animate(anop, 300);
        }
        reSet = false;
        deOp.onLoad.call(this.contentWindow, boxWindow);
    });
    boxWindow.find("iframe").attr("src", deOp.url);
    return boxWindow;
}

Easy.jQueryEasing = (function () {
    /// <summary>http://jqueryui.com/demos/effect/easing.html</summary>
    return { linear: "linear", swing: "swing", easeInQuad: "easeInQuad", easeOutQuad: "easeOutQuad", easeInOutQuad: "easeInOutQuad", easeInCubic: "easeInCubic", easeOutCubic: "easeOutCubic", easeInOutCubic: "easeInOutCubic", easeInQuart: "easeInQuart", easeOutQuart: "easeOutQuart", easeInOutQuart: "easeInOutQuart", easeInQuint: "easeInQuint", easeOutQuint: "easeOutQuint", easeInOutQuint: "easeInOutQuint", easeInSine: "easeInSine", easeOutSine: "easeOutSine", easeInOutSine: "easeInOutSine", easeInExpo: "easeInExpo", easeOutExpo: "easeOutExpo", easeInOutExpo: "easeInOutExpo", easeInCirc: "easeInCirc", easeOutCirc: "easeOutCirc", easeInOutCirc: "easeInOutCirc", easeInElastic: "easeInElastic", easeOutElastic: "easeOutElastic", easeInOutElastic: "easeInOutElastic", easeInBack: "easeInBack", easeOutBack: "easeOutBack", easeInOutBack: "easeInOutBack", easeInBounce: "easeInBounce", easeOutBounce: "easeOutBounce", easeInOutBounce: "easeInOutBounce" }
})();


/*jQuery扩展方法*/
jQuery.fn.extend({
    DragElement: function (targetEle, closeEle, ResizeE_Ele, ResizeNW_Ele, ResizeN_Ele) {
        /// <summary>让某个元素可以自由拖动示例：$("#box").DragElement();</summary>
        /// <param name="targetEle" type="jQuery">要移动的目标对象（如果是移动本身，请留空）</param>
        /// <param name="closeEle" type="jQuery">关闭按钮</param>
        /// <param name="ResizeE_Ele" type="jQuery">水平右调整大小</param>
        /// <param name="ResizeNW_Ele" type="jQuery">右下角调整大小</param>
        /// <param name="ResizeN_Ele" type="jQuery">垂直调整大小</param>
        var MouseX = 0;
        var MouseY = 0;
        var Qthis = this;
        if (!(targetEle instanceof jQuery)) {
            if (Qthis.css("position") != "absolute" && Qthis.css("position") != "fixed" && Qthis.css("position") != "relative") {
                Qthis.css("position", "relative");
            }
        }
        else {
            if (targetEle.css("position") != "absolute" && targetEle.css("position") != "fixed" && targetEle.css("position") != "relative") {
                targetEle.css("position", "relative");
            }
        }
        Qthis.css("cursor", "move");
        Qthis.bind("mousedown", { ac: "move" }, EleMouseDown);
        if (closeEle instanceof jQuery) {
            closeEle.click(function () {
                if (targetEle instanceof jQuery) {
                    targetEle.remove();
                }
                else {
                    Qthis.remove();
                }
            });
        }

        if (ResizeE_Ele instanceof jQuery) {
            ResizeE_Ele.css("cursor", "e-resize");
            ResizeE_Ele.bind("mousedown", { ac: "e-resize" }, EleMouseDown);
        }
        if (ResizeNW_Ele instanceof jQuery) {
            ResizeNW_Ele.css("cursor", "nw-resize");
            ResizeNW_Ele.bind("mousedown", { ac: "nw-resize" }, EleMouseDown);
        }
        if (ResizeN_Ele instanceof jQuery) {
            ResizeN_Ele.css("cursor", "n-resize");
            ResizeN_Ele.bind("mousedown", { ac: "n-resize" }, EleMouseDown);
        }

        function EleMouseDown(e) {
            MouseX = Easy.MousePosition(e).X;
            MouseY = Easy.MousePosition(e).Y;
            var ele = CreateHelpeDiv(e.data.ac);
            ele.bind("mousemove", { ac: e.data.ac }, BindItGo);
            ele.mouseup(mouseUp_Event);
            return false;
        }
        function BindItGo(e) {
            var MX = Easy.MousePosition(e).X;
            var MY = Easy.MousePosition(e).Y;
            var Tleft = 0, Ttop = 0;
            if (e.data.ac == "move") {
                if (targetEle instanceof jQuery) {
                    Tleft = parseInt(targetEle.css("left"));
                    Ttop = parseInt(targetEle.css("top"));
                    targetEle.css("left", Tleft + MX - MouseX);
                    targetEle.css("top", Ttop + MY - MouseY);
                }
                else {
                    Tleft = parseInt(Qthis.css("left"));
                    Ttop = parseInt(Qthis.css("top"));
                    Qthis.css("left", Tleft + MX - MouseX);
                    Qthis.css("top", Ttop + MY - MouseY);
                }
            }
            else if (e.data.ac == "e-resize") {
                if (targetEle instanceof jQuery) {
                    Tleft = targetEle.width();
                    targetEle.width(Tleft + MX - MouseX);
                }
                else {
                    Tleft = Qthis.width();
                    Qthis.width(Tleft + MX - MouseX);
                }
            }
            else if (e.data.ac == "nw-resize") {
                if (targetEle instanceof jQuery) {
                    Tleft = targetEle.width();
                    Ttop = targetEle.height();
                    targetEle.width(Tleft + MX - MouseX);
                    targetEle.height(Ttop + MY - MouseY);
                }
                else {
                    Tleft = Qthis.width();
                    Ttop = Qthis.height();
                    Qthis.width(Tleft + MX - MouseX);
                    Qthis.height(Ttop + MY - MouseY);
                }
            }
            else if (e.data.ac == "n-resize") {
                if (targetEle instanceof jQuery) {
                    Ttop = targetEle.height();
                    targetEle.height(Ttop + MY - MouseY);
                }
                else {
                    Ttop = Qthis.height();
                    Qthis.height(Ttop + MY - MouseY);
                }
            }
            MouseX = MX;
            MouseY = MY;
            return false;
        }
        function CreateHelpeDiv(cursor) {
            if (typeof cursor != "string")
                cursor = "move";
            var ele = $("<div style='cursor:" + cursor + ";background-color:Black;z-index:100000'></div>");

            ele.addClass("OtherFixed");

            ele.fadeTo(0, 0);
            $("body").append(ele);
            return ele;
        }
        function mouseUp_Event() {
            $(this).remove();
            return false;
        }
    }
});

/*********mousewheel**********/
jQuery.fn.extend({
    mousewheel: function (up, down, preventDefault) {
        /// <summary>鼠标滚轮事件$("#a").mousewheel(function (e, delta) {$(this).scrollTop($(this).scrollTop() - delta * 10);});</summary>
        return this.hover(
            function () { jQuery.event.mousewheel.giveFocus(this, up, down, preventDefault); },
            function () { jQuery.event.mousewheel.removeFocus(this); }
        );
    },
    mousewheeldown: function (fn, preventDefault) {
        return this.mousewheel(function () { }, fn, preventDefault);
    },
    mousewheelup: function (fn, preventDefault) {
        return this.mousewheel(fn, function () { }, preventDefault);
    },
    unmousewheel: function () {
        return this.each(function () {
            jQuery(this).unmouseover().unmouseout();
            jQuery.event.mousewheel.removeFocus(this);
        });
    },
    unmousewheeldown: jQuery.fn.unmousewheel,
    unmousewheelup: jQuery.fn.unmousewheel
});

jQuery.event.mousewheel = {
    giveFocus: function (el, up, down, preventDefault) {
        if (el._handleMousewheel) jQuery(el).unmousewheel();
        if (preventDefault == window.undefined && down && down.constructor != Function) {
            preventDefault = down;
            down = null;
        }
        el._handleMousewheel = function (event) {
            if (!event) event = window.event;
            if (preventDefault)
                if (event.preventDefault) event.preventDefault();
                else event.returnValue = false;
            var delta = 0;
            if (event.wheelDelta) {
                delta = event.wheelDelta / 120;
                if (window.opera) delta = -delta;
            } else if (event.detail) {
                delta = -event.detail / 3;
            }
            if (up && (delta > 0 || !down)) up.apply(el, [event, delta]);
            else if (down && delta < 0) down.apply(el, [event, delta]);
        };
        if (window.addEventListener)
            window.addEventListener('DOMMouseScroll', el._handleMousewheel, false);
        window.onmousewheel = document.onmousewheel = el._handleMousewheel;
    },
    removeFocus: function (el) {
        if (!el._handleMousewheel) return;
        if (window.removeEventListener)
            window.removeEventListener('DOMMouseScroll', el._handleMousewheel, false);
        window.onmousewheel = document.onmousewheel = null;
        el._handleMousewheel = null;
    }
};

jQuery.fn.extend({
    AutoScroll: function () {
        /// <summary>根据鼠标移动，自滚动内容,如果有图片，请在onload以后调用该方法</summary>
        var Qthis = $(this);
        var ChHeight = 100;
        Qthis.children().each(function () {
            ChHeight += $(this).outerHeight();
        });
        var Vdet = (ChHeight - Qthis.height()) / Qthis.height();
        var ChWidth = Qthis.children().width();
        var Hdet = (ChWidth - Qthis.width()) / Qthis.width();
        Qthis.bind("mousemove", move_Event);
        function move_Event(e) {
            var mouseY = Easy.MousePosition(e).Y - $(this).offset().top;
            var mouseX = Easy.MousePosition(e).X - $(this).offset().left;
            if (Vdet > 0)
                $(this).scrollTop(Vdet * mouseY);
            if (Hdet > 0)
                $(this).scrollLeft(Hdet * mouseX);
        }
        function FreshHeight() {
            ChHeight = Qthis.children().height() * Qthis.children().size();
            Vdet = (ChHeight - Qthis.height()) / Qthis.height();
            ChWidth = Qthis.children().width();
            Hdet = (ChWidth - Qthis.width()) / Qthis.width();
        }
        return FreshHeight;
    },
    MarqueeH: function (offset) {
        /// <summary>水平跑马灯</summary>
        if (typeof offset != "number")
            offset = 2;
        var JqThis = this;
        var maxleft = JqThis.children().width() - JqThis.width();
        if (maxleft < 0)
            return false;
        var Pac = 1;
        var stop = false;
        setInterval(AutoH, 50);
        JqThis.mouseenter(function () {
            stop = true;
        });
        JqThis.mouseleave(function () {
            stop = false;
        });
        function AutoH() {
            if (!stop) {
                if (Pac == 1)
                    JqThis.scrollLeft(JqThis.scrollLeft() + offset);
                else JqThis.scrollLeft(JqThis.scrollLeft() - offset);
            }
            if (JqThis.scrollLeft() >= maxleft)
            { Pac = 2; }
            if (JqThis.scrollLeft() == 0)
                Pac = 1;
        }
    },
    MarqueeV: function (offset) {
        /// <summary>垂直跑马灯</summary>
        if (typeof offset != "number")
            offset = 2;
        var JqThis = this;
        var maxTop = JqThis.children().height() - JqThis.height();
        if (maxTop < 0)
            return false;
        var Pac = 1;
        var stop = false;
        setInterval(AutoV, 50);
        JqThis.mouseenter(function () {
            stop = true;
        });
        JqThis.mouseleave(function () {
            stop = false;
        });
        function AutoV() {
            if (!stop) {
                if (Pac == 1)
                    JqThis.scrollTop(JqThis.scrollTop() + offset);
                else JqThis.scrollTop(JqThis.scrollTop() - offset);
            }
            if (JqThis.scrollTop() >= maxTop)
                Pac = 2;
            if (JqThis.scrollTop() == 0)
                Pac = 1;
        }
    }
});


jQuery.fn.extend({
    ImageCenter_Adapt: function (PaWidth, PaHeight, BackGroundColor) {
        /// <summary>图片居中显示-适应(应有一定大小的父容器)</summary>
        /// <param name="PaWidth" type="Int">父容器的宽度</param>
        /// <param name="PaHeight" type="Int">父容器的高度</param>
        /// <param name="BackGroundColor" type="String">父容器填充的背景色</param>
        var inde = 1;
        this.each(function () {
            var ht = inde;
            var Qthis = $(this);
            Qthis.css("display", "block");
            Qthis.hide();
            var Pa = Qthis.parent();
            Pa.css("display", "block");
            if (typeof PaWidth == "number") {
                Pa.width(PaWidth);
            }
            if (typeof PaHeight == "number") {
                Pa.height(PaHeight);
            }
            Pa.css("background-color", BackGroundColor);
            var s = Pa.width() / Pa.height();
            var Img = new Image();
            Img.onload = function () {
                var w = Img.width;
                var h = Img.height;
                var s2 = w / h;
                if (s > s2) {
                    Qthis.height(Pa.height());
                    Qthis.css("width", "auto");
                    Qthis.css("margin", "0px auto");
                }
                else {
                    Qthis.width(Pa.width());
                    Qthis.css("height", "auto");
                    Qthis.css("margin-top", (Pa.height() - Qthis.height()) / 2);
                }
                setTimeout(function () {
                    Qthis.fadeIn(300);
                }, ht * 50);
            }
            Img.src = Qthis.attr("src");
            inde++;
        });
    },
    ImageCenter_Full: function (PaWidth, PaHeight) {
        /// <summary>图片居中显示-填充(应有一定大小的父容器)</summary>
        /// <param name="PaWidth" type="Int">父容器的宽度</param>
        /// <param name="PaHeight" type="Int">父容器的高度</param>
        var inde = 1;
        this.each(function () {
            var ht = inde;
            var Qthis = $(this);
            Qthis.hide();
            var Pa = Qthis.parent();
            Pa.css("overflow", "hidden");
            if (typeof PaWidth == "number") {
                Pa.width(PaWidth);
            }
            if (typeof PaHeight == "number") {
                Pa.height(PaHeight);
            }
            var s = Pa.width() / Pa.height();
            var Img = new Image();
            Img.onload = function () {
                var w = Img.width;
                var h = Img.height;
                var s2 = w / h;
                if (s > s2) {
                    Qthis.width(Pa.width());
                    Qthis.css("height", "");
                    Qthis.css("margin-top", (Pa.height() - Qthis.height()) / 2);
                }
                else {
                    Qthis.height(Pa.height());
                    Qthis.css("width", "");
                    Qthis.css("margin-left", (Pa.width() - Qthis.width()) / 2);
                }
                setTimeout(function () {
                    Qthis.fadeIn(300);
                }, ht * 50);
            }
            Img.src = Qthis.attr("src");
            inde++;
        });
    }
});
$.fn.size = function () {
    return this.length;
}
$.ajaxSetup({
    beforeSend: function (xhr) {
        xhr.busyTimer = setTimeout(function() {
            Easy.Block();
        }, 3000);
    },
    complete: function (xhr, status) {
        clearTimeout(xhr.busyTimer);
        Easy.UnBlock();
    }
});
$(function () {
    if (!(/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent))) {
        $(document).on("click", ".pop-dialog", function () {
            Easy.ShowUrlWindow({
                url: $(this).data("url") || $(this).attr("href"),
                title: $(this).data("title") || $(this).attr("title"),
                width: $(this).data("width") || 800,
                height: $(this).data("height") || 500,
                isDialog: true
            });
            return false;
        });
    }
});