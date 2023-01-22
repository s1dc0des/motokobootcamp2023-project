import Principal "mo:base/Principal";
import Time "mo:base/Time";

module {
    public type Result = {
        #Ok : Text;
        #Err : Text;
    };

    public type Proposal = {
        id : Nat;
        proposer : Principal;
        message : Text;
        createdOn : Int;
        passedWith : ?Int;
        rejectedWith : ?Int;
        finalisedAt : ?Int;
        executed : ?Bool;
    };

    public type Vote = {
        voterPrincipal : Principal;
        vote : {
            #pass : Text;
            #reject : Text;
        };
    };

    public type PassReject = {
        #pass : Text;
        #reject : Text;
    };
};
