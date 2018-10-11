var Calculator = artifacts.require("./CalculatorV2.sol");

module.exports = function(deployer) {
  deployer.deploy(CalculatorV2,100);
};
