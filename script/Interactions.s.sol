// SPDX-License-Identifier: MIT

pragma solidity^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract MiniBasicNft is Script {
    string public constant EVENING = "ipfs://bafybeiell4hwaaqsyy3dn4i5fzh6ftwlwpfxatycnhzhwet7zcqrpp4afa";
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }
    function mintNftOnContract(address contractAddress) public{
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(EVENING);
        vm.stopBroadcast();
    }
}