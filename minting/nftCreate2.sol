pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v4.x/contracts/token/ERC721/ERC721.sol"; 
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v4.x/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v4.x/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v4.x/contracts/utils/Counters.sol";

contract nftTemplate is ERC721URIStorage{
    
    mapping(uint256 => address) internal owners;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    constructor(string memory name, string memory symbol )  ERC721(name, symbol) {}
    

    function checkOwner(uint256 tokenId) external returns(address) {
        return ownerOf(tokenId);
    } 

    function mintNFT(address nftOwner, string memory tokenURI) public returns(uint256) {
        
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();
        
        _safeMint(nftOwner, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return tokenId;
    }
    
    function transferNFT (address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId);
    }
    
    
        
}