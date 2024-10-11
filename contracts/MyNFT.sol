// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
  uint256 tokenCounter;

  constructor() ERC721("MyNFT","MyNFT") Ownable(msg.sender) {
    tokenCounter = 0;
  }

  function mintNFT(string memory tokenURI) public returns(uint256) {
    uint256 tokenId = tokenCounter;
    _safeMint(msg.sender, tokenId);
    _setTokenURI(tokenId,tokenURI);
    tokenCounter++;
    return tokenId;
  }
}
