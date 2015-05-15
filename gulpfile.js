var gulp = require('gulp'),
	concat = require('gulp-concat'),
	uglify = require('gulp-uglify'),
	angularFileSort = require('gulp-angular-filesort');

var tasks = {
	build: function(){
		gulp.src('./app/index.html')
			.pipe(gulp.dest('./build'));

		gulp.src('./app/partials/**/*.html')
			.pipe(gulp.dest('./build/partials'));

		gulp.src('./app/css/**/*.css')
			.pipe(gulp.dest('./build/css'));

		gulp.src('./app/fonts/**/*.*')
			.pipe(gulp.dest('./build/fonts'));

		gulp.src([
			'./app/lib/b64.js',
			'./app/lib/jquery-2.0.3.min.js',
			'./app/lib/hammer.js',
			'./app/lib/bootstrap.js',
			'./app/lib/angular.js',
			'./app/lib/angular-route.js',
			'./app/lib/angular-resource.js',
			'./app/lib/angular-hammer.js',
		])
			.pipe(concat('deps.js'))
			.pipe(gulp.dest('./build/js'));

		gulp.src(['./app/js/**/*.js'])
			.pipe(angularFileSort())
			.pipe(concat('main.js'))
			// .pipe(uglify())
			.pipe(gulp.dest('./build/js'));

	}
};

gulp.task('build', tasks.build);
gulp.task('default', tasks.build);