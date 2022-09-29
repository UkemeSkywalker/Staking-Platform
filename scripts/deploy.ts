import { ethers } from "hardhat";

async function main() {

  const JennyCoin = await ethers.getContractFactory("JennyCoins");
  const coinDeploy = await JennyCoin.deploy();
  const deployed = await coinDeploy.deployed();

  console.log("JennyCOin deployed at:", deployed.address);

}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
