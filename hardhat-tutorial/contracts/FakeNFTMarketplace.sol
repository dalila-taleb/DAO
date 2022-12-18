// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FakeNFTMarketplace {
    // tokens : is a dictionnary in which Fake tokenId(s) are associated to their Owner addresses 
    mapping(uint256 => address) public tokens;

    // nftPrice : contain the purchase price for each NFT
    uint256 nftPrice = 0.01 ether;

    // Purchase() accepts ETH & marks owner of given tokenId as the caller address
    // _tokenId : is a param == the fake NFT token ID to puchase
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.01 ether");
        tokens[_tokenId] = msg.sender;
    }

    // getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256){
        return nftPrice; 
    }

    // availabe checks whether a given tokenId has already been sold or not
    function available(uint256 _tokenId) external view returns (bool) {
        // address(0) = 0x0000000000000000000000000000000000000000
        // => This is the default value of addressesin solidity
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }
}