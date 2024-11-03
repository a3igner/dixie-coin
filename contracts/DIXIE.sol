// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DIXIE is ERC20, Ownable {
    AggregatorV3Interface private btcPriceFeed;
    AggregatorV3Interface private ethPriceFeed;
    
    uint256 public constant INITIAL_BTC_PRICE = 69620;
    uint256 public constant INITIAL_ETH_PRICE = 2423;
    uint256 public constant INITIAL_DIXIE_PRICE = 100;
    
    // Scaling factor for price calculations (8 decimals)
    uint256 private constant PRICE_DECIMALS = 10**8;
    
    constructor() ERC20("DIXIE Composite Token", "DIXIE") {
        // Mainnet Price Feed addresses
        btcPriceFeed = AggregatorV3Interface(0xF4030086522a5bEEa4988F8cA5B36dbC97BeE88c); // BTC/USD
        ethPriceFeed = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419); // ETH/USD
        
        // Initial minting based on starting parameters
        _mint(msg.sender, 1000000 * 10**decimals()); // Mint 1 million tokens initially
    }
    
    function getLatestPrices() public view returns (uint256 btcPrice, uint256 ethPrice) {
        (, int256 btcPrice_,,,) = btcPriceFeed.latestRoundData();
        (, int256 ethPrice_,,,) = ethPriceFeed.latestRoundData();
        
        require(btcPrice_ > 0 && ethPrice_ > 0, "Invalid price data");
        
        return (uint256(btcPrice_), uint256(ethPrice_));
    }
    
    function getCurrentDIXIEPrice() public view returns (uint256) {
        (uint256 currentBTCPrice, uint256 currentETHPrice) = getLatestPrices();
        
        // Calculate price changes from initial values
        uint256 btcRatio = (currentBTCPrice * PRICE_DECIMALS) / INITIAL_BTC_PRICE;
        uint256 ethRatio = (currentETHPrice * PRICE_DECIMALS) / INITIAL_ETH_PRICE;
        
        // Calculate average ratio (equal weights)
        uint256 averageRatio = (btcRatio + ethRatio) / 2;
        
        // Calculate current DIXIE price
        return (INITIAL_DIXIE_PRICE * averageRatio) / PRICE_DECIMALS;
    }
    
    function updatePriceFeedAddresses(address newBTCFeed, address newETHFeed) external onlyOwner {
        require(newBTCFeed != address(0) && newETHFeed != address(0), "Invalid address");
        btcPriceFeed = AggregatorV3Interface(newBTCFeed);
        ethPriceFeed = AggregatorV3Interface(newETHFeed);
    }
}
