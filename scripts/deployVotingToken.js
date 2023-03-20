const {ethers} = require("hardhat");

async function deployVotingToken() {
    const [owner] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", owner.address);

    console.log("Account balance:", (await owner.getBalance()).toString());

    const token = await ethers.deployContract("VotingToken", ['VotingToken', 'VT'], owner)

    console.log("VotingToken address:", token.address);
    return token.address
}

module.exports = { deployVotingToken }