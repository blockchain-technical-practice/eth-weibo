pragma solidity ^0.4.10;


/**
    微博管理平台
*/

contract WeiboRegistry {

    // 根据账户昵称，id，地址 查找微博账户
    mapping (address => string) _addressToAccountName;

    mapping (uint => address) _accountIdToAccountAddress;

    mapping (string => address) _accountNameToAddress;


    // 平台上所有的注册账户数量
    uint _numberOfAccounts;

    // 微博平台管理员
    address _registryAdmin;


    modifier onlyRegistryAdmin {
        require(msg.sender == _registryAdmin);
        _;
    }

    // 微博平台构造函数
    function WeiboRegistry() {
        _registryAdmin = msg.sender;
        _numberOfAccounts = 0;
    }

    // 在平台上注册微博：用户名，微博账号
    function register(string name, address accountAddress) {

        //  账号之前未注册过
        require(_accountNameToAddress[name] == address(0));

        // 昵称之前未注册过
        require(bytes(_addressToAccountName[accountAddress]).length == 0);

        // 昵称不能操作64
        require(bytes(name).length < 64);


        _addressToAccountName[accountAddress] = name;
        _accountNameToAddress[name] = accountAddress;
        _accountIdToAccountAddress[_numberOfAccounts] = accountAddress;
        _numberOfAccounts++;
    }

    // 返回已注册账户数量
    function getNumberOfAccounts() constant returns (uint numberOfAccounts) {
        numberOfAccounts = _numberOfAccounts;
    }

    // 返回昵称对应的微博账户地址
    function getAddressOfName(string name) constant returns (address addr) {
        addr = _accountNameToAddress[name];
    }

    // 返回微博账户地址对应的昵称
    function getNameOfAddress(address addr) constant returns (string name) {
        name = _addressToAccountName[addr];
    }

    // 根据id 返回账户
    function getAddressOfId(uint id) constant returns (address addr) {
        addr = _accountIdToAccountAddress[id];
    }

    // 取回打赏
    function adminRetrieveDonations() onlyRegistryAdmin {
        assert(_registryAdmin.send(this.balance));
    }

    // 摧毁合约
    function adminDeleteRegistry() onlyRegistryAdmin {
        selfdestruct(_registryAdmin);
    }

    event LogDonate(address indexed from, uint256 _amount);

    // 接受别人的打赏
    function() payable {
        LogDonate(msg.sender, msg.value);
    }
}