var gulp = require('gulp');
var less = require('gulp-less');
var sourcemaps = require('gulp-sourcemaps');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');
var minify = require('gulp-minify');


function compileTheme(theme) {
    gulp.src(theme)
        .pipe(sourcemaps.init())
        .pipe(less())
        .pipe(sourcemaps.write())
        .pipe(gulp.dest(function (f) {
            return f.base;
        }))
        .pipe(cleanCSS({ inline: ['none'] }))
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest(function (f) {
            return f.base;
        }));
}

gulp.task('Compile-Default-Theme', function (cb) {
    compileTheme('src/ZKEACMS.WebHost/wwwroot/themes/Default/css/Theme.less')
    cb();
});

gulp.task('Auto-CompileTheme-MinifyJS', function (cb) {
    gulp.watch('src/ZKEACMS.WebHost/wwwroot/themes/Default/css/*.less', gulp.series('Compile-Default-Theme'));

    var jsWatch = gulp.watch(['src/**/*.js', '!src/**/*.min.js']);
    jsWatch.on('change', function (path, stats) {
        console.log(`Minify ${path}`);
        gulp.src(path)
            .pipe(minify({
                ext: { src: '.js', min: '.min.js' },
                noSource: true,
                preserveComments: "some"
            }))
            .on("error", function (error) {
                console.log(error.toString())
                this.emit('end')
            })
            .pipe(gulp.dest(function (f) {
                return f.base;
            }));
    });
    var cssWatch = gulp.watch(['src/**/*.css', '!src/**/*.min.css', '!src/ZKEACMS.WebHost/wwwroot/themes/*.min.css']);
    cssWatch.on('change',function(path){
        console.log(`Minify ${path}`);
        gulp.src(path)
        .pipe(cleanCSS({ inline: ['none'] }))
        .pipe(rename({
            suffix: '.min'
        }))
        .pipe(gulp.dest(function (f) {
            return f.base;
        }));
    });
    cb();
});