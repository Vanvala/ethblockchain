// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{

    uint256 public minimumUsd = 5;

    using PriceConverter for uint256;

    address[] public funders;

    mapping( address => uint256) public addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUsd, "did't send enough $!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    
    
    function withdraw() public {
        for (uint256 i = 0; i < funders.length; i++) {
            address funder = funders[i];
            addressToAmountFunded[funder] = 0;
    }
    funders = new address[](0);
    // transfer
    // payable(msg.sender).transfer(address(this).balance);
    // send
    // bool sendSuccess = payable(msg.sender).send(address(this).balance);
    // require(sendSuccess, "Send fail");
    // call
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call fail");
}
}
