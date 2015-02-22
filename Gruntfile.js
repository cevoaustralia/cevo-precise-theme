/*global module:false*/
var path = require('path');

module.exports = function(grunt) {

  grunt.initConfig({

    express: {
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
    },

    release: {
      options: {
        npm: false
      }
    },
  });

  grunt.loadNpmTasks('grunt-express');
  grunt.loadNpmTasks('grunt-release');

  // Default task.
  grunt.registerTask('default', ['express', 'express-keepalive']);

};
