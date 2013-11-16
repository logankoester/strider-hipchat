module.exports = (grunt) ->

  grunt.initConfig

    clean:
      lib: ['lib/']
      test: ['test/']

    jade:
      config:
        src: ['src/config/**/*.jade']
        dest: 'config/'
        options:
          basePath: 'src/config/'
          client: false
          locals: {}

    watch:
      gruntfile:
        files: 'Gruntfile.coffee'
        tasks: ['jshint:gruntfile']

      lib_test:
        files: ['src/lib/**/*.coffee', 'src/test/**/*.coffee']
        tasks: ['default']

    nodeunit:
      tests: ['test/*_test.js']

    coffee:
      lib:
        expand: true
        cwd: 'src/lib/'
        src: '**/*.coffee'
        dest: 'lib/'
        ext: '.js'

      config:
        expand: true
        cwd: 'src/config/'
        src: '**/*.coffee'
        dest: 'config/'
        ext: '.js'

      test:
        expand: true
        cwd: 'src/test/'
        src: '**/*.coffee'
        dest: 'test/'
        ext: '.js'

      bump:
        options:
          commit: true
          commitMessage: 'Release v%VERSION%'
          commitFiles: ['package.json']
          createTag: true
          tagName: 'v%VERSION%'
          tagMessage: 'Version %VERSION%'
          push: false

  grunt.loadNpmTasks 'grunt-contrib-nodeunit'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-bump'

  grunt.registerTask 'build', ['clean', 'coffee', 'jade']

  grunt.registerTask 'default', ['build', 'nodeunit']
