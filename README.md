# Voting

### Инструкция по запуску

1) Выполнить в терминале
```shell
npm install
```

2) Выполнить в терминале
```shell
npx hardhat test
```

### Образец вывода теста
```
    Test
ballot.address = 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
    ✔ During creation totalSupply = 100.000000 (decimals = 6) tokens are minted to contract owner (1194ms)
    Any owner of voting tokens can create a proposal, time-to-live(TTL) of proposal is 3 days, after that time proposal becomes “discarded” if not enough votes are gathered
      ✔ Any owner of voting tokens can create a proposal (144ms)
      ✔ Check that proposal discarded after 3 days (113ms)
    Votes can be “for” or ”against” the proposal. Proposal becomes “accepted” or “declined” completed if > 50% of votes for the same decision (“for” or “against”) is gathered
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 20000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 30000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x90f79bf6eb2c4f870365e785982e1f101e93b906 15000000 tokens
owner balance of:  BigNumber { value: "35000000" }
user1 balance of:  BigNumber { value: "20000000" }
user2 balance of:  BigNumber { value: "30000000" }
user3 balance of:  BigNumber { value: "15000000" }
accept: 35000000; reject: 0; totalSupply 100000000
accept: 35000000; reject: 30000000; totalSupply 100000000
accept: 35000000; reject: 45000000; totalSupply 100000000
accept: 55000000; reject: 45000000; totalSupply 100000000
      ✔ Proposal becomes “accepted” completed if > 50% of votes (160ms)
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 20000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 30000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x90f79bf6eb2c4f870365e785982e1f101e93b906 15000000 tokens
owner balance of:  BigNumber { value: "35000000" }
user1 balance of:  BigNumber { value: "20000000" }
user2 balance of:  BigNumber { value: "30000000" }
user3 balance of:  BigNumber { value: "15000000" }
accept: 35000000; reject: 0; totalSupply 100000000
accept: 35000000; reject: 30000000; totalSupply 100000000
accept: 35000000; reject: 45000000; totalSupply 100000000
accept: 35000000; reject: 65000000; totalSupply 100000000
      ✔ Proposal becomes “declined” completed if > 50% of votes (163ms)
    voting should not “freeze” tokens 
 but, voting should handle a situation, when voter transfers his tokens to another address and votes another time.
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 20000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 30000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x90f79bf6eb2c4f870365e785982e1f101e93b906 15000000 tokens
owner balance of:  BigNumber { value: "35000000" }
user1 balance of:  BigNumber { value: "20000000" }
user2 balance of:  BigNumber { value: "30000000" }
user3 balance of:  BigNumber { value: "15000000" }
accept: 35000000; reject: 0; totalSupply 100000000
accept: 35000000; reject: 30000000; totalSupply 100000000
accept: 35000000; reject: 45000000; totalSupply 100000000
accept: 35000000; reject: 55000000; totalSupply 100000000
Transferring from 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 10000000 tokens
      ✔ voting should not “freeze” tokens (221ms)
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x70997970c51812dc3a010c7d01b50e0d17dc79c8 20000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 30000000 tokens
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x90f79bf6eb2c4f870365e785982e1f101e93b906 15000000 tokens
owner balance of:  BigNumber { value: "35000000" }
user1 balance of:  BigNumber { value: "20000000" }
user2 balance of:  BigNumber { value: "30000000" }
user3 balance of:  BigNumber { value: "15000000" }
accept: 35000000; reject: 0; totalSupply 100000000
accept: 35000000; reject: 30000000; totalSupply 100000000
accept: 35000000; reject: 45000000; totalSupply 100000000
accept: 15000000; reject: 65000000; totalSupply 100000000
Transferring from 0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266 to 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc 20000000 tokens
      ✔ but, voting should handle a situation, when voter transfers his tokens to another address and votes another time. (177ms)

```
