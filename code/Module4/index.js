const web3 = require('web3');
const w3 = new web3(new web3.providers.HttpProvider('http://127.0.0.1:7545'));
w3.eth.getBalance("0x289a4a9078251eC72bee1abae863D2D7eA3c01d0").then(console.log);

const addr1 = "0x289a4a9078251eC72bee1abae863D2D7eA3c01d0";
const addr2 = "0x38203F54bC2f3C3242651E51A37a825DCb828C10";
sendEther(addr1, addr2, "1");


function sendEther(address1, address2, amount) {
    w3.eth.sendTransaction({
        from: address1,
        to: address2,
        value: w3.utils.toWei(amount ,"ether")
    });   
}