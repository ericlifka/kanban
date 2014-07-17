/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var compileLess = require('broccoli-less-single');

var app = new EmberApp();

app.import('vendor/bootstrap/dist/css/bootstrap.css');
app.import('vendor/bootstrap/dist/js/bootstrap.js');

var tree = app.toTree();

compileLess([tree], 'styles/app.less', 'styles/app.css');

module.exports = tree;
