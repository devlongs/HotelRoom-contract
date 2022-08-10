// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract HotelRoom {
    enum Statuses { Vacant, Occupied};
    Statuses currentStatus;

    address payable public owner;
    constructor() {
        owner = msg.sender;
        currentStatus = Statuses.Vacant;
    }

    function book() payable {
        // check price
        // check status so you dont book twice
        currentStatus Statuses.Occupied;
        owner.transfer(msg.value);
    }
}