# Ethereum

## MetaMask
   - download Chrome extension
<br>

[Ethereum Provider API | MetaMask docs](https://docs.metamask.io/guide/ethereum-provider.html#methods)

<br>

```javascript
//  Ethereum-Provider 인스턴스 확인
ethereum


//  연결 상태 확인
ethereum.isConnected()


//  계정 활성화 (MetaMask)
ethereum.enable()


//  활성화된 계정 확인
ethereum.selectedAddress



//  RPC API - eth.blockNumber RPC 요청하기

ethereum.request({
    method: 'eth_blockNumber',
    params: [],
}).then(result => console.log(result));
----------------------------------------
result : 0xb712b3




//  blockNumber 확인하기

parseInt('0xb712b3', 16);
--------------------------
result : 11997875      ( 11997875 개의 블록 쌓아왔음 )





//  소유 계정 잔액 확인하기 (단위: ETHER)

ethereum.request({
    method: 'eth_getBalance',
    params: [
        '0x26bdAB581Ed74cfC6c52eBd4F9fb37D50946c3c6',   //  account 주소
        'latest'
    ],
}).then(result => {
    let val = parseInt(result, 16);                     //  Wei 단위로
    let ethVal = val * Math.pow(10, -18);               //  1 Ether = 10^18 Wei
    console.log(ethVal + ' ETH');
});
-----------------------------------------------------
result : 0.289967782228547 ETH





//  데이터 담아서 sendTransaction

ethereum.request({
    method:'eth_sendTransaction',
    params:[
        {from:'0x26bdAB581Ed74cfC6c52eBd4F9fb37D50946c3c6',   // [from] account1 주소
         to:'0x29e694278622394D7382d698774DFE28cD0E512a',     //   [to] account 주소
         valuse: '0x1',
         data:'48656c6c6f2c207468657265',                     // string -> hex
         gas:'21000'
        }
    ]
}).then(result => console.log(result));
-----------------------------------------------------------
//  Transaction Hash
result : 0x3d4d0ee7d17aea8e609a9c53a390786372f488cedb4a0c8af62ad09b87613109





//  (1) 위 결과인 Transaction Hash 값으로 getTransactionReceipt

ethereum.request({
    method:'eth_getTransactionReceipt',
    params:['0x3d4d0ee7d17aea8e609a9c53a390786372f488cedb4a0c8af62ad09b87613109']
}).then(result => console.log(result));
----------------------------------------------------------------------------------
result :
{
	blockHash: "0x3910bf63d6fa8fc42f4937052924e1351c7858649daf384b6b73440f2ec1b492"
	blockNumber: "0xb71307"
	contractAddress: null
	cumulativeGasUsed: "0x20d44c"
	effectiveGasPrice: "0x59682f51"
	from: "0x26bdab581ed74cfc6c52ebd4f9fb37d50946c3c6"
	gasUsed: "0x52f8"
	logs: []
	logsBloom: "0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
	status: "0x1"
	to: "0x29e694278622394d7382d698774dfe28cd0e512a"
	transactionHash: "0x3d4d0ee7d17aea8e609a9c53a390786372f488cedb4a0c8af62ad09b87613109"
	transactionIndex: "0x4"
	type: "0x2"
}





//  (2) 위 결과인 Transaction Hash 값으로 getTransactionByHash

ethereum.request({
    method:'eth_getTransactionByHash',
    params:['0x3d4d0ee7d17aea8e609a9c53a390786372f488cedb4a0c8af62ad09b87613109']
}).then(result => console.log(result));
---------------------------------------------------------------------------------
result :
{
	accessList: []
	blockHash: "0x3910bf63d6fa8fc42f4937052924e1351c7858649daf384b6b73440f2ec1b492"
	blockNumber: "0xb71307"
	chainId: "0x3"
	from: "0x26bdab581ed74cfc6c52ebd4f9fb37d50946c3c6"
	gas: "0x21000"
	gasPrice: "0x59682f51"
	hash: "0x3d4d0ee7d17aea8e609a9c53a390786372f488cedb4a0c8af62ad09b87613109"
	input: "0x6665656c73206c696b65204a4f5420"
	maxFeePerGas: "0x59682f6b"
	maxPriorityFeePerGas: "0x59682f00"
	nonce: "0x1"
	r: "0x7a5d47db5126ae581524b99e5b597e24e56e5565fb4df332604f99471711c95d"
	s: "0x5e7ec9bc4728c16cbe27ca1fe3d3ca7fa51f716f1059a1493cf786882b6eda2c"
	to: "0x29e694278622394d7382d698774dfe28cd0e512a"
	transactionIndex: "0x4"
	type: "0x2"
	v: "0x1"
	value: "0x0"
}


```
