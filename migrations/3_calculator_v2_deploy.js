var CalculatorV2 = artifacts.require("./CalculatorV2.sol");

module.exports = function(deployer) {
  deployer.deploy(CalculatorV2,10);
};
