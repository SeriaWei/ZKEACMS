function updateDisplay() {

    var width = document.getElementById("width").value;
    var height = document.getElementById("height").value;

    var textColor = document.getElementById("t-color").value;
    var backgroundColor = document.getElementById("b-color").value;

    //Border//
    var borderWidth = document.getElementById("border-width").innerHTML + "px";
    var borderColor = document.getElementById("bc-color").value;
    var borderStyle = document.getElementById("border-style").value;

    //Padding & Margins//
    var padding = document.getElementById("padding-custom").value;
    if (!padding) {
        padding = document.getElementById("padding").innerHTML + "px";
    }
    var margin = document.getElementById("margin-custom").value;
    if (!margin) {
        margin = document.getElementById("margin").innerHTML + "px";
    }

    //Fonts//
    var fontName = document.getElementById("font-name").value;
    var fontStyle = document.getElementById("font-style").value;
    var fontWeight = document.getElementById("font-weight").value;
    var fontSize = document.getElementById("font-size").innerHTML + "px";
    var fontVariant = document.getElementById("font-variant").value;
    var lineHeight = document.getElementById("line-height").innerHTML + "px";

    //Text Style//
    var textAlign = document.getElementById("text-align").value;
    var textDecoration = document.getElementById("text-decoration").value;
    var textIndent = document.getElementById("text-indent").innerHTML + "px";
    var letterSpacing = document.getElementById("letter-spacing").innerHTML + "px";
    var wordSpacing = document.getElementById("word-spacing").innerHTML + "px";
    var textTransform = document.getElementById("text-transform").value;

    //Background Styles//
    var backgroundImage = document.getElementById("background-image").value;
    if (backgroundImage) {
        backgroundImage = 'url(' + backgroundImage.replace("~/", "/") + ')';
    }
    var backgroundRepeat = document.getElementById("background-repeat").value;
    var backgroundPosition = document.getElementById("background-position").value;
    var backgroundAttachment = document.getElementById("background-attachment").value;
    var background = document.getElementById("background").value;

    //Position Style//
    var cssPosition = document.getElementById("position").value;
    var cssTop = document.getElementById("top").innerHTML + "px";
    var cssLeft = document.getElementById("left").innerHTML + "px";
    var cssRight = document.getElementById("right").innerHTML + "px";
    var cssBottom = document.getElementById("bottom").innerHTML + "px";

    //Extras//
    var cssCursor = document.getElementById("cursor").value;
    var cssVisibility = document.getElementById("visibility").value;
    var cssOverflow = document.getElementById("overflow").value;
    var cssFloat = document.getElementById("float").value;

    //CSS3 Styles//
    var borderRadius = document.getElementById("border-radius").innerHTML + "px";
    var textShadowH = document.getElementById("text-h-length").innerHTML + "px";
    var textShadowV = document.getElementById("text-v-length").innerHTML + "px";
    var textShadowB = document.getElementById("text-b-length").innerHTML + "px";
    var textShadowColor = document.getElementById("text-s-color").value;
    var boxShadowH = document.getElementById("box-h-length").innerHTML + "px";
    var boxShadowV = document.getElementById("box-v-length").innerHTML + "px";
    var boxShadowB = document.getElementById("box-b-length").innerHTML + "px";
    var boxShadowColor = document.getElementById("box-s-color").value;

    this.css = [];
    if (backgroundColor) {
        this.css.push('background-color:' + backgroundColor);
    }
    if (textColor) {
        this.css.push('color:' + textColor);
    }
    if (width) {
        this.css.push('width:' + width + 'px');
    }
    if (height) {
        this.css.push('height:' + height + 'px');
    }
    if (borderWidth !== "0px") {
        this.css.push('border:' + borderWidth + ' ' + borderStyle + ' ' + borderColor);
    }
    if (padding !== "0px") {
        this.css.push('padding:' + padding);
    }
    if (margin !== "0px") {
        this.css.push('margin:' + margin);
    }
    if (fontName) {
        this.css.push('font-family:' + fontName);
    }
    if (fontStyle) {
        this.css.push('font-style:' + fontStyle);
    }
    if (fontWeight) {
        this.css.push('font-weight:' + fontWeight);
    }
    if (fontSize !== "0px") {
        this.css.push('font-size:' + fontSize);
    }
    if (fontVariant) {
        this.css.push('font-variant:' + fontVariant);
    }
    if (lineHeight !== "0px") {
        this.css.push('line-height:' + lineHeight);
    }
    if (textAlign) {
        this.css.push('text-align:' + textAlign);
    }
    if (textDecoration) {
        this.css.push('text-decoration:' + textDecoration);
    }
    if (textIndent !== "0px") {
        this.css.push('text-indent:' + textIndent);
    }
    if (letterSpacing !== "0px") {
        this.css.push('letter-spacing:' + letterSpacing);
    }
    if (wordSpacing !== "0px") {
        this.css.push('word-spacing:' + wordSpacing);
    }
    if (textTransform) {
        this.css.push('text-transform:' + textTransform);
    }
    if (backgroundImage) {
        this.css.push('background-image:' + backgroundImage);
    }
    if (backgroundRepeat) {
        this.css.push('background-repeat:' + backgroundRepeat);
    }
    if (backgroundPosition) {
        this.css.push('background-position:' + backgroundPosition);
    }
    if (backgroundAttachment) {
        this.css.push('background-attachment:' + backgroundAttachment);
    }
    if (background) {
        this.css.push('background:' + background);
    }
    if (cssPosition) {
        this.css.push('position:' + cssPosition);
    }
    if (cssTop !== "0px") {
        this.css.push('top:' + cssTop);
    }
    if (cssLeft !== "0px") {
        this.css.push('left:' + cssLeft);
    }
    if (cssRight !== "0px") {
        this.css.push('right:' + cssRight);
    }
    if (cssBottom !== "0px") {
        this.css.push('bottom:' + cssBottom);
    }
    if (cssCursor) {
        this.css.push('cursor:' + cssCursor);
    }
    if (cssVisibility) {
        this.css.push('visibility:' + cssVisibility);
    }
    if (cssOverflow) {
        this.css.push('overflow:' + cssOverflow);
    }
    if (cssFloat) {
        this.css.push('float:' + cssFloat);
    }
    if (borderRadius !== "0px") {
        this.css.push('border-radius:' + borderRadius);
    }
    if (textShadowH !== "0px" || textShadowV !== "0px" || textShadowB !== "0px") {
        this.css.push('text-shadow:' + textShadowH + ' ' + textShadowV + ' ' + textShadowB + ' ' + textShadowColor);
    }
    if (boxShadowH !== "0px" || boxShadowV !== "0px" || boxShadowB !== "0px") {
        this.css.push('box-shadow:' + boxShadowH + ' ' + boxShadowV + ' ' + boxShadowB + ' ' + boxShadowColor);
    }
    this.css.push("");
    var target = window.top.$(".custom-style-target");
    if (target.hasClass('form-control')) {
        var oldValue = target.val();
        var styleReg = /style="([^"]*)"/g;
        if (this.css.length > 1) {
            if (styleReg.test(oldValue)) {
                target.val(oldValue.replace(styleReg, "style=\"" + $.trim(this.css.join(";")) + "\""));
            } else {
                target.val($.trim(oldValue) + (oldValue ? " " : "") + "style=\"" + $.trim(this.css.join(";")) + "\"");
            }
        } else {
            if (styleReg.test(oldValue)) {
                target.val($.trim(oldValue.replace(styleReg, "")));
            }
        }
    } else {
        target.attr("style", this.css.join(";"));
    }
    var cssResult = this.css.join(";\n");
    cssResult = "#CSS-Display {\n" + cssResult + '}\n';

    var codeDiv = document.getElementById("output");
    if (codeDiv.innerText) {
        codeDiv.innerText = cssResult;
    } else {
        codeDiv.textContent = cssResult;
    }

    $('style').remove();
    $('head').append('<style type="text/css">' + cssResult + '</style>');
    return cssResult;
}