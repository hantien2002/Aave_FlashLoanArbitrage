Flash Loan & Mock Arbitrage Demo (Aave V3 Sepolia)
==================================================

This project demonstrates how to implement a basic flash loan using Aave V3 on the Sepolia testnet, followed by a mock flash loan arbitrage between two assets using a custom DEX contract.

----------------------------------------
Tech Stack
----------------------------------------
- Solidity ^0.8.10
- Aave V3 Protocol
- Hardhat
- Sepolia testnet

----------------------------------------
Project Structure
----------------------------------------

contracts/
- FlashLoan.sol              -> Simple flash loan (baseline)
- FlashLoanArbitrage.sol    -> Flash loan + mock arbitrage logic
- DeX.sol                    -> Custom mock DEX with two fixed rates

scripts/
- deploySimpleFlashLoan.js
- deployFlashLoanArbitrage.js
- deployDex.js

----------------------------------------
Resources
----------------------------------------

- Aave V3 Docs: https://docs.aave.com/
- Hardhat: https://hardhat.org/
- Sepolia Faucet: https://sepoliafaucet.com/
- Tutorial: [Flash Loan Arbitrage | Aave Flash Loan Tutorial](https://www.youtube.com/watch?v=PtMs8FZJhkU&t=469s&ab_channel=BlockExplorer)
