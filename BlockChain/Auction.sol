// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

contract Auction {
    address public owner;
    uint public initialBid;
    mapping(address => uint) public HighestBidder;
    uint public [] bids;

    constructor(uint firstbid) {
        owner = msg.sender;
        initialBid = firstbid;
    }

    modifier BiggerThanLast(uint bids) {
        require(bids > HighestBidder[msg.sender], "Please submit a bid higher than that of the highest bidder");
        _;
    }

    function bid(uint _bid) public payable BiggerThanLast(_bid) {
        require(_bid > initialBid, "Please submit a bid higher than the starting point.");
        HighestBidder[msg.sender];
    }
}
