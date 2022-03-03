# Lottery DApp 
  > [Lottery DApp Youtube](https://www.youtube.com/watch?v=Ud3_OrxNPDg&list=PLlYCl1UOH8dheHS4vHOpPoHwq4Qi0R7WM) 참고

<br><br>

# 개발 환경 세팅

+ Truffle 설치 <br><br>
    > npm i truffle -g
<br>

+ ganache-cli 설치 <br><br>
    > npm i ganache-cli -g
<br>

+ MetaMask 지갑 <br><br>
    > localhost 네트워크 사용
<br>

+ Truffle 프로젝트 생성 <br><br>
    > mkdir lottery-smart-contract <br>
    > cd lottery-samrt-contract/ <br>
    > truffle init

<br><br>

# Truffle 프로젝트 설정

+ Lottery.sol 작성 <br><br>
    > Lottery > lottery-smart-contract > contracts > Lottery.sol
<br>

+ compile 후 바이트 코드 확인 <br><br>
    > truffle compile <br>
    > build > contracts > Lottery.json
<br>

+ 2_deploy_smart_contract.js 작성 <br><br>
    > Lottery > lottery-smart-contract > migrations > 2_deploy_smart_contract.js
<br>

+ truffle-config.js 설정 <br><br>
    > truffle-config.js  line 44-48 주석 해제 (localhost 네트워크 설정)

<br><br>

# 배포

+ 블록체인 네트워크 사용 <br><br>
    > ganache-cli -d -m tutorial
<br>

+ 스마트 컨트랙트 배포 <br><br>
    > truffle migrate
<br>

+ 배포 후 재배포 <br><br>
    > truffle migrate --reset
<br>

+ 블록체인 접근 <br><br>
    > truffle console
<br>

+ 배포된 Lottery 인스턴스 접근 <br><br>
    > Lottery.deployed().then(function(instance){lt=instance}) <br>
    > lt.abi   인터페이스 확인 <br>
    > lt.owner() owner(deployer) 주소 확인 <br>
    > lt.getSomeValue()  5 리턴 확인

<br><br>

# 테스트코드 작성

+ lottery-test.js 작성 <br><br>
    > lottery-smart-contract > test > lottery-test.js

<br><br>

# DApp 서비스 설계

+ 지갑 관리 <br><br>
    > 특정 key를 hot wallet으로 관리 ? <br>
    > 인터넷 연결 ? 인터넷 연결 없는 곳 ? <br>
    > 돈이 부족하면 어떻게 알림을 받고, cold wallet에서 돈을 가져올지 ? <br>
    > 돈이 많을 땐 하나의 key로 돈을 관리할지 ? 2 of 3 지갑을 이용할지 ? <br>
