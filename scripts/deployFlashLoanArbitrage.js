const hre = require("hardhat");

async function main() {
    console.log("deploying...");
    const FlashLoanArbitrage = await hre.ethers.getContractFactory("FlashLoanArbitrage");
    const flashLoanArbitrage = await FlashLoanArbitrage.deploy("0x012bAC54348C0E635dCAc9D5FB99f06F24136C9A");

    // await flashLoanArbitrage.deployed();
    await flashLoanArbitrage.waitForDeployment();

    // console.log("Flash Loan contract deployed: ", flashLoanArbitrage.address);
    const contractAddress = await flashLoanArbitrage.getAddress();
    console.log("Flash Loan contract deployed to:", contractAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});