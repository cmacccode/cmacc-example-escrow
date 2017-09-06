const url = require('path');
const assert = require('assert');
const cmacc = require('cmacc-compiler');

describe('helpers_definition_ref_in_def', function () {

  global.fs = require('fs');
  global.fetch = require('node-fetch');

  const opts = {
    base: __dirname
  };

  it('Escrow', function (done) {
    const file = url.join('file://', __dirname, './Escrow.cmacc');

    cmacc.compile(file, opts)
      .then(ast => {
        assert.equal(ast.seller.full_Name, "name_Full");
        assert.equal(ast.purchaser.full_Name, "name_Full");
        assert.equal(ast.escrow.full_Name, "name_Full");
        assert.equal(ast.arbitrator.full_Name, "name_Full");
        assert.equal(ast.shipper.full_Name, "name_Full");
        done();
      })
      .catch(done);

  });

  it('Step1_Parties', function (done, opts) {
    const file = url.join('file://', __dirname, './Step1_Parties.cmacc');

    cmacc.compile(file)
      .then(ast => {
        assert.equal(ast.seller.full_Name, "Gerry's Grapes, LLC");
        assert.equal(ast.purchaser, undefined);
        assert.equal(ast.escrow.full_Name, "Safe Hands Facilitated Transactions, Inc.");
        assert.equal(ast.arbitrator.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.shipper.full_Name, "Fabulous Express, Inc.");

        assert.equal(ast.deal.seller.full_Name, "Gerry's Grapes, LLC");
        assert.equal(ast.deal.purchaser.full_Name, "name_Full");
        assert.equal(ast.deal.escrow.full_Name, "Safe Hands Facilitated Transactions, Inc.");
        assert.equal(ast.deal.arbitrator.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.deal.shipper.full_Name, "Fabulous Express, Inc.");


        done();
      })
      .catch(done);

  });

  it('Step2_Order', function (done, opts) {
    const file = url.join('file://', __dirname, './Step2_Order.cmacc');

    cmacc.compile(file)
      .then(ast => {
        assert.equal(ast.purchaser.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");

        assert.equal(ast.deal.seller.full_Name, "Gerry's Grapes, LLC");
        assert.equal(ast.deal.purchaser.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.deal.escrow.full_Name, "Safe Hands Facilitated Transactions, Inc.");
        assert.equal(ast.deal.arbitrator.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.deal.shipper.full_Name, "Fabulous Express, Inc.");

        done();
      })
      .catch(done);

  });

  it('Step3_Signature', function (done, opts) {
    const file = url.join('file://', __dirname, './Step3_Signature.cmacc');

    cmacc.compile(file)
      .then(ast => {

        assert.equal(ast.deal.seller.full_Name, "Gerry's Grapes, LLC");
        assert.equal(ast.deal.purchaser.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.deal.escrow.full_Name, "Safe Hands Facilitated Transactions, Inc.");
        assert.equal(ast.deal.arbitrator.full_Name, "{{individual.first_Name}} {{individual.last_Name}}");
        assert.equal(ast.deal.shipper.full_Name, "Fabulous Express, Inc.");

        done();
      })
      .catch(done);

  });


});