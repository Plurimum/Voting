const {ethers} = require("hardhat");

async function deployVotingContract(vtAddress) {

    const [owner] = await ethers.getSigners();

    console.log("VotingToken address:", vtAddress);

    const token = await ethers.deployContract("Ballot", [vtAddress], owner)

    console.log("Ballot deploy:");
    console.log("Ballot address:", token.address);
    return token.address
}

module.exports = { deployVotingContract }