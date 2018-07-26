var Web3 = require("web3");

var contract = require("truffle-contract");
var data = require("../build/contracts/WeiboRegistry.json");

var WeiboRegistry = contract(data);

var provider = new Web3.providers.HttpProvider("http://localhost:8545");
WeiboRegistry.setProvider(provider);

// console.info(WeiboRegistry.web3.eth.accounts)
var deployed;
WeiboRegistry.deployed().then(function (instance) {
    var deployed = instance;
    return instance.adminDeleteRegistry({from: WeiboRegistry.web3.eth.accounts[0]});
}).then(function (result) {
    // Do something with the result or continue with more transactions.
    console.info(result);
});