module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    concat: {
      options: {
        separator: ";"
      },
      dist: {
        src: [],
        dest: ''
      },
    }
  });
}
