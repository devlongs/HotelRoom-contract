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

    modifier onlyWhileVacant {
          require(currentStatus == Statuses.Vacant, "Currently occupied.");

          _;
    }

     modifier costs(uint _amount) {
          require(msg.value >= _amount, "Not enough ther provided.");

          _;
    }

    function book() payable  onlyWhileVacant  costs(2 ether){
        currentStatus Statuses.Occupied;
        owner.transfer(msg.value);
    }
}