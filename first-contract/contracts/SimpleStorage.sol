// The Solidity version we are going to use.
// ^0.8.7 : anything above 0.8.7 would work.
// >=0.8.6 <0.9.0 : compiler within the range of 0.8.6 to below 0.9.0 would work. 

// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; 

contract SimpleStorage {
    uint256 public favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    mapping(string=>uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // (view, pure) don't modify the state of the blockchain. 
    // No gas fee unless being called inside a function that modify the state of the blockchain.
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    // calldata & memory => temporary, storage => permanent ( Data location)
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
