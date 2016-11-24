/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */
/*jQuery扩展方法*/
jQuery.fn.extend({
	FocusImages: function (data, speed) {
		/// <summary>焦点点图，DIV放空</summary>
		/// <param name="data" type="Json">Json对象，格式：{ "Pics": [{ "Url": "图片地址", "Target": "跳转地址,不需要则留空","Content":"图片文字说明" }]}</param>
		var CurrentIndex = 0, FuIndex = -1; var Data, foEl = this;
		var neIndex = -1; var GoTimeId = 0;
		var H_pi = 10, V_pi = 20;
		var defaul = { H_pieces: 10, V_pieces: 20 };
		H_pi = defaul.H_pieces;
		V_pi = defaul.V_pieces;
		Data = data;
		if (!Data || !Data.Pics || !Data.Pics[0].Url || typeof Data.Pics[0].Target != "string" || typeof Data.Pics[0].Content != "string") {
			alert("FocusImages()：给定的JSON数据格式不正确！\r\n例：{ Pics: [{ Url: '图片地址', Target: '跳转地址,不需要则留空',Content:'图片文字说明' }]}");
			return false;
		}
		if (typeof speed != "number")
			speed = 4000;
		var bgDiv = $("<div class='FocusInfoUl' style='background-color:Black'></div>");
		bgDiv.fadeTo(0, 0.6);
		foEl.append(bgDiv);
		foEl.css("display", "block");
		if (foEl.css("position") != "relative" && foEl.css("position") != "absolute" && foEl.css("position") != "fixed")
			foEl.css("position", "relative");
		foEl.css("overflow", "hidden");
		var ul = $("<ul class='FocusInfoUl'></ul>");
		var w = 100 / Data.Pics.length;
		for (var l = 0; l < Data.Pics.length; l++) {
			if (l == 0) {
				var li = "<li class='Focus-ul-li-cur' style='width:" + w + "%'><div></div><a href='javascript:void(0)'>" + Data.Pics[l].Content + "</a></li>";
				ul.append(li);
			}
			else {
				var li2 = "<li class='Focus-ul-li' style='width:" + w + "%'><div></div><a href='javascript:void(0)'>" + Data.Pics[l].Content + "</a></li>";
				ul.append(li2);
			}
		}
		ul.find("div").fadeTo(0, 0.3);
		foEl.append(ul);
		var ins = 0;
		foEl.find("ul a").each(function () {
			var tei = ins;
			$(this).click(function () { UserPlay(tei); $(this)[0].blur(); });
			ins++;
		});
		var img = new Image();
		img.onload = function () {
			AutoPlay();
		}
		img.src = Data.Pics[CurrentIndex].Url;
		img.onclick = function () {
			if (Data.Pics[CurrentIndex].Target != "")
				open(Data.Pics[CurrentIndex].Target);
		}
		foEl.append(img);
		function AutoPlay() {
			clearTimeout(GoTimeId);
			GoTimeId = setTimeout(function () {
				RandomAction();
			}, speed);
		}

		function UserPlay(i) {
			if (foEl.find(".tempDivSheet").length == 0 && CurrentIndex != i) {
				neIndex = i;
				RandomAction()
			}
		}
		/*开始随机效果*/
		function RandomAction() {
			FuIndex++;
			if (FuIndex == 9)
				FuIndex = 0;
			if (FuIndex <= 1)
				ActionFade();
			else if (FuIndex >= 2 && FuIndex <= 6)
				Action_V();
			else if (FuIndex == 7)
				Action_H();
			else if (FuIndex == 8)
				Action_H_Height();
		}

		function NextPic(fun) {
			if (neIndex == -1)
				CurrentIndex++;
			else CurrentIndex = neIndex;
			neIndex = -1;
			if (CurrentIndex >= Data.Pics.length) {
				CurrentIndex = 0;
			}
			foEl.find("li").each(function () {
				if ($(this).index() == CurrentIndex) {
					$(this).attr("class", "Focus-ul-li-cur");
				}
				else $(this).attr("class", "Focus-ul-li");
			});
			img.onload = function () {
				if (fun instanceof Function) {
					fun.call();
				}
				AutoPlay();
			}
			setTimeout(function () {
				img.src = Data.Pics[CurrentIndex].Url;
			}, 100);

		}

		/*水平切出*/
		function Action_H() {
			var Fw = foEl.width();
			var Fh = foEl.height();
			var itemH = Math.round(Fh / H_pi);
			for (var i = 0; i < H_pi; i++) {
				var item = $("<p class='tempDivSheet' style='display:block; position:absolute;padding:0px; margin:0px'></p>");
				item.css("height", itemH);
				item.css("width", Fw);
				item.css("background-image", "url('" + Data.Pics[CurrentIndex].Url + "')");
				item.css("background-position", "0px -" + itemH * i + "px");
				item.css("top", itemH * i);
				item.css("left", "0");
				foEl.append(item);
			}
			NextPic(DelayActionH);
			function DelayActionH() {
				var leorRi = 0;
				foEl.find(".tempDivSheet").each(function () {
					if (leorRi == 0) {
						$(this).animate({ "left": foEl.width() }, 800 * Math.random(), function () { $(this).remove(); });
						leorRi = 1;
					}
					else {
						$(this).animate({ "left": foEl.width() * -1 }, 800 * Math.random(), function () { $(this).remove(); });
						leorRi = 0;
					}
				});
			}
		}
		/*百页窗自上而下切入*/
		function Action_H_Height() {
			var Fw = foEl.width();
			var Fh = foEl.height();
			var itemH = Math.round(Fh / H_pi);
			var iteamBase = $("<div style='display:block; position:absolute;padding:0px; margin:0px; left:0px; top:0px'></div>");
			iteamBase.width(Fw);
			iteamBase.height(Fh);
			iteamBase.css("background-image", "url('" + Data.Pics[CurrentIndex].Url + "')");
			foEl.append(iteamBase);
			var NextPicSrc = 0;
			if (neIndex == -1)
				NextPicSrc = CurrentIndex + 1;
			else NextPicSrc = neIndex;
			if (NextPicSrc >= Data.Pics.length) {
				NextPicSrc = 0;
			}
			for (var i = 0; i < H_pi; i++) {
				var item = $("<p class='tempDivSheet' style='display:block; position:absolute;padding:0px; margin:0px'></p>");
				item.css("height", 0);
				item.css("width", Fw);
				item.css("background-image", "url('" + Data.Pics[NextPicSrc].Url + "')");
				item.css("background-position", "0px -" + itemH * i + "px");
				item.css("top", itemH * i);
				item.css("left", "0");
				foEl.append(item);
			}

			NextPic(DelayActionH);
			function DelayActionH() {
				var leorRi = 0;
				foEl.find(".tempDivSheet").each(function () {
					var q = this;
					setTimeout(function () {
						$(q).animate({ "height": itemH }, 350, function () {
							leorRi--;
							if (leorRi == 0) {
								iteamBase.remove();
								foEl.find(".tempDivSheet").remove();
							}
						});
					}, leorRi * 50);
					leorRi++;
				});
			}
		}
		/*垂直切出*/
		function Action_V() {
			var Fw = foEl.width();
			var Fh = foEl.height();
			var iteamW = Math.round(Fw / V_pi);
			for (var i = 0; i < V_pi; i++) {
				var item = $("<p class='tempDivSheet' style='display:block; position:absolute;padding:0px; margin:0px'></p>");
				item.css("height", Fh);
				item.css("width", iteamW);
				item.css("background-image", "url('" + Data.Pics[CurrentIndex].Url + "')");
				item.css("background-position", "-" + iteamW * i + "px 0px");
				item.css("top", 0);
				item.css("left", iteamW * i);
				foEl.append(item);
			}
			NextPic(LasDo);
			function LasDo() {
				if (FuIndex == 2)
					DelayActionV();
				else if (FuIndex == 3)
					DelayActionVClose_Random();
				else if (FuIndex == 4)
					DelayActionVClose_R();
				else if (FuIndex == 5)
					DelayActionVClose_L();
				else if (FuIndex == 6)
					DelayActionVClose_No();
			}
			function DelayActionV() {
				var leorRi = 0;
				foEl.find(".tempDivSheet").each(function () {
					if (leorRi == 0) {
						$(this).animate({ "top": foEl.height() }, 1000 * Math.random(), function () { $(this).remove(); });
						leorRi = 1;
					}
					else {
						$(this).animate({ "top": foEl.height() * -1 }, 1000 * Math.random(), function () { $(this).remove(); });
						leorRi = 0;
					}
				});
			}
			/*随机三效果组合切出*/
			function DelayActionVClose_Random() {
				foEl.find(".tempDivSheet").each(function () {
					var ra = Math.round(Math.random() * 10);
					if (ra < 4) {
						$(this).animate({ width: 0, left: foEl.width() }, 500, function () { $(this).remove(); });
					}
					else if (ra >= 4 && ra < 7) {
						$(this).animate({ width: 0, left: 0 }, 500, function () { $(this).remove(); });
					}
					else {
						$(this).animate({ width: 0 }, 500, function () { $(this).remove(); });
					}

				});
			}

			/*向右缩小飞出*/
			function DelayActionVClose_R() {
				foEl.find(".tempDivSheet").each(function () {
					$(this).animate({ width: 0, left: foEl.width(), opacity: 0 }, 1000 * Math.random(), function () { $(this).remove(); });
				});
			}

			/*向左缩小飞出*/
			function DelayActionVClose_L() {
				foEl.find(".tempDivSheet").each(function () {
					$(this).animate({ width: 0, left: 0, opacity: 0 }, 1000 * Math.random(), function () { $(this).remove(); });
				});
			}

			/*百页窗*/
			function DelayActionVClose_No() {
				foEl.find(".tempDivSheet").each(function () {
					$(this).animate({ width: 0 }, 1000 * Math.random(), function () { $(this).remove(); });
				});
			}
		}
		/*缩小淡出或淡出*/
		function ActionFade() {
			var Fw = foEl.width();
			var Fh = foEl.height();
			var item = $("<p class='tempDivSheet' style='display:block; position:absolute;padding:0px; margin:0px'></p>");
			item.height(Fh);
			item.width(Fw);
			item.css("top", "0");
			item.css("left", "0");
			item.css("background-image", "url('" + Data.Pics[CurrentIndex].Url + "')");
			foEl.append(item);
			NextPic(LastDo);
			function LastDo() {
				if (FuIndex == 0) {
					foEl.find(".tempDivSheet").animate({ "opacity": 0, width: 0, "height": 0, "top": foEl.height() / 2, "left": foEl.width() / 2, "background-position-x": foEl.width() / 2 * -1, "background-position-y": foEl.height() / 2 * -1 }, 500, function () { $(this).remove(); });
				} else {
					foEl.find(".tempDivSheet").animate({ opacity: 0 }, 500, function () { $(this).remove(); });
				}
			}
		}

	}
});