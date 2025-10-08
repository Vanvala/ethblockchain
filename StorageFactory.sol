// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public listofSimpleStorageContracts;

    function createSimpleStorageContrat() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listofSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function stStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public  {
        listofSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return listofSimpleStorageContracts[_simpleStorageIndex].retrieve();
}
}