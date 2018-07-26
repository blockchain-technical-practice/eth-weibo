var TweetRegistry = artifacts.require("TweetRegistry");

contract('TweetRegistry', function (accounts) {

    it("list", function () {
        var tweetRegistryInstance;

        return TweetRegistry.deployed().then(function (instance) {
            tweetRegistryInstance=instance;
            return tweetRegistryInstance.list.call();
        }).then(function (list) {
            console.info(list)
        });
    });
});