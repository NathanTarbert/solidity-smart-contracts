// SPDX-License-Identifier: GPL-3.
pragma solidity >=0.7.0 <0.9.0;

contract CertificateRegistry {
    mapping (uint => bool) private certHashes;
    address contractOwner = msg.sender;

    function addHash(uint hash) public {
        require(msg.sender == contractOwner,"Sorry, you are not the owner");
        certHashes[hash] = true;
    }

    function verifyHash(uint hash) view public returns (bool) {
        return certHashes[hash];
    }
}