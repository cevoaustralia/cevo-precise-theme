/*global module:false*/
var path = require('path');

module.exports = function(grunt) {

  grunt.initConfig({

    express: {
      default_option: {},
      custom: {
        options: {
          port: 9001,
          bases: './',
          server: path.resolve('server')
        }
      }
    },
    watch: {
      express: {
        files:  [ '**/*.template', '**/*.css' ],
        tasks:  [ 'express' ],
        options: {
          spawn: false
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-express');

  // Default task.
  grunt.registerTask('default', ['express', 'express-keepalive']);

};
