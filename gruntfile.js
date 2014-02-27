module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    jst: {
      compile: {
        files: {
          ".tmp/js/templates.js": ["js/**/*.ejs"]
        }
      }
    },
    watch: {
     jst: {
        files: ["js/templates/*.ejs"],
        tasks: ["jst"]
      }
    },
    coffee: {
      compileScripts: {
        expand: true,
        flatten: true,
        cwd: 'js',
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
    }

  });

  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['jst']);
}
