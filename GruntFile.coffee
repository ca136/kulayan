module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # Project configuration.
  grunt.initConfig(
    pkg: grunt.file.readJSON 'package.json'

    jade:
      options:
        pretty: true

      main:
        files: [
          src: [ 'website/templates/jade/*.html' ]
          dest: 'website/templates/'
          expand: true
          flatten: true
        ]

    stylus:
      compile:
        files:
          'static/css/main.css': [ 'static/css/stylus/*.styl' ]

    coffee:
      compile:
        files:
          'static/js/output.js': [
            'static/coffee/app.coffee'
            'static/coffee/*.coffee'
            'static/coffee/controllers/*.coffee'
            'static/coffee/services/*.coffee'
            'static/coffee/directives/*.coffee'
          ]


    watch:
      # jade:
      #   files: [ 'website/templates/jade/*.html' ]
      #   tasks: [ 'jade' ]

      stylus:
        files: [ 'static/css/**/*.styl' ]
        tasks: [ 'stylus' ]

      coffee:
        files: [ 'static/coffee/**/*.coffee' ]
        tasks: [ 'coffee' ]

  )

  # Default task(s).
  # grunt.registerTask 'jade', ['jade']
