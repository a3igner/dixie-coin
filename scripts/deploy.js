async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  const DIXIE = await ethers.getContractFactory("DIXIE");
  const dixie = await DIXIE.deploy();

  await dixie.deployed();

  console.log("DIXIE token deployed to:", dixie.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
