// Start sails and pass it command line arguments
require('coffee-script');
require('sails').lift(require('optimist').argv);
