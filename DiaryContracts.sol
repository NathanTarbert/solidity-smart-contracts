// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract DiaryContract {
    mapping(address => bool) private approveAddress;
    string[] private diary;
    address creator;
    address private newAddress;

    constructor() public {
        creator = msg.sender;
        approveAddress[creator] = true;
        approveAddress[0x14723A09ACff6D2A60DcdF7aA4AFf308FDDC160C] = true;
        approveAddress[0x4B0897b0513fdC7C541B6d9D7E929C4e5364D2dB] = true;
    }

    function addFacts(string memory newFact) public {

        require(creator == msg.sender, "Sorry, you are not the diary's creator");
        diary.push(newFact);
    }

    function countFacts() public view returns(uint) {
        return diary.length;
    }

    function getFacts(uint index) public view returns (string memory) {

        require(index < diary.length, "Fact index must be within range");
        require(approveAddress[msg.sender], "Sorry, you are not granted access");

        return diary[index];
    }

    function getCreator() public view returns (address) {
        return creator;
    }
}