// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract LastInvoker {
    address private lastInvoker;

    event TrueFalse(
        address indexed lastInvoker,
        address indexed _id,
        bool _success
    );

    function getLastInvoker() public returns (bool, address) {
        address result = lastInvoker;
        lastInvoker = msg.sender;
        return (result != address(0x0), result);
    }
}