// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract JannaToken is ERC20 {
    address public janna;

    modifier onlyJanna() {
        require(msg.sender == janna, "only janna can execute this action");
        _;
    }

    constructor() ERC20("Janna's Token", "JNN") {
        janna = msg.sender;
        _mint(janna, 500 * 5 ** 50);
    }

    function mintTokens(address to, uint256 amount) external onlyJanna {
        _mint(to, amount);
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        return super.transfer(recipient, amount);
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        return super.transferFrom(sender, recipient, amount);
    }
}
