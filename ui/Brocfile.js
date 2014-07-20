/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

var app = new EmberApp();

app.import('vendor/bootstrap/dist/css/bootstrap.css');
app.import('vendor/bootstrap/dist/js/bootstrap.js');

var extraAssets = pickFiles('vendor/bootstrap/dist/fonts', {
    srcDir: '/',
    files: ['**/*'],
    destDir: '/fonts'
});

var tree = mergeTrees([app.toTree(), extraAssets]);

module.exports = tree;
