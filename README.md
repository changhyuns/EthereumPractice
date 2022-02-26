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
        - Environment
            - JavaScript VM 선택 - 브라우저에서 제공하는 VM에서 테스트할 수 있는 환경
        - Account
            - 100 ETH 충전되어 있는 (gas 소비) 계정 10개 제공
        - Deploy
            - VM 로그 확인 (콘솔창)
		
	        ![image](https://user-images.githubusercontent.com/53833541/155167335-4afb32d5-6626-41da-bf6f-316c0ebdd78e.png)
	
	    - 컨트랙트 주소 확인 (Deployed Contracts)
	    
	        ![image](https://user-images.githubusercontent.com/53833541/155167452-a762e45c-905d-4ae0-a835-0d3699daa14d.png)
	
	
	<br>


- **Smart Contract 호출**
    - 호출
        - Deployed Contracts 열기
        - store & retrieve
            - **store** ( SETTER 느낌 )
                
                ![image](https://user-images.githubusercontent.com/53833541/155366767-ae477756-b5bc-45cf-bd72-bff638402e52.png)
                
                - uint256 number 멤버변수 (전 세계 컴퓨터에 저장되는 값)
                    
                    store할 때에는, 전 세계 컴퓨터에 값을 저장해야 하므로 gas비 소모
                    
                - number값은 전 세계 이더리움 네트워크에 올라가면,
                    
                    불변의 값이 되면서 (블록체인 특성) 
                    
                    store 함수를 또 한 번 호출하면서 값을 변경해주지 않는 이상
                    
                    (해당 컨트랙트를 호출하지 않는 이상) 누구도 값을 변경할 수 없음
                    
                    **신뢰할 수 있다 !**
                    
            - **retrieve** ( GETTER 느낌 )
                
                ![image](https://user-images.githubusercontent.com/53833541/155366805-62865381-0ab5-43c4-9219-700813f5d0dd.png)
                
                - 값을 설정한 적이 없는데 uint256 : 0 으로 설정된 것을 볼 수 있음
                - 단순히 저장된 값을 불러오는 것이기 때문에, gas비 소모하지 않는다.
    - Deployed Contract 삭제
    - CA로 컨트랙트 접근
        - Contract 주소 복사
        - At address에 컨트랙트 주소 입력 (붙여넣기)
            
            ![image](https://user-images.githubusercontent.com/53833541/155366859-c3c486bf-e625-408a-bc51-7af98fb512dd.png)
            
    - 호출
        - 누구나 접근 가능 (컨트랙트 주소만 알면) - retrieve 가능
        - ABI만 있으면, 값을 변경(store)할 수 있음


<br><br>

- **Practice**
    
    **Remix에서 3_Ballot.sol 배포해보기**
    
    - Constructor 개념 이해
    - Parameter 확인
        
        <aside>
        💡 proposalNames  →  투표 항목 !   ex) 기호1, 기호2, 기호3
        bytes32[] memory proposalNames = [
        "0xeab8b0ed98b83100000000000000000000000000000000000000000000000000", "0xeab8b0ed98b83200000000000000000000000000000000000000000000000000", "0xeab8b0ed98b83300000000000000000000000000000000000000000000000000"
        ]
        
        </aside>
        
        ![image](https://user-images.githubusercontent.com/53833541/155467950-f7296e4f-c93a-412a-87da-f99b38cd41fd.png)
        
    - Deploy & Run Transactions
        - Ballot Contract 확인 및 Deploy시 parameter 타입 확인
            
            ![image](https://user-images.githubusercontent.com/53833541/155467970-67b217fd-9be6-4570-83bd-667b93c87296.png)
            
        - 음... 검색해보니까  이런 형태로 넘겨줘야 한다고 한다....
        
        ![image](https://user-images.githubusercontent.com/53833541/155468461-81a9778f-08f3-42c9-8767-d9cc0c6b1588.png)
        
        - Converter.sol 생성
            
            ![image](https://user-images.githubusercontent.com/53833541/155467992-5a7b0c59-5283-4934-9b2a-9cdace95d9bd.png)
            
            ```solidity
            // SPDX-License-Identifier: GPL-3.0
            pragma solidity >=0.7.0 < 0.9.0;
            
            contract Converter{
                function stringToBytes32(string memory source) public pure returns (bytes32 result) {
                    bytes memory bytesString = bytes(source);
                    if(bytesString.length == 0 ) {
                        return 0x0;
                    } 
                    assembly {
                        result := mload(add(source, 32))
                    }
                }
            }
            ```
            
        - compile & deploy
            - stringToBytes32 변환기 생성 확인
            
            ![image](https://user-images.githubusercontent.com/53833541/155468004-b9779bc9-1707-4380-b377-361ed2006162.png)
            
        
        ![image](https://user-images.githubusercontent.com/53833541/155468019-b6fa2d0b-2854-447d-bcd9-8e09d4dd4d87.png)
        
        - 기호1 → stringToBytes32
            - result 0xeab8b0ed98b83100000000000000000000000000000000000000000000000000
        - 기호2
            - result 0xeab8b0ed98b83200000000000000000000000000000000000000000000000000
        - 기호3
            - result 0xeab8b0ed98b83300000000000000000000000000000000000000000000000000
        - parameter에 기호1, 기호2, 기호3   →  bytes32[] 형태로 입력
            - ["0xeab8b0ed98b83100000000000000000000000000000000000000000000000000", "0xeab8b0ed98b83200000000000000000000000000000000000000000000000000", "0xeab8b0ed98b83300000000000000000000000000000000000000000000000000"]
        
        ![image](https://user-images.githubusercontent.com/53833541/155468039-6b9c436f-c5a4-45d0-9305-d9bb4647d726.png)
        
        ![image](https://user-images.githubusercontent.com/53833541/155468067-b1d479d7-90fb-48eb-a2d3-5002380ab206.png)
        
    
    **상태 변수의 의미 알아보기**
    
    - chairperson 변수 호출
        - 컨트랙트 배포를 수행한 주소가 할당되어 있는지 확인
            
            ![image](https://user-images.githubusercontent.com/53833541/155468542-d275d15b-29f6-48b2-b948-9961b8ac915b.png)
            
            ![image](https://user-images.githubusercontent.com/53833541/155468561-06390f01-9077-4c07-b5ee-18790a626cb7.png)
            
    - proposals 변수 호출 (인덱스 값)
        - 0 : proposalNames[0] 값 확인 : **기호1**
            
            ![image](https://user-images.githubusercontent.com/53833541/155468574-304720fb-dd82-4486-a74f-3a35bfddc57c.png)
            
        - 1 : proposalNames[1] 값 확인 : **기호2**
            
            ![image](https://user-images.githubusercontent.com/53833541/155468589-f18da3d2-ef60-4b9a-a072-392a3f0b69ec.png)
            
        - 2 : proposalNames[2] 값 확인 : **기호3**
            
            ![image](https://user-images.githubusercontent.com/53833541/155468618-3cadce5d-915f-4073-b17d-789bdace2d60.png)
            
    
    **함수 및 변수 호출해보기**
    
    - 아직 선택하지 않은 계정을 이용하여 delegate() 호출
        - delegate()   →  유권자에게 투표 위임
            
            transact to
            
            ![image](https://user-images.githubusercontent.com/53833541/155468723-398a315c-0e61-4a56-b215-147e526af4ce.png)
            
            ![image](https://user-images.githubusercontent.com/53833541/155468733-757f58ed-34e2-40b3-bace-85bbefe623a9.png)
            
            ![image](https://user-images.githubusercontent.com/53833541/155468743-0b7b53aa-75b7-476d-8702-a1b3b9e43179.png)
            
    - Deploy & Transactions의 account에서  방금 전 delegate한 계정으로 호출자 변경
        
        
        ![image](https://user-images.githubusercontent.com/53833541/155468759-ee9bf7b3-8ee2-4bdd-bf63-9497c792ffad.png)
        
    - proposals의 index 중 하나를 입력하고 vote() 호출  →  투표위임 받은 계정으로 투표 진행
        
             transact to
        
        ![image](https://user-images.githubusercontent.com/53833541/155468774-a447aa19-27b2-4cbd-adca-cd3d073c2574.png)
        
        ![image](https://user-images.githubusercontent.com/53833541/155468788-093a36d5-6ed0-4fad-bdf5-4a5874c3a1ce.png)
        
    - 위에서 투표한 계정의 voters 정보 확인
        
            vote to
        
        ![image](https://user-images.githubusercontent.com/53833541/155468802-3eadef99-3626-4e11-bf7a-936c9480d47c.png)
        
    
    **3_Ballot을 Ropsten 테스트넷에 배포해보기**
    
    - 사전 확인  :  MetaMask 지갑이 Ropsten Test Network에 연결되어 있는지 확인
        
        ![image](https://user-images.githubusercontent.com/53833541/155468974-fcaa417f-a4c0-4345-baa6-a6cf90f91b1a.png)
        
    - 배포 전 Deploy & Run Transaction 환경 설정 확인
        - Injected Web3 환경 확인  -  Ropsten Network로 배포됨을 확인
            
            MetaMask 계정 연동 확인
            
            ![image](https://user-images.githubusercontent.com/53833541/155468988-576858d3-5057-4ceb-ba99-5313d11f7210.png)
            
    - 배포 요청시 MetaMask 요청 화면 확인
        
        ![image](https://user-images.githubusercontent.com/53833541/155469020-2adaedb8-0640-4ed0-93fe-0c53385f3ef4.png)
        
    - 배포 완료 화면 - 이더스캔 화면 확인
        
        ![image](https://user-images.githubusercontent.com/53833541/155469037-ebaae6f1-3abb-4cc8-a33a-e46925479ce6.png)
        
        ![image](https://user-images.githubusercontent.com/53833541/155469060-db5c80cd-3843-4965-9e64-9055eab1f2b2.png)
        
    - Injected Web3
        - 브라우저에 내장된 Provider
        - MetaMask 지갑에 의해 주입된 Ropsten Network 와
            
            MetaMask에 설정된 계정을 그대로 Remix 환경에서 사용할 수 있게 해줌
	    
<br><br>

- **Solidity**
    
    **컨트랙트** <br>
    	- contract Storage {  ~~~ } 형태
    
    **상태 변수** <br>
    	- external, public, private 접근 제어자 지정 가능 <br>
    	- 기본형, 구조체, 배열 등 다양한 자료형 제공
    
    **함수** <br>
    	- 컨트랙트 단위 기능 <br>
    	- 파라미터, 제어자, 반환 값 지정 가능 <br>
    	- 함수 내에서 상태 변수의 값을 변경(write), 읽기(read) 가능 <br>
    	- function addNumber(uint x) public returns (uint) { return num += x; } 형태 <br>
    	- public view returns ~~ : 상태 변수에 접근하여 변경을 하는게 아니라, 변경 없이 결과 값을 보여주기만 함 (gas비 소모x) - 마음껏 사용 가능! <br>
    	- public pure returns ~~ : 상태 변수에 접근하지 않아도 순수한 함수인 경우 사용  <br>
    
    **자료형** <br>
    	- 논리형 : bool(true / false) <br>
    	- 정수형 : uint(unsigned integer), int(signed integer) <br>
    	- 주소형 : address 이더리움의 주소 <br>
    	- 바이트형 : bytes# , byte[] 
    
    **접근 제어자** <br>
    	- private  컨트랙트 내에서만 접근 가능 (상태 변수와 함수 모두 사용 가능) <br>
    	- internal 현재 컨트랙트와 자식 컨트랙트에서 접근 가능 (상태 변수에는 사용 불가) <br>
    	- public  현재 컨트랙트, 자식 컨트랙트, 외부 컨트랙트 및 주소에서 접근 가능 (상태 변수와 함수 모두 사용 가능) <br>
    	- external 외부 컨트랙트와 주소에서 접근 가능 (상태 변수와 함수 모두 사용 가능)
    
    **배열** <br>
    	- 함수 내에서 로컬 변수로 사용하기 위해서는 **고정 길이**로 선언해야 함 <br>
    	- index로 접근 가능, push, pop, delete 가능 <br>
    	- delete arr[index]  →  해당 index의 값을 0으로 **초기화**
    
    **매핑** <br>
    	- 매핑 선언  mapping(key => value) public addrTouint; 형태로 사용.  key는 unique <br>
    	- delete는 마찬가지로 삭제가 아니라, 값을 초기화 <br>
    	- 매핑에 저장된 key의 목록을 얻는 방법은 제공하지 않는다. 별도의 방법을 통해 key의 목록을 가지고 있어야만 접근 가능
    
    **Struct** <br>
    	- struct MyStruct { string text; bool boolean; }  형태 <br>
    	- MyStruct[] public structArray; 배열도 가능 <br>
    	- push 경우  JSON 형태도 지원 <br>
    
    **제어문** <br>
    	- 조건문 if - else <br>
    	- 삼항 연산자 x < y ? 1 : 2 <br>
    	- 반복문 while문, for문 (블록체인의 경우 loop는 정말 유의해야 한다 - 무한 루프 경우 gas 소비 상상 불가)
    
    **화폐 단위** <br>
    	- 이더리움 VM에서 소수점을 허용하지 않기 때문에 사용 <br>
    	- wei 가장 작은 단위 <br>
    	- gwei : 10^9 wei <br>
	- ether : 10^18 wei, 10^9 gwei


**storage, memory, calldata 비교** <br>
	- storage : 영구 데이터 영역에 데이터를 저장. 컨트랙트의 상태 변수가 storage에 저장됨. storage 키워드는 큰 비용을 초래함 <br>
	- memory : 함수 안에서 사용되는 임시 데이터를 저장하는데에 사용 <br>
	- calldata : 함수에 전달되는 파라미터같이  변경 불가. 임시 데이터가 저장되는 영역
	
**TodoList.sol 작성해보기**  <br>
	- 제목, 수행 여부 포함 <br>
	- [추가, 제목 수정, 완료 여부 변경, 상세 정보 확인] 가능, [목록 확인] 불가 <br>
	
	
	
		// SPDX-License-Identifier: GPL-3.0

		pragma solidity >=0.7.0 <0.9.0;

		/*
		 * @title TodoList
		 * @method create, update, toggle, get
		 */

		contract TodoList {

		    struct TodoListStruct {
		       string title; // title of TodoList
		       bool isDone;  // is TodoList inProgress or Done ?
		    }

		    // array of TodoListStructs
		    TodoListStruct[] public todoListArray;

		    // mapping address to TodoListStruct
		    mapping(address => TodoListStruct) public addrToTodoListStruct;

		    // methods
		    // create TodoList
		    function create(string memory _title) public {
			todoListArray.push(TodoListStruct({title: _title, isDone: false}));
		    }

		    // update TodoList Title  using index
		    // memory : temporary data that we use inside of function
		    // storage : persistent(permanent) data - state variable of contract
		    function updateTitle(uint _index, string memory _title) public {
			TodoListStruct storage todoListStruct = todoListArray[_index];
			todoListStruct.title = _title;
		    }

		    // update TodoList isDone - make it Done (true) or make it InProgress (false)
		    function updateIsDone(uint _index) public {
			TodoListStruct storage todoListStruct = todoListArray[_index];
			bool currentStatus = todoListStruct.isDone;
			todoListStruct.isDone = !currentStatus;  // make it opposite
		    }

		    // get TodoList Detail using index
		    function getTodoList(uint _index) public view returns(TodoListStruct memory) {
			return todoListArray[_index];
		    }
		}
	
    
