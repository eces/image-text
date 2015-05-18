module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      dev:
        expand: true
        flatten: false
        src: [
          'src/*.coffee'
        ]
        ext: '.js'
        options:
          bare: true
      prod:
        expand: true
        flatten: false
        src: [
          'src/*.coffee'
        ]
        dest: 'lib'
        ext: '.js'
        options:
          bare: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-newer'

  grunt.registerTask 'default', () ->
    grunt.log.writeln 'Usage:'
    grunt.log.writeln """
    \tgrunt dev
    \tgrunt build
    \tgrunt test
    """['yellow'].bold
  grunt.register 'dev', ['coffee:dev']
  grunt.register 'build', ['coffee:prod']