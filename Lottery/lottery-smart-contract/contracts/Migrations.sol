// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  // uint completed 파라미터가
  // migrations > 1_ , 2_ , 3_ 등등 생겨날 때 해당 숫자와 매핑
  // 순서대로 실행하게 된다.
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
