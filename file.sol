// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SentimentVoting {
    struct Candidate {
        string name;
        uint256 positiveVotes;
        uint256 negativeVotes;
        uint256 neutralVotes;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    uint256 public candidatesCount;

    event Voted(address indexed voter, uint256 candidateId, string sentiment);

    constructor() {
        // Initialize with some candidates
        addCandidate("Alice");
        addCandidate("Bob");
    }

    function addCandidate(string memory _name) private {
        candidates[candidatesCount] = Candidate(_name, 0, 0, 0);
        candidatesCount++;
    }

    function vote(uint256 _candidateId, string memory _sentiment) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateId < candidatesCount, "Invalid candidate ID.");
        
        if (keccak256(abi.encodePacked(_sentiment)) == keccak256(abi.encodePacked("positive"))) {
            candidates[_candidateId].positiveVotes++;
        } else if (keccak256(abi.encodePacked(_sentiment)) == keccak256(abi.encodePacked("negative"))) {
            candidates[_candidateId].negativeVotes++;
        } else if (keccak256(abi.encodePacked(_sentiment)) == keccak256(abi.encodePacked("neutral"))) {
            candidates[_candidateId].neutralVotes++;
        } else {
            revert("Invalid sentiment. Use 'positive', 'negative', or 'neutral'.");
        }

        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, _candidateId, _sentiment);
    }

    function getCandidateVotes(uint256 _candidateId) public view returns (uint256 positive, uint256 negative, uint256 neutral) {
        require(_candidateId < candidatesCount, "Invalid candidate ID.");
        
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.positiveVotes, candidate.negativeVotes, candidate.neutralVotes);
    }
}
