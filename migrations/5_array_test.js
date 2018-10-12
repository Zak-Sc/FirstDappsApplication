var arrayTest=artifacts.require('./arrayTest.sol');

module.exports = function(deployer) {
  deployer.deploy(arrayTest,"krid");
};
