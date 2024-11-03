# DIXIE Composite Token

DIXIE is a composite cryptocurrency token that tracks both Bitcoin (BTC) and Ethereum (ETH) with equal weighting. The token's price is derived from the weighted average of BTC and ETH price movements.

## Initial Parameters

- Starting BTC Price: $69,620
- Starting ETH Price: $2,423
- Starting DIXIE Price: $100

## Features

- ERC20-compliant token
- Real-time price feeds using Chainlink oracles
- Equal weighting between BTC and ETH
- Automatic price calculation based on market movements
- Owner-controlled price feed updates

## Setup

1. Install dependencies:
```bash
npm install
```

2. Compile contracts:
```bash
npx hardhat compile
```

3. Deploy:
```bash
npx hardhat run scripts/deploy.js --network <your-network>
```

## Smart Contract

The main contract includes:
- Price feed integration with Chainlink oracles
- getCurrentDIXIEPrice() function to get real-time DIXIE price
- Automatic price calculations based on BTC and ETH movements
- Security features and access controls

## Security

- Uses OpenZeppelin's secure contract implementations
- Owner-only functions for critical updates
- Price feed validation
- Standard ERC20 security features


<!-- I have recreated all the necessary files for the DIXIE composite cryptocurrency token project:

contracts/DIXIE.sol - The main smart contract implementing the DIXIE token with:

Equal weighting between BTC and ETH
Initial prices set to BTC: $69,620, ETH: $2,423, DIXIE: $100
Real-time price tracking using Chainlink oracles
Project configuration files:

package.json with all required dependencies
hardhat.config.js for Ethereum development environment
deploy.js script for contract deployment
README.md with project documentation
.gitignore for version control
The project is now ready for development and deployment. You can:

Compile the contracts: npx hardhat compile
Deploy to a network: npx hardhat run scripts/deploy.js --network <network-name>
The DIXIE token will automatically track and reflect the weighted average price movements of BTC and ETH once deployed. -->