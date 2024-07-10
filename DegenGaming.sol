// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

 /* Your task is to create a ERC20 token and deploy it on the Avalanche network for Degen Gaming.
    The smart contract should have the following functionality:
    1. Minting new tokens: The platform should be able to create new tokens and 
       distribute them to players as rewards. Only the owner can mint tokens.
    2. Transferring tokens: Players should be able to transfer their tokens to others.
    3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
    4. Checking token balance: Players should be able to check their token balance at any time.
    5. Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.  */

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenGaming is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Only the owner can mint new tokens
    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount); //last value is for decimals
    }

    // Players can transfer their tokens to other players
    function transferTokens(address _receiver, uint _amount) external {
        require(balanceOf(msg.sender) >= _amount, "You do not have enough Degen Tokens");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _receiver, _amount);
    }

    // To display the available items
    function showItems() public pure returns(string memory){
        string memory itemlist = "Available items(price) are: 1. NFT(100), 2. DegenShirts(50), 3. DegenHoodies(30), 4. DegenMasks(20), 5. DegenCaps(10)";
        return itemlist;
    }

    // Players can redeem the tokens they own
        function redeemTokens(uint256 item) external {
            uint256 price;
            if (item == 1) {
                price = 100;
            } else if (item == 2) {
                price = 50;
            } else if (item == 3) {
                price = 30;
            } else if (item == 4) {
                price = 20;
            } else if (item == 5) {
                price = 10;
            }
        require(price <= balanceOf(msg.sender), "Error: Not Enough Degen Token");
        _burn(msg.sender, price);
        console.log("Congratulations! You have successfully redeemed your tokens.");
    }

    //To check the balance of a players
    function getBalance() external view returns(uint256){
        return this.balanceOf(msg.sender);
    }

    // Anyone can burn tokens they own
    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _burn(msg.sender, amount);
    } 
}
