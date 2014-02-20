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
    }

  });

  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['jst']);
}
