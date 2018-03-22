// gulpfile.js - https://jsua.co/mm-gulp

'use strict'; // http://www.w3schools.com/js/js_strict.asp

// 1. LOAD PLUGINS

var gulp = require('gulp');
var bourbon = require('bourbon').includePaths;
var neat = require('bourbon-neat').includePaths;
var critical = require('critical').stream;
var p = require('gulp-load-plugins')({ // This loads all the other plugins.
  DEBUG: false,
  pattern: ['gulp-*', 'gulp.*', 'del', 'run-*', 'browser*', 'vinyl-*'],
  rename: {
    'vinyl-source-stream': 'source',
    'vinyl-buffer': 'buffer',
    'gulp-util': 'gutil',
    'gulp-htmlmin': 'htmlmin',
    'gulp-gzip': 'gzip'
  },
});

// 2. CONFIGURATION

var
  src  = 'source/', // The Middleman source folder
  dest = '.tmp/',   // The "hot" build folder used by Middleman's external pipeline
  build = 'build/', // The build folder

  development = p.environments.development,
  production = p.environments.production,

  css = {
    in: src + 'assets/stylesheets/site.{css,scss,sass}',
    out: dest + 'assets/stylesheets/',
  },

  sassOpts = {
    imagePath: '../assets/images',
    includePaths: [bourbon, neat],
    errLogToConsole: true
  },

  autoprefixerOpts = {
    browsers: ['last 3 versions', '> 5%']
  },

  js = {
    in: src + 'assets/javascripts/*.{js,coffee}',
    out: dest + 'assets/javascripts/'
  },

  uglifyOpts = {
    output: {
      comments: 'uglify-save-license'
    }
  },

  images = {
    in: src + 'assets/images/*',
    out: dest + 'assets/images/'
  },

  serverOpts = {
    proxy: 'localhost:4567',
    open: true,
    reloadDelay: 700,
    files: [dest + '**/*.{js,css}', src + '**/*.{html,haml,markdown}']
  };

// 3. WORKER TASKS

// CSS Preprocessing
gulp.task('css', function() {
  return gulp.src(css.in)
    .pipe(development(p.sourcemaps.init()))
    .pipe(p.sass(sassOpts).on('error', p.sass.logError))
    .pipe(p.autoprefixer(autoprefixerOpts)).on('error', handleError)
    .pipe(production(p.cleanCss()))
    .pipe(production(p.rename('site.min.css')))
    .pipe(development(p.sourcemaps.write()))
    .pipe(gulp.dest(css.out));
});

// Javascript Bundling
gulp.task('js', function() {
  var b = p.browserify({
    entries: src + 'assets/javascripts/all.js',
    debug: true
  });

  return b.bundle().on('error', handleError)
    .pipe(p.source('bundle.js'))
    .pipe(production() ? p.buffer() : p.gutil.noop())
    .pipe(production(p.stripDebug()))
    .pipe(production() ? p.uglify(uglifyOpts) : p.gutil.noop())
    .pipe(production(p.rename('bundle.min.js')))
    .pipe(gulp.dest(js.out));
});

// Image Optimization
gulp.task('images', function() {
  return gulp.src(images.in)
    .pipe(p.changed(images.out))
    .pipe(p.imagemin())
    .pipe(gulp.dest(images.out));
});

// Clean .tmp/
gulp.task('clean', function() {
  p.del([
    dest + '*'
  ]);
});

// Asset Size Report
gulp.task('sizereport', function () {
  return gulp.src(dest + '**/*')
    .pipe(p.sizereport({
      gzip: true
    }));
});

// HTML minify
gulp.task('htmlmin', function() {
  return gulp.src(dest + '**/*.html')
    .pipe(p.htmlmin({ collapseWhitespace: true }))
    .pipe(gulp.dest(build));
});

//Gzip
gulp.task('gzip', function() {
  gulp.src([dest + '**/*.html', dest + '**/*.css', dest + '**/*.js'])
    .pipe(p.gzip({ append: true }))
    .pipe(gulp.dest(build));
});

// Critical CSS for production 
gulp.task('critical', function () {
  return gulp.src(build + '**/*.html')
    .pipe(critical({
      inline: true,
      base: build,
      css: ['build/assets/stylesheets/site.min.css'],
      minify: true,
      // inlineImages: true,
      ignore: ['@import']
    }))
    .on('error', handleError)
    .pipe(gulp.dest(dest));
});

// 4. SUPER TASKS

// Development Task
gulp.task('development', function(done) {
  //p.runSequence('clean', 'css', 'js', 'images', done);
  p.runSequence('clean', 'css', 'js', 'images', done);
});

// Production Task
gulp.task('production', function(done) {
  p.runSequence('clean', 'css', 'js', 'images', done);
});

// Called by after-build hook
gulp.task('critical-min', function(done) {
  p.runSequence('critical', 'htmlmin', 'gzip', 'sizereport', done);
});

// Default Task
// This is the task that will be invoked by Middleman's external pipeline when
// running 'middleman server'
gulp.task('default', ['development'], function() {

  p.browserSync.init(serverOpts);

  gulp.watch(css.in, ['css']);
  gulp.watch(js.in, ['js']);
  gulp.watch(images.in, ['images']);

});

function handleError(err) {
  console.log(err.toString());
  this.emit('end');
}
