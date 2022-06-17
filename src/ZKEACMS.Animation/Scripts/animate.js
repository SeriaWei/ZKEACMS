/* http://www.zkea.net/
 * Copyright (c) ZKEASOFT. All rights reserved.
 * http://www.zkea.net/licenses */

(function () {
    this.animation = (function () {
        function animation(options) {
            this.default = { selector: ".widget:not(.no-animate)", animated: "animate__animated", animation: "animate__fadeInUp" };
            Object.assign(this.default, options);
        }
        animation.prototype.doAnimate = function () {
            for (let i = 0; i < this.elements.length; i++) {
                const element = this.elements[i];

                if (Number(element.dataset.offsetTop) <= window.scrollY + window.innerHeight) {
                    element.style.setProperty("animation-play-state", null);
                    this.elements.splice(i, 1);
                    i--;
                }
            }
        };
        animation.prototype.init = function () {
            this.elements = [];
            var matchedElements = document.querySelectorAll(this.default.selector);
            var docHeight = document.body.clientHeight;
            for (let i = 0; i < matchedElements.length; i++) {
                const element = matchedElements[i];
                var rec = element.getBoundingClientRect();
                if (rec.top > window.innerHeight && (element.offsetTop + element.clientHeight + 50) < docHeight) {
                    element.dataset.offsetTop = rec.top;
                    element.style.setProperty("animation-play-state", "paused");
                    element.classList.add(this.default.animated, this.default.animation);
                    element.addEventListener("animationend", function () {
                        for (var i = 0; i < this.classList.length; i++) {
                            if (this.classList[i].startsWith("animate__")) {
                                this.classList.remove(this.classList[i]);
                                this.removeAttribute("data-offset-top");
                                i--;
                            }
                        }
                    });
                    this.elements.push(element);
                }
            }
            var animationInstance = this;
            window.addEventListener("scroll", function () {
                if (animationInstance.animationTime) clearTimeout(animationInstance.animationTime);

                animationInstance.animationTime = setTimeout(animateCaller, 50);
            });
            function animateCaller() {
                animationInstance.doAnimate.call(animationInstance);
            }
        };
        return animation;
    })();
}).call(this);

setTimeout(function () { new animation().init(); }, 100);