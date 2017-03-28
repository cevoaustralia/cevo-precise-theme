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

    less: {
     development: {
        options: {
          paths: ['assets/less']
        },
        files: {
          'assets/css/styles.css': 'assets/less/styles.less'
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-express');
  grunt.loadNpmTasks('grunt-release');
  grunt.loadNpmTasks('grunt-contrib-less');
  // Default task.
  grunt.registerTask('default', ['express', 'express-keepalive']);

};
