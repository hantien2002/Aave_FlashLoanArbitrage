// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

// import {FlashLoanSimpleReceiverBase} from "https://github.com/aave/aave-v3-core/blob/master/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
// import {IPoolAddressesProvider} from "https://github.com/aave/aave-v3-core/blob/master/contracts/interfaces/IPoolAddressesProvider.sol";
// import {IERC20} from "https://github.com/aave/aave-v3-core/blob/master/contracts/dependencies/openzeppelin/contracts/IERC20.sol";
import {FlashLoanSimpleReceiverBase} from "@aave/core-v3/contracts/flashloan/base/FlashLoanSimpleReceiverBase.sol";
import {IPoolAddressesProvider} from "@aave/core-v3/contracts/interfaces/IPoolAddressesProvider.sol";
import {IERC20} from "@aave/core-v3/contracts/dependencies/openzeppelin/contracts/IERC20.sol";


// This contract implements a flash loan receiver using Aave's V3 protocol.
contract FlashLoan is FlashLoanSimpleReceiverBase {
    address payable owner;

    constructor(address _addressProvider) 
        FlashLoanSimpleReceiverBase(IPoolAddressesProvider(_addressProvider)) {
            owner = payable(msg.sender);
        }
    
    function executeOperation(
        address asset, // token we are borrowing
        uint256 amount, // amount we are borrowing
        uint256 premium, // loan fee
        address initiator, // irrelevant
        bytes calldata params // irrelevant
    ) external override returns (bool) {
        // we have the logic
        // custom logic (mock arbitrage)
        uint256 amountOwed = amount + premium;
        IERC20(asset).approve(address(POOL), amountOwed);

        return true;
    }

    function requestFlashLoan(address _token, uint256 _amount) public {
        address receiverAddress = address(this);
        address asset = _token;
        uint256 amount = _amount;
        bytes memory params = ""; // no extra params needed
        uint16 referralCode = 0; // no referral code

        POOL.flashLoanSimple(
            receiverAddress,
            asset,
            amount,
            params,
            referralCode
        );
    }

    function getBalance(address _tokenAddress) external view returns (uint256) {
        return IERC20(_tokenAddress).balanceOf(address(this));
    }

    function withdraw(address _tokenAddress) external onlyOwner {
        IERC20 token = IERC20(_tokenAddress);
        token.transfer(msg.sender, token.balanceOf(address(this)));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function");
        _;
    }

    receive() external payable {}
}