# SentimentVoting 🗳️

A simple Ethereum smart contract that allows users to vote on candidates with **positive**, **negative**, or **neutral** sentiments. Each user can vote only once, and all votes are recorded on-chain.

## 🚀 Features
- Vote with sentiment: **positive**, **negative**, or **neutral**.  
- Prevents double voting.  
- Real-time vote counts for each candidate.  
- Emits events on every vote for easy integration with front-end apps.

## 📄 Smart Contract
**Contract Address:** `Samvit.sol`  

## 🔧 Usage
1. Deploy the contract to the Ethereum network.  
2. Use the `vote` function to cast a sentiment-based vote.  
3. Retrieve votes using the `getCandidateVotes` function.  

## 🛠 Functions
- `vote(uint256 _candidateId, string memory _sentiment)` – Cast your vote.  
- `getCandidateVotes(uint256 _candidateId)` – Get positive, negative, and neutral votes for a candidate.

## 📢 License
MIT  
