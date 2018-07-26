var TweetAccount = artifacts.require("TweetAccount");

contract('TweetAccount', function (accounts) {

    it("tweet", function () {
        var tweetAccountInstance;

        return TweetAccount.deployed().then(function (instance) {
            tweetAccountInstance = instance;
            return tweetAccountInstance.tweet("hello world");
        }).then(function (id) {
            console.info(id);
            return tweetAccountInstance.getLatestTweet();
        }).then(function (response, timestamp, numberOfTweets) {
            console.info(response[0])
            console.info(new Date(TweetAccount.web3.toDecimal(response[1])))
            console.info(response[2].toString())
        });
    });

    it("getOwnerAddress", function () {
        var tweetAccountInstance;

        return TweetAccount.deployed().then(function (instance) {
            tweetAccountInstance = instance;
            return tweetAccountInstance.getOwnerAddress.call();
        }).then(function (adminAddress) {
            console.info(adminAddress)
        });
    });

    it("getNumberOfTweets", function () {
        var tweetAccountInstance;

        return TweetAccount.deployed().then(function (instance) {
            tweetAccountInstance = instance;
            return tweetAccountInstance.getNumberOfTweets.call();
        }).then(function (numberOfTweets) {
            console.info(numberOfTweets)
        });
    });
});