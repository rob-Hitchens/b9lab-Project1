var Splitter = artifacts.require("./Splitter.sol");

module.exports = function(deployer) {
  deployer.deploy(Splitter,'0x5b86d53219d8be8144c6150291d7d8c5e004bbc5','0x1cd8a497d150aafe03ce7425fdbbdb6173adabd3','0xd2a87638d7a338cb4515ff7909f437456ba3cd9f');
};
