
//SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{

    error BasicNft__TokenUriNotFound();
    mapping(uint256 tokenId => string tokenUri) private s_tokenIdToURI;
    uint128 private s_tokenCounter;

    constructor()ERC721("Scenarios","Evening"){
        s_tokenCounter = 0;
    }
    function mintNft(string memory tokenUri) public{
        s_tokenIdToURI[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }
    function tokenURI(uint256 tokenId) public view override returns(string memory){
        if(!_exists(tokenId)){
            revert BasicNft__TokenUriNotFound();
        }
        return s_tokenIdToURI[tokenId];
    }
    function getTokenCounter() public view returns(uint256){
        return s_tokenCounter;
    }

}