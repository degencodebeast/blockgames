// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

contract HelloWorld{

    string public greeting;
    uint256 anyPositiveNumber;
    

    constructor(string memory _greeting) {
         greeting = _greeting;
    }

  function store(uint256 _anyPositiveNumber) public {
        anyPositiveNumber = _anyPositiveNumber;
    }

    function retrieve() public view returns(uint256) {
        return anyPositiveNumber;
    }

}