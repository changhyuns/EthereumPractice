// artifacts.require가 build > contracts > Lottery.json 파일의 데이터를 가져온다
const Lottery = artifacts.require("Lottery");


// line 2 에서 가져온 Lottery 데이터에서
// Lottery에 있는 바이트 코드를 deployer가 배포하는 형태

// 스마트 컨트랙트를 배포를 하려면 이더리움 주소가 필요한데
// truffle-config.js 에서 내가 사용할 주소를 설정하고
// 설정한 주소가 deployer에 매핑된다
module.exports = function (deployer) {
  deployer.deploy(Lottery);
};
