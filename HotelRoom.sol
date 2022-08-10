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
          require(msg.value == 2 ether, "Not enough ether provided.");
        // check status so you dont book twice
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        currentStatus Statuses.Occupied;
        owner.transfer(msg.value);
    }
}