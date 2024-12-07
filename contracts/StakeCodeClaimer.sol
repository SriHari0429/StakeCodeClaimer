// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StakeCodeClaimer {
    mapping(address => uint256) public stakes;
    mapping(address => string) public claimCodes;
    mapping(string => bool) public codeUsed;

    function stake(uint256 amount, string memory claimCode) public {
        require(!codeUsed[claimCode], "Claim code already used");
        stakes[msg.sender] += amount;
        claimCodes[msg.sender] = claimCode;
        codeUsed[claimCode] = true;
    }

    function claim(string memory claimCode) public view returns (uint256) {
        require(keccak256(abi.encodePacked(claimCodes[msg.sender])) == keccak256(abi.encodePacked(claimCode)), "Invalid claim code");
        return stakes[msg.sender];
    }
}
