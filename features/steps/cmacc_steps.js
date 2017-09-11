const url = require('path');
const assert = require('assert');
const cmacc = require('cmacc-compiler');

global.fs = require('fs');
global.fetch = require('node-fetch');

const opts = {
  base: __dirname
};

var { defineSupportCode } = require('cucumber');
defineSupportCode(function({ Given, When, Then }) {
  var ast;

  Given('I compile the {string} contract', (contract, callback) => {
    const file = url.join('file://', __dirname, `../../${contract}`);
    // TODO: returning the promise should also work, but it doesn't.
    cmacc.compile(file, opts).then(a => {
      ast = a;
      callback();
    });
  });

  Then('the value of {string} is {string}', (variable, expected, callback) => {
    callback();

    actual = ast;
    variable.split('.').forEach(key => (actual = actual[key]));
    assert.equal(actual, expected);
  });
});
