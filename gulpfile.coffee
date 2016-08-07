
gulp = require 'gulp'
gutil = require 'gulp-util'
del = require 'del'

sequence = require 'run-sequence'
express = require 'express'
expressDirectory = require 'serve-index'

sass = require 'gulp-sass'
autoprefixer = require 'gulp-autoprefixer'
sourcemaps = require 'gulp-sourcemaps'

browserify = require 'gulp-browserify'
rename = require 'gulp-rename'

plumber = require 'gulp-plumber'

argv = require( 'yargs' ).usage( 'Usage: $0 [--port]' ).argv

gulp.task 'scripts', ->
  gulp.src [ 'app/scripts/**/*.{coffee,cjsx}', '!app/scripts/**/_*.{coffee,cjsx}' ], read: false
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe browserify
      insertGlobals: false
      debug: true
      extensions: [ '.coffee', '.cjsx' ]
    .pipe rename (path) ->
      path.extname = '.js'
    .pipe sourcemaps.write()
    .pipe gulp.dest 'build/scripts'

gulp.task 'styles', ->
  gulp.src [ 'app/styles/**/*.{scss,sass,css}', '!app/styles/**/_*.{scss,sass}' ]
    .pipe plumber()
    .pipe sourcemaps.init()
    .pipe sass indentSyntax: true
    .pipe autoprefixer()
    .pipe sourcemaps.write()
    .pipe gulp.dest 'build/styles'

gulp.task 'images', ->
  gulp.src 'app/images/**/*'
  .pipe gulp.dest 'build/images'

gulp.task 'pages', ->
  gulp.src 'app/pages/**/*'
  .pipe gulp.dest 'build'

gulp.task 'clean', (cb) ->
  del [ 'build/**/*', '!.git*' ], cb

gulp.task 'server', (done) ->

  port = argv.port or '9080'

  app = express()
  app.use '/', express.static 'build'
  app.use '/', expressDirectory 'build'

  app.listen port

  gutil.log gutil.colors.green "Server started http://localhost:#{port}"


gulp.task 'watch', ->

  gulp.watch 'app/images/**/*', [ 'images' ]
  .on 'error', gutil.log

  gulp.watch 'app/styles/**/*', [ 'styles' ]
  .on 'error', gutil.log

  gulp.watch 'app/pages/**/*', [ 'pages' ]
  .on 'error', gutil.log

  gulp.watch [ 'app/scripts/**/*', 'app/lib/**/*' ], [ 'scripts' ]
  .on 'error', gutil.log

gulp.task 'default', (done) ->
  sequence 'clean', [ 'images', 'pages', 'styles', 'scripts' ], [ 'watch', 'server' ], done


