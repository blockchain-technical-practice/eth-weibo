var WeiboRegistry = artifacts.require("WeiboRegistry");

module.exports = function(deployer) {
  deployer.deploy(WeiboRegistry);
};
