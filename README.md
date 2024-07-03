# Intermediate-EVM-assessment-4
Project Title - Degen Gaming Token

# Description
DegenStore is an ERC20 token smart contract with extra functionality deployed on the Avalanche network for Degen Gaming. The smart contract have the following functionality:

1. Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
2. Transferring tokens: Players should be able to transfer their tokens to others.
3. Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
4. Checking token balance: Players should be able to check their token balance at any time.
5.  Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

ERC-20 Details:
Symbol: DGT
Name: Degen Gaming Token
Decimals: 18

# Getting Started
Proficiency in Hardhat: It is essential to have a good grasp of using Hardhat, a development environment designed for writing, testing, and deploying smart contracts.
Understanding of Solidity: It is important to have a strong understanding of Solidity as it is the main programming language used for creating smart contracts in this codebase.
Command line proficiency: Basic familiarity with using command line tools such as the terminal or Command Prompt is necessary for running commands and scripts.

## Installing
A text editor: For running the code Visual Studio Code.
You will need to have Node.js installed on your system, with version V10. or higher.
Node Package Manager npm used for installing and managing dependencies.
run this command in your terminal git clone https://github.com/Ultra-Tech-code/DegenStore to clone this repository

## Executing program
After cloning the github, you will want to do the following to get the code running on your computer.

cd to the project directory, in the terminal type: npm i
In the terminal type: npx hardhat node
Open a second terminal
In the second terminal, type: npx hardhat run --network localhost scripts/deploy.ts to deploy the token.
You can also run the test.ts file, type npx hardhat run --network localhost scripts/test.ts to see the how each function works

# Author
Gaurav Sharma

# License
This project is licensed under the MIT License.
