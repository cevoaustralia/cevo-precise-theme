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
    },
    copy: {
      build: {
        src: [ '**', '!**/node_modules/**',
          "!gitignore", '!Gruntfile.js', '!server.coffee', '!README.md'],
        dest: 'build',
        expand: true
      }
    },

    release: {
      options: {
        npm: false //default: true
      }
    },
    clean: ["build"]
  });

  grunt.loadNpmTasks('grunt-express');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-release');

  // Default task.
  grunt.registerTask('default', ['express', 'express-keepalive']);

  grunt.registerTask('build', [
    'clean', 'copy:build'
    ]);

};
