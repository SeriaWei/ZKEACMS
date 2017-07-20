$(document).ready(function () {
    $('.owl-carousel').each(function () {
        var time = 4;
        var $progressBar,
            $bar,
            $elem,
            isPause,
            tick,
            percentTime;
        var carousel = $(this);
        var items = carousel.find(".item").size();
        if (items === 0) return;
        var autoGo = items > 1;

        var img = new Image();
        img.onload = function () {
            var itemHieght = carousel.width() / (this.width / this.height);
            carousel.find(".item").height(itemHieght);
        }
        img.src = carousel.find(".item:first").data("image-url");
        carousel.owlCarousel({
            slideSpeed: 500,
            paginationSpeed: 500,
            singleItem: true,
            navigation: true,
            navigationText: [
                "<i class='fa fa-angle-left'></i>",
                "<i class='fa fa-angle-right'></i>"
            ],
            afterInit: progressBar,
            afterMove: moved,
            startDragging: pauseOnDragging
            //autoHeight : true,
            //transitionStyle: "fadeUp"
        });

        //Init progressBar where elem is $("#owl-demo")
        function progressBar(elem) {
            $elem = elem;
            //build progress bar elements
            buildProgressBar();
            //start counting
            start();
        }

        function buildProgressBar() {
            $progressBar = $("<div class='progressBar'>");
            $bar = $("<div class='bar'>");
            $progressBar.append($bar).appendTo($elem);
        }

        function start() {
            if (!autoGo) {
                return;
            }
            percentTime = 0;
            isPause = false;
            tick = setInterval(interval, 10);
        };

        function interval() {
            if (isPause === false) {
                percentTime += 1 / time;
                $bar.css({
                    width: percentTime + "%"
                });
                if (percentTime >= 100) {
                    $elem.trigger('owl.next');
                }
            }
        }
        function pauseOnDragging() {
            isPause = true;
        }
        function moved() {
            clearTimeout(tick);
            start();
        }
    });
});