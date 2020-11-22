var gulp = require('gulp');
var less = require('gulp-less');
var sourcemaps = require('gulp-sourcemaps');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify-es').default;
var saveLicense = require('uglify-save-license');

function handleError(err) {
    console.log(err.toString());
    this.emit('end');
}
function compileTheme(theme) {
    gulp.src('src/ZKEACMS.WebHost/wwwroot/themes/' + theme + '/css/Theme.less')
        .pipe(sourcemaps.init())
        .pipe(less())
        .on("error", handleError)
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
function themeFilter(theme) {
    return 'src/ZKEACMS.WebHost/wwwroot/themes/' + theme + '/css/*.less';
}
gulp.task('compile-theme:default', function (cb) {
    compileTheme('Default');
    cb();
});

gulp.task('watch:minify-js-css', function (cb) {
    gulp.watch(themeFilter('Default'), gulp.series('compile-theme:default'));

    var jsWatch = gulp.watch(['src/**/*.js', '!src/**/*.min.js']);
    jsWatch.on('change', function (path, stats) {
        console.log(`Minify ${path}`);
        gulp.src(path)            
			.pipe(uglify({ output: { comments: saveLicense } }))
            .on("error", handleError)
            .pipe(rename({ suffix: ".min" }))
            .pipe(gulp.dest(function (f) {
                return f.base;
            }));
    });
    var cssWatch = gulp.watch(['src/**/*.css', '!src/**/*.min.css', '!src/ZKEACMS.WebHost/wwwroot/themes/**/*.css']);
    cssWatch.on('change', function (path) {
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