const hre = require("hardhat");

async function main() {
  console.log("deploying...");
  // const Dex = await hre.ethers.getContractFactory("Dex");
  const Dex = await hre.ethers.getContractFactory("contracts/Dex.sol:Dex");
  const dex = await Dex.deploy();

  await dex.waitForDeployment();

//   console.log("DeX contract deployed: ", dex.address);
    const contractAddress = await dex.getAddress();
    console.log("DeX contract deployed to:", contractAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});