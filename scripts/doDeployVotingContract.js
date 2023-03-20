const {ethers} = require("hardhat");
const { deployVotingContract } = require("./deployVotingContract.js");
const { deployVotingToken } = require("./deployVotingToken.js");

await (async () => {
    const [owner] = await ethers.getSigners();
    return await deployVotingContract(deployVotingToken(owner))
});