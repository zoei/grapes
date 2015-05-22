var gulp = require('gulp'),
    del = require('del'),
    gutil = require('gulp-util'),
    stylus = require('gulp-stylus'),
    coffee = require('gulp-coffee'),
    js2coffee = require('gulp-js2coffee'),
    concat = require('gulp-concat'),
    uglify = require('gulp-uglify'),
    angularFileSort = require('gulp-angular-filesort');

var tasks = {
    clean: function() {
        del.sync(['./build/www'], {
            force: true
        });
    },
    res: function(index) {
        index = index || 'index';
        gulp.src('./app/' + index + '.html')
            .pipe(concat('index.html'))
            .pipe(gulp.dest('./build/www'));

        gulp.src([
                './app/css/ratchet.min.css'
                // './app/css/ratchet-theme-ios.min.css'
            ])
            .pipe(concat('deps.css'))
            .pipe(gulp.dest('./build/www/css'));

        gulp.src('./app/fonts/**/*.*')
            .pipe(gulp.dest('./build/www/fonts'));

        gulp.src('./app/data/**/*.*')
            .pipe(gulp.dest('./build/www/data'));

        gulp.src([
                './app/lib/b64.js',
                './app/lib/jquery-2.0.3.min.js',
                './app/lib/hammer.js',
                // './app/lib/jquery.hammer.js',
                './app/lib/jquery.ba-resize.js',
                './app/lib/iscroll.js',
                './app/lib/ratchet.min.js',
                // './app/lib/push.js',
                './app/lib/angular.js',
                './app/lib/angular-route.js',
                './app/lib/angular-resource.js',
                './app/lib/angular-hammer.js',
            ])
            .pipe(concat('deps.js'))
            // .pipe(uglify())
            .pipe(gulp.dest('./build/www/js'));
    },
    tpl: function() {
        return gulp.src('./app/partials/**/*.html')
            .pipe(gulp.dest('./build/www/partials'));
    },
    stylus: function() {
        return gulp.src('./app/style/grapes.styl')
            .pipe(stylus())
            .pipe(concat('grapes.css'))
            .pipe(gulp.dest('./build/www/css'));
    },
    js: function() {
        return gulp.src(['./app/js/**/*.js'])
            .pipe(angularFileSort())
            .pipe(concat('grapes.js'))
            // .pipe(uglify())
            .pipe(gulp.dest('./build/www/js'));
    },
    coffee2js: function() {
        return gulp.src(['./app/coffee/**/*.coffee'])
            .pipe(coffee({
                bare: true
            }).on('error', gutil.log))
            .pipe(angularFileSort())
            .pipe(concat('grapes.js'))
            // .pipe(uglify())
            .pipe(gulp.dest('./build/www/js'));
    },
    js2coffee: function() {
        return gulp.src(['./app/js/**/*.js'])
            .pipe(js2coffee().on('error', gutil.log))
            .pipe(gulp.dest('./build/coffee'));
    }
};

gulp.task('clean', tasks.clean);
gulp.task('tpl', tasks.tpl);
gulp.task('res', function(){return tasks.res('index')});
gulp.task('res_app', function(){return tasks.res('index_app')});
gulp.task('stylus', tasks.stylus);
gulp.task('coffee2js', tasks.coffee2js);
gulp.task('js2coffee', tasks.js2coffee);
gulp.task('default', ['clean', 'coffee2js', 'stylus', 'tpl', 'res']);
gulp.task('app', ['clean', 'coffee2js', 'stylus', 'tpl', 'res_app']);
