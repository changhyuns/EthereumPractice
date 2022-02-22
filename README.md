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

<br><br><br><br><br>

- **Smart Contract**
    - 디지털 형식으로 명시된 서약들의 집합
    - 서면으로 이루어지던 **계약**을 **코드**로 구현하고
    
          특정 조건이 충족되었을 때 해당 계약을 이행하도록 하는 script
    
    프로그램을 돌리면, 전세계 컴퓨터에서 동시에 이를 처리하기 때문에,
    
    특정 언어를 사용해야 한다.
    
    <br>
    
    - Solidity  (이더리움 기준)
    
    ![image](https://user-images.githubusercontent.com/53833541/155158497-756a1135-8dde-4a54-abb1-0ddc0ebc7cf4.png)
    
    + 스마트 컨트랙트 코드 작성
    + 해당 코드 내용을 EVM 바이트 코드와, ABI - JSON 형태의 interface를 뽑아낸다
    + 스마트 컨트랙트 내용의 바이트 코드가 담긴 트랜잭션 생성
    + 서명 후 전세계 이더리움 네트워크로 전송
    + 전세계 이더리움 네트워크에 참여한 모든 컴퓨터들이 해당 내용을 받는다
    + 해당 내용들은 Block 안에 담긴다
    + Block은 불변의 데이터이기 때문에, 스마트 컨트랜트 코드는 불변의 코드가 된다
    + 컨트랙트 배포시 CA(컨트랙트 주소) 사용
    + 배포된 스마트 컨트랙트는 CA와 ABI(인터페이스)를 통해 해당 프로그램 로직을 실행
    
    <br>

- **Remix**
    - 별도의 개발 환경 설정 없이  스마트 컨트랙트를 작성, 배포, 호출 가능한 IDE
    
    ![image](https://user-images.githubusercontent.com/53833541/155158597-6c779180-c8ba-4950-93f5-8c26d717ba51.png)
    
    <br>

- **Remix IDE를 이용하여 스마트 컨트랙트 배포**
    + 배포할 컨트랙트 준비
        - File explorers - contracts - Storage.sol 선택
        - Compile
            - Compiler 버전 맞추기
            - 사용한 언어 선택
            - EVM 버전 맞추기
            - auto compile - 변경시 자동으로 컴파일 <br>
    + 컴파일
        - contracts 폴더 내부에 artifacts 폴더
            
            ![image](https://user-images.githubusercontent.com/53833541/155158683-54e05963-8619-4ffc-9f2e-edae3fb2b26a.png)
            
        - 바이트 코드와 ABI 뽑아낸걸 확인 <br>
    + 배포
        - Deploy & Run Transactions
