import Prim "mo:prim";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Int "mo:base/Int";
import Hash "mo:base/Hash";
import Nat "mo:base/Nat";
import Cycles "mo:base/ExperimentalCycles";
import M "models/Models";
import Option "mo:base/Option";
import Array "mo:base/Array";
import Time "mo:base/Time";
import Service "./services/mb_service";
import Debug "mo:base/Debug";
// import SetTimer "mo:base/Timers";

actor {

  stable var proposalEntries : [(Nat, M.Proposal)] = [];
  var proposals = HashMap.fromIter<Nat, M.Proposal>(proposalEntries.vals(), 0, Nat.equal, Hash.hash);

  stable var voteEntries : [(Nat, [M.Vote])] = [];
  var votes = HashMap.fromIter<Nat, [M.Vote]>(voteEntries.vals(), 0, Nat.equal, Hash.hash);

  system func preupgrade() {
    proposalEntries := Iter.toArray(proposals.entries());
    voteEntries := Iter.toArray(votes.entries());
  };

  system func postupgrade() {
    proposalEntries := [];
    voteEntries := [];
  };

  stable var nextProposalId : Nat = 0;
  stable var lastExecution : Int = 1674398723296232557; // random previous timestamp for init
  stable let executionRepeat : Int = 300000000000; // 5 minutes

  // stable let executionRepeat : Int = 3000000000; // 5 seconds

  public query func getMemorySize() : async Nat {
    let size = Prim.rts_memory_size();
    size;
  };

  public query func getHeapSize() : async Nat {
    let size = Prim.rts_heap_size();
    size;
  };

  public query func getCycles() : async Nat {
    Cycles.balance();
  };
  public query func lastExecutionAt() : async Int {
    return lastExecution;
  };

  public shared ({ caller }) func submit_proposal(title : Text) : async M.Result {
    // assert not Principal.isAnonymous(caller);
    nextProposalId += 1;
    let addProposal = {
      id = nextProposalId;
      proposer = caller;
      message = title;
      createdOn = Time.now();
      finalisedAt = null;
      passedWith = null;
      rejectedWith = null;
      executed = null;
    };
    proposals.put(nextProposalId, addProposal);
    #Ok("proposal added with proposal id ## " # Nat.toText(nextProposalId) # " ");
  };

  public shared ({ caller }) func vote(
    proposal_id : Nat,
    your_vote : {
      #pass : Text;
      #reject : Text;
    },
  ) : async M.Result {
    // assert not Principal.isAnonymous(caller);
    //!! check if proposal is not yet executed
    let p : ?M.Proposal = proposals.get(proposal_id);

    switch (p) {
      case (null) {
        return #Err("No proposal found");
      };
      case (?p) {
        let status : Bool = Option.get(p.executed, false);
        if (status == false) {
          let votesOnProposal : ?[M.Vote] = votes.get(proposal_id);
          var unwrappedVotes : [M.Vote] = [];

          switch (votesOnProposal) {
            case (null) {};
            case (votesOnProposal) {
              unwrappedVotes := Option.get(votesOnProposal, []);
              for (vote in unwrappedVotes.vals()) {
                if (vote.voterPrincipal == caller) {
                  return #Err("one person one vote");
                };
              };
            };
          };

          let userVote : M.Vote = {
            voterPrincipal = caller;
            vote = your_vote;
          };
          unwrappedVotes := Array.append(unwrappedVotes, [userVote]);
          votes.put(proposal_id, unwrappedVotes);
          return #Ok("Vote submitted ");
        };
      };
    };
    return #Err("Proposal already executed");
  };

  public query func get_proposal(proposal_id : Nat) : async ?M.Proposal {
    proposals.get(proposal_id);
  };

  public query func get_all_proposals() : async [(Nat, M.Proposal)] {
    return Iter.toArray(proposals.entries());
  };

  public query func get_votes_on_proposal(proposal_id : Nat) : async ?[M.Vote] {
    return votes.get(proposal_id);
  };

  public shared ({ caller }) func testMbTokenService() : async Text {
    // assert not Principal.isAnonymous(caller);
    let name = await Service.mbActor.icrc1_name();
  };

  public shared ({ caller }) func getMyMbBalance() : async Nat {
    // assert not Principal.isAnonymous(caller);
    let user : Service.Account = { principal = caller; account = null };
    let bal = await Service.mbActor.icrc1_balance_of(user);
  };

  system func heartbeat() : async () {
    await execute_proposals();
  };

  func execute_proposals() : async () {
    let currentTime : Int = Time.now();
    Debug.print("-");
    if ((currentTime - lastExecution) > executionRepeat) {
      Debug.print("last time - current time > execution repeat");
      lastExecution := Time.now();
      for (p in proposals.entries()) {
        if ((currentTime - p.1.createdOn) > executionRepeat) {
          let status : Bool = Option.get(p.1.executed, false);
          Debug.print("#status#");
          if (status == false) {
            Debug.print("found proposal with no execution ");
            // calculate votes
            Debug.print("calculate votes");
            let id : Nat = p.1.id;
            let v : [M.Vote] = Option.get(votes.get(id), []);
            if (v.size() > 0) {
              var passNo : Int = 0;
              var rejectNo : Int = 0;
              var count : Nat = 0;
              while (count < v.size()) {
                let currentVote : M.PassReject = v[count].vote;
                switch (currentVote) {
                  case (#pass(x)) {
                    passNo += 1;
                  };
                  case (#reject(x)) {
                    rejectNo += 1;
                  };
                };
                count += 1;
              };
              // updating proposal
              Debug.print("updating proposal");
              let updatedProposal : M.Proposal = {
                id = p.1.id;
                proposer = p.1.proposer;
                message = p.1.message;
                createdOn = p.1.createdOn;
                passedWith = ?passNo;
                rejectedWith = ?rejectNo;
                finalisedAt = ?Time.now();
                executed = ?true;
              };
              //  update proposal
              proposals.put(p.1.id, updatedProposal);
              lastExecution := Time.now();
              // update dao canister;
            };
          };
        };
      };
    };
  };
};
