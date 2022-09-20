// SPDX-License-Identifier: UNLICENCED

pragma solidity >0.7.0 <0.9.0;

contract Time {

    uint public threeHours = 3 hours;
    uint public oneMinute = 1 minutes;
    uint public oneSecond = 1 seconds;

    uint public deployedDay;

    mapping(address => uint) donations;


    constructor() {
        deployedDay = block.timestamp;
    }


    function nowTime() view public returns(uint) {
        return block.timestamp;
    }

    function getSecondsTime(uint time) view public returns(uint) {
        return time * threeHours;
    }

    function daysPassedSinceLaunch() view public returns(uint) {
        return (deployedDay - block.timestamp);
    }

}