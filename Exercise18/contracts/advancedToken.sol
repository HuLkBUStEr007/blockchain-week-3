// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract advancedToken is ERC20, Ownable {
    mapping(address => uint256) public lockedUntil;
    uint private _maxSupply;

    constructor(address initialOwner, uint maxSupply_) ERC20("advancedToken", "AT") Ownable(initialOwner){
         maxSupply_ = _maxSupply;
    }

    // Ensure only the owner can mint
    function mint(address to, uint256 amount) public onlyOwner {
        require(totalSupply() + amount <= _maxSupply, "Max supply exceeded");
        _mint(to, amount);
        // Set the lock period to 2 days (172800 seconds)
        lockedUntil[to] = block.timestamp + 172800;
    }

    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }

    function transfer(address to, uint256 value) public override returns (bool) {
        require(lockedUntil[msg.sender] <= block.timestamp, "Tokens are still locked");
        return super.transfer(to, value);
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public override returns (bool) {
        require(lockedUntil[from] <= block.timestamp, "Tokens are still locked");
        return super.transferFrom(from, to, value);
    }
}