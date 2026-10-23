var gulp = require('gulp');
var less = require('gulp-less');
var sourcemaps = require('gulp-sourcemaps');
var cleanCSS = require('gulp-clean-css');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify-es').default;
var saveLicense = require('uglify-save-license');

var THEMES_DIR = 'src/ZKEACMS.WebHost/wwwroot/themes';

function handleError(err) {
    console.log(err.toString());
    this.emit('end');
}

// Read a CLI argument, e.g. --file path/to.less
function argValue(name) {
    var index = process.argv.indexOf('--' + name);
    return index > -1 && process.argv[index + 1] ? process.argv[index + 1] : null;
}

// Compile less file(s) to css + min.css (+ source map), written next to the source
function compileLess(srcGlob) {
    var outputLog = [];
    return gulp.src(srcGlob)
        .on('data', function (file) {
            outputLog.push(file.path);
        })
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
        }))
        .on('end', function () {
            outputLog.forEach(function (p) {
                var base = p.replace(/\.less$/i, '');
                console.log('Output: ' + base + '.css, ' + base + '.min.css, ' + base + '.css.map');
            });
        });
}

function compileTheme(theme) {
    return compileLess(THEMES_DIR + '/' + theme + '/css/Theme.less');
}

function themeLessGlob(theme) {
    return THEMES_DIR + '/' + theme + '/css/*.less';
}

// Compile a single less file: gulp compile:less --file <path-to-less>
gulp.task('compile:less', function () {
    var file = argValue('file');
    if (!file) {
        throw new Error('Usage: gulp compile:less --file <path-to-less>');
    }
    return compileLess(file);
});

// Compile one theme: gulp compile:theme [--theme <name>]
gulp.task('compile:theme', function () {
    return compileTheme(argValue('theme') || 'Default');
});

// Compile every theme under the themes directory
gulp.task('compile:themes', function () {
    return compileLess(THEMES_DIR + '/*/css/Theme.less');
});

gulp.task('compile-theme:default', gulp.series('compile:theme'));

gulp.task('minify:all:js', function () {
    var count = 0;
    return gulp.src(['src/**/*.js', '!src/**/*.min.js', '!src/**/_references.js', '!src/**/bin/**', '!src/**/obj/**', '!src/ZKEACMS.WebHost/wwwroot/lib/**'])
        .pipe(uglify({ output: { comments: saveLicense } }))
        .on("error", handleError)
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(function (f) {
            return f.base;
        }))
        .on('data', function () {
            count++;
        })
        .on('end', function () {
            console.log('Output: minified ' + count + ' JS file(s) -> .min.js next to each source');
        });
});

// Alias of minify:all:js
// gulp minify:js == gulp minify:all:js
gulp.task('minify:js', gulp.series('minify:all:js'));

gulp.task('minify:all:css', function () {
    var count = 0;
    return gulp.src(['src/**/*.css', '!src/**/*.min.css', '!src/ZKEACMS.WebHost/wwwroot/themes/**/*.css', '!src/**/bin/**', '!src/**/obj/**', '!src/ZKEACMS.WebHost/wwwroot/lib/**'])
        .pipe(cleanCSS({ inline: ['none'] }))
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(function (f) {
            return f.base;
        }))
        .on('data', function () {
            count++;
        })
        .on('end', function () {
            console.log('Output: minified ' + count + ' CSS file(s) -> .min.css next to each source');
        });
});

// Alias of minify:all:css
// gulp minify:css == gulp minify:all:css
gulp.task('minify:css', gulp.series('minify:all:css'));

// Minify a single js/css file: gulp minify:file --file <path-to-js-or-css>
function minifyFile(path) {
    var isJs = /\.js$/i.test(path);
    var isCss = /\.css$/i.test(path);
    if (!isJs && !isCss) {
        throw new Error('Unsupported file type, expected a .js or .css file: ' + path);
    }
    var suffix = isJs ? '.min.js' : '.min.css';
    return gulp.src(path)
        .pipe(isJs ? uglify({ output: { comments: saveLicense } }) : cleanCSS({ inline: ['none'] }))
        .on("error", handleError)
        .pipe(rename({ suffix: '.min' }))
        .pipe(gulp.dest(function (f) {
            return f.base;
        }))
        .on('end', function () {
            console.log('Output: ' + path + ' -> ' + path.replace(/\.(js|css)$/i, suffix));
        });
}

gulp.task('minify:file', function () {
    var file = argValue('file');
    if (!file) {
        throw new Error('Usage: gulp minify:file --file <path-to-js-or-css>');
    }
    return minifyFile(file);
});

gulp.task('minify', gulp.parallel('minify:all:js', 'minify:all:css'));
gulp.task('minify:js-css', gulp.parallel('minify:all:js', 'minify:all:css'));

gulp.task('watch:minify-js-css', function () {
    gulp.watch(themeLessGlob('Default'), gulp.series('compile:theme'));

    var jsWatch = gulp.watch(['src/**/*.js', '!src/**/*.min.js', '!src/**/_references.js', '!src/**/bin/**', '!src/**/obj/**', '!src/ZKEACMS.WebHost/wwwroot/lib/**']);
    jsWatch.on('change', function (path) {
        console.log('Minify ' + path + ' -> ' + path.replace(/\.js$/i, '.min.js'));
        gulp.src(path)
            .pipe(uglify({ output: { comments: saveLicense } }))
            .on("error", handleError)
            .pipe(rename({ suffix: '.min' }))
            .pipe(gulp.dest(function (f) {
                return f.base;
            }));
    });

    var cssWatch = gulp.watch(['src/**/*.css', '!src/**/*.min.css', '!src/ZKEACMS.WebHost/wwwroot/themes/**/*.css', '!src/**/bin/**', '!src/**/obj/**', '!src/ZKEACMS.WebHost/wwwroot/lib/**']);
    cssWatch.on('change', function (path) {
        console.log('Minify ' + path + ' -> ' + path.replace(/\.css$/i, '.min.css'));
        gulp.src(path)
            .pipe(cleanCSS({ inline: ['none'] }))
            .pipe(rename({ suffix: '.min' }))
            .pipe(gulp.dest(function (f) {
                return f.base;
            }));
    });
});