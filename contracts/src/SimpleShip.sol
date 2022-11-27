// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import './Ship.sol';
import 'hardhat/console.sol';

contract SimpleShip is Ship {

    struct Position {
        uint x;
        uint y;
    }
    uint height;
    uint width;
    Position private current;
    uint private next;

    function update(uint x, uint y) public override{
        current.x = x;
        current.y = y;
    }

     function somme() public view returns (uint){
        return current.x + current.y;
     }

    function fire() public override returns (uint, uint){
        next += somme();
        if(somme()==next){
            next +=1;
        }
        return (next%width, next/height );
    }

    function place(uint width_, uint height_) public override returns (uint, uint){
        width = width_;
        height = height_;
        current.x = 1;
        current.y = 1;
        return (current.x, current.y);
    }
}