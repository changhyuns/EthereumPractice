# Lottery DApp 
  > ![Lottery DApp Youtube](https://www.youtube.com/watch?v=Ud3_OrxNPDg&list=PLlYCl1UOH8dheHS4vHOpPoHwq4Qi0R7WM) 참고


# 개발 환경 세팅

+ Truffle 설치
    npm i truffle -g

+ ganache-cli 설치
    npm i ganache-cli -g

+ MetaMask 지갑
    localhost 네트워크 사용

+ Truffle 프로젝트 생성
    mkdir lottery-smart-contract
    cd lottery-samrt-contract/
    truffle init

<br><br>

# Truffle 프로젝트 설정
+ Lottery.sol 작성
    Lottery > lottery-smart-contract > contracts > Lottery.sol

+ compile 후 바이트 코드 확인
    truffle compile
    build > contracts > Lottery.json

+ 2_deploy_smart_contract.js 작성
    Lottery > lottery-smart-contract > migrations > 2_deploy_smart_contract.js

+ truffle-config.js 설정
    truffle-config.js  line 44-48 주석 해제 (localhost 네트워크 설정)

<br><br>

# 배포
+ 블록체인 네트워크 사용
    ganache-cli -d -m tutorial

+ 스마트 컨트랙트 배포
    truffle migrate

+ 배포 후 재배포
    truffle migrate --reset

