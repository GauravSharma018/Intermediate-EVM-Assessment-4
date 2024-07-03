# Intermediate-EVM-assessment-4 (Degen Gaming)
This program is a simple contract written in Solidity. The smart contract creates a new ERC20 contract. Only the contract owner is able to mint tokens to a provided address and any user is able to burn and transfer and redeem the tokens they own.

# Description
DegenGaming is an ERC20 token smart contract with extra functionality deployed on the Avalanche network for Degen Gaming. The smart contract have the following functionality:

1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5.  Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

ERC-20 Details:
Symbol: DGN
Name: Degen
Decimals: 18

# Getting Started
Proficiency in Hardhat: It is essential to have a good grasp of using Hardhat, a development environment designed for writing, testing, and deploying smart contracts.
Understanding of Solidity: It is important to have a strong understanding of Solidity as it is the main programming language used for creating smart contracts in this codebase.
Command line proficiency: Basic familiarity with using command line tools such as the terminal or Command Prompt is necessary for running commands and scripts.
Familiar with Remix IDE: It is easy to write, compile and deploy your smart contract if you are already familiar with the Remix IDE.

## Installing
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

## Executing program
Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the code from contract.sol file into your file:
``` ruby
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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

    //To check the balance of a players
    function getBalance() external view returns(uint256){
        return this.balanceOf(msg.sender);
    }

    // Players can transfer their tokens to other players
    function transferTokens(address _receiver, uint _amount) external {
        require(balanceOf(msg.sender) >= _amount, "You do not have enough Degen Tokens");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _receiver, _amount);
    }

    // To display the items available
    function showItems() public pure{
        console.log("Available items(price) are: ");
        console.log(" 1. NFT(100), 2. DegenShirts(50), 3. DegenHoodies(30), 4. DegenMasks(20), 5. DegenCaps(10)");
    }

    // Players can redeem tokens
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
        _transfer(msg.sender, address(this), price);
    }

    // Anyone can burn tokens they own
    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "You do not have enough Degen Tokens");
        _burn(msg.sender, amount);
    } 
}
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to latest solidity version (or another compatible version), and then click on the "Compile" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the your contract from the dropdown menu, then select the environment- injected provider metamask and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it and call the functions of the smart contract.

# Author
Gaurav Sharma

# License
This project is licensed under the MIT License.
