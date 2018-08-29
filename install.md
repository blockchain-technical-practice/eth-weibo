鉴于许多读者不能正确运行eth-weibo，这里写一个安装教程：

1. testRPC安装

   由于这个项目只用于demo，所以我们使用testrpc作为项目的测试链，首先运行以下命令安装testrpc

   ```
   $ npm install -g ethereumjs-testrpc
   ```

   安装完成后启动testrpc，执行以下命令

   ```
   $ testrpc -m 'myth like bonus scare over problem client lizard pioneer submit female collect'
   
   EthereumJS TestRPC v4.1.3 (ganache-core: 1.1.3)
   
   Available Accounts
   ==================
   (0) 0x90f8bf6a479f320ead074411a4b0e7944ea8c9c1
   (1) 0xffcf8fdee72ac11b5c542428b35eef5769c409f0
   (2) 0x22d491bde2303f2f43325b2108d26f1eaba1e32b
   (3) 0xe11ba2b4d45eaed5996cd0823791e0c93114882d
   (4) 0xd03ea8624c8c5987235048901fb614fdca89b117
   (5) 0x95ced938f7991cd0dfcb48f0a06a40fa1af46ebc
   (6) 0x3e5e9111ae8eb78fe1cc3bb8915d5d461f3ef9a9
   (7) 0x28a8746e75304c0780e011bed21c72cd78cd535e
   (8) 0xaca94ef8bd5ffee41947b4585a84bda5a3d3da6e
   (9) 0x1df62f291b2e969fb0849d99d9ce41e2f137006e
   
   Private Keys
   ==================
   (0) 4f3edf983ac636a65a842ce7c78d9aa706d3b113bce9c46f30d7d21715b23b1d
   (1) 6cbed15c793ce57650b9877cf6fa156fbef513c4e6134f022a85b1ffdd59b2a1
   (2) 6370fd033278c143179d81c5526140625662b8daa446c22ee2d73db3707e620c
   (3) 646f1ce2fdad0e6deeeb5c7e8e5543bdde65e86029e2fd9fc169899c440a7913
   (4) add53f9a7e588d003326d1cbf9e4a43c061aadd9bc938c843a79e7b4fd2ad743
   (5) 395df67f0c2d2d9fe1ad08d1bc8b6627011959b79c53d7dd6a3536a33ab8a4fd
   (6) e485d098507f54e7733a205420dfddbe58db035fa577fc294ebd14db90767a52
   (7) a453611d9419d0e56f499079478fd72c37b251a94bfde4d19872c44cf65386e3
   (8) 829e924fdf021ba3dbbc4225edfece9aca04b929d6e75613329ca6f1d31c0bb4
   (9) b0057716d5917badaf911b193b12b910811c1497b5bada8d7711f758981c3773
   
   HD Wallet
   ==================
   Mnemonic:      myth like bonus scare over problem client lizard pioneer submit female collect
   Base HD Path:  m/44'/60'/0'/0/{account_index}
   
   Listening on localhost:8545
   ```

2. 部署合约

   测试网络启动成功后，开始部署合约，首先从github将eth-weibo项目clone到本地目录

   ```
   $ git clone git@github.com:blockchain-technical-practice/eth-weibo.git
   ```

   进入eth-webio目录

   ```
   $ cd eth-weibo
   ```

   安装依赖
   
   ```
   $ npm install
   ```
   
   部署合约

   ```
   $ truffle migrate
   
   Using network 'development'.
   
   Running migration: 1_initial_migration.js
     Deploying Migrations...
     ... 0xd143590677061f6aea866887ce91b89c6126a0c90d28e6c0895b8d540cf892a1
     Migrations: 0xe78a0f7e598cc8b0bb87894b0f60dd2a88d6a8ab
   Saving successful migration to network...
     ... 0xbb4949bdd34ff8085babe7e8624b67834f79b8d287b131c79000be7163697932
   Saving artifacts...
   Running migration: 2_weiboregistry_migration.js
     Deploying WeiboRegistry...
     ... 0xa884943db9b77edbc0d269167d14267badc26460284fe6ed50477261af7aa6e7
     WeiboRegistry: 0xcfeb869f69431e42cdb54a4f4f105c19c080a601
   Saving successful migration to network...
     ... 0x8e1f6cf2cf9221b6242de54995c6e71e0ae69781a6b4b587a98e3b3ae5acd047
   Saving artifacts...
   ```

   合约部署完成后就可以开始调用界面了

3. 运行eth-weibo Dapps

   首先进入`build/`目录

   ```
   cd ./build
   ```

   在浏览器是打开index.html 页面，就可以开始体验eth-weibo了！

    
