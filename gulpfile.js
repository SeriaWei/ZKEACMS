var gulp = require('gulp');
var less = require('gulp-less');
var sourcemaps = require('gulp-sourcemaps');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');

function compileTheme(theme){
    gulp.src(theme)
    .pipe(sourcemaps.init())
    .pipe(less())
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(function (f) {
        return f.base;
    }))
    .pipe(cleanCSS({inline: ['none']}))
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

gulp.task('Watch-Theme', function (cb) {
    gulp.watch('src/ZKEACMS.WebHost/wwwroot/themes/Default/css/*.less', gulp.series('Compile-Default-Theme'));
    cb();
});