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

