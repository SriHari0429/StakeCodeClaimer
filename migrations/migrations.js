const StakeCodeClaimer = artifacts.require("StakeCodeClaimer");

module.exports = function (deployer) {
  deployer.deploy(StakeCodeClaimer);
};
