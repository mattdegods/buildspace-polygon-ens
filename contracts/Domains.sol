// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.10;
import "hardhat/console.sol";

contract Domains {

  // mapping to link accounts to names
  mapping(string => address) public domains;
  mapping(string => string) public records;

  constructor() {
    console.log("Domains contract deployed. Booyah!");
  }

  // register function to store new names to the domains mapping
  function register(string calldata name) public {
    // ensure domain isn't already taken
    require(domains[name] == address(0));
    domains[name] = msg.sender;
    console.log("%s has registered a domain.", msg.sender);
  }

  // syntax: 
  // calldata - this indicates the “location” of where the name argument should be stored. 
  // Since it costs real money to process data on the blockchain, Solidity lets you indicate where reference types should be stored. calldata is non-persistent and can’t be modified. We like this because it takes the least amount of gas!
  // public - this is a visibility modifier
  // view - this just means that the function is only viewing data on the contract, not modifying it.
  // returns (string) - the contract returns a string variable when called. ezpz.
  function getAddress(string calldata name) public view returns (address) {
    return domains[name];
  }

  function setRecord(string calldata name, string calldata record) public {
    require(domains[name] == msg.sender);
    records[name] = record;
  }
 
  function getRecord(string calldata name) public view returns (string memory) {
    return records[name];
  }

}