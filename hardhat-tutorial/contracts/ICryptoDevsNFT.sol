// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



/**
 * Interface for the CryptoDevsNFT : a minimalist one because we are only interested with two functions
 */
interface ICryptoDevsNFT {
    // returns number of NFT owned by an owner
    function balanceOf(address owner) external view returns (uint256);

    function tokenOfOwnerByIndex(address owner, uint256 index)
        external
        view
        returns (uint256);

}