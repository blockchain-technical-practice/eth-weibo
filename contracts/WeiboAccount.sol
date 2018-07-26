pragma solidity ^0.4.10;


/**
    微博账户
*/
contract WeiboAccount {

    // data structure of a single Weibo
    struct Weibo {
    uint timestamp;
    string weiboString;
    }

    // 这个微博账号的所有的微博，微博ID映射微博内容
    mapping (uint => Weibo) _weibos;

    // 账户发的微博的数量
    uint _numberOfWeibos;

    // 微博账户的所有者
    address _adminAddress;

    modifier onlyAdmin {
        require(msg.sender == _adminAddress);
        _;
    }

    // 微博合约的构造方法
    function WeiboAccount() {
        _numberOfWeibos = 0;
        _adminAddress = msg.sender;
    }

    // 发新微博
    function weibo(string weiboString) onlyAdmin {

        // 微博长度小于160
        require(bytes(weiboString).length <= 160);

        _weibos[_numberOfWeibos].timestamp = now;
        _weibos[_numberOfWeibos].weiboString = weiboString;
        _numberOfWeibos++;
    }

    // 根据ID查找微博
    function getWeibo(uint weiboId) constant returns (string weiboString, uint timestamp) {
        weiboString = _weibos[weiboId].weiboString;
        timestamp = _weibos[weiboId].timestamp;
    }

    // 返回最新一条微博
    function getLatestWeibo() constant returns (string weiboString, uint timestamp, uint numberOfWeibos) {
        // returns three values
        weiboString = _weibos[_numberOfWeibos - 1].weiboString;
        timestamp = _weibos[_numberOfWeibos - 1].timestamp;
        numberOfWeibos = _numberOfWeibos;
    }

    //返回微博账户所有者
    function getOwnerAddress() constant returns (address adminAddress) {
        return _adminAddress;
    }

    // 返回微博总数
    function getNumberOfWeibos() constant returns (uint numberOfWeibos) {
        return _numberOfWeibos;
    }

    // 取回打赏
    function adminRetrieveDonations(address receiver) onlyAdmin {
        assert(receiver.send(this.balance));
    }

    // 摧毁合约
    function adminDeleteAccount() onlyAdmin {
        selfdestruct(_adminAddress);
    }

    event LogDonate(address indexed from, uint256 _amount);

    // 接受别人的打赏
    function() payable {
        LogDonate(msg.sender, msg.value);
    }
}
