module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    jst: {
      compile: {
        files: {
          ".tmp/js/templates.js": ["js/**/*.ejs"]
        }
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-jst');

  grunt.registerTask('default', ['jst']);
}
