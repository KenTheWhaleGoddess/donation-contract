// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AssetLocker {

    address _locker;
    uint lockTime;
    uint startTime;

    constructor() {
        _locker = msg.sender;
        startTime = block.timestamp;
    }

    
}