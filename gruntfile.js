module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    jst: {
      compile: {
        files: {
          ".tmp/scripts/templates.js": ["scripts/templates/*.ejs"]
        }
      }
    },
    watch: {
     jst: {
        files: ["js/templates/*.ejs"],
        tasks: ["jst"]
      }
    },
    clean: {
      test: {
        files: [{
          src: ['.tmp']
        }]
      }
    },
    coffee: {
      compileScripts: {
        expand: true,
        flatten: true,
        cwd: 'scripts',
        src: '**/*.coffee',
        dest: '.tmp/scripts',
        ext: '.js'
      },
      compileSpecs: {
        expand: true,
        flatten: true,
        cwd: 'spec',
        src: '**/*.coffee',
        dest: '.tmp/spec',
        ext: '.js'
      }
    },
    uglify: {
      my_target: {
        files: {'mapgruff.min.js': [
                                    'js/jquery-1.10.2.min.js',
                                    'js/vendor/underscore.js',
                                    'js/vendor/backbone.js',
                                    '.tmp/scripts/templates.js',
                                    '.tmp/scripts/mapUtility.js',
                                    'js/primary_types.js',
                                    '.tmp/scripts/incident.js',
                                    '.tmp/scripts/incidents.js',
                                    '.tmp/scripts/infoView.js',
                                    '.tmp/scripts/aboutView.js',
                                    'js/app.js',
                                   ]
        }
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', ['jst']);
  grunt.registerTask('compile', ['clean', 'jst', 'coffee']);
  grunt.registerTask('build', ['clean', 'jst', 'coffee', 'uglify']);
}
