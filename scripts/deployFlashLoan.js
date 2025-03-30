const hre = require("hardhat");

async function main() {
    const FlashLoan = await hre.ethers.getContractFactory("FlashLoan");
    // https://aave.com/docs/resources/addresses POOL PROVIDER ADDRESS V3 testnet
    const flashLoan = await FlashLoan.deploy("0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A");
  
    // await flashLoan.deployed();
    await flashLoan.waitForDeployment();

    // console.log("FlashLoan contract deployed to:", flashLoan.address);
    const contractAddress = await flashLoan.getAddress();
    console.log("FlashLoan contract deployed to:", contractAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});