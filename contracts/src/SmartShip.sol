// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import './Ship.sol';
import 'hardhat/console.sol';

contract SmartShip is Ship {

    struct Position {
        uint x;
        uint y;
    }
    uint height;
    uint width;
    Position private current;
    Position private next;

    function update(uint x, uint y) public override{
        current.x = x;
        current.y = y;
    }

    function random(uint max) public view returns(uint){
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  msg.sender))) % max;
    }

    function CurrentIsEqualTo(Position memory position) public view returns (bool){
        return (current.x == position.x && current.y == position.y);
    }

    function fire() public override returns (uint, uint){
        next = Position(random(width), random(height));
        if(CurrentIsEqualTo(next)){
            next.x +=1;
            next.y +=1;
        }
        return (next.x%width, next.y/height );
    }

    function place(uint width_, uint height_) public override returns (uint, uint){
        width = width_;
        height = height_;
        current.x = random(width);
        current.y = random(height);
        return (current.x, current.y);
    }
}