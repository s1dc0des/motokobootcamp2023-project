import Constants "../constants/canisters";
import Nat8 "mo:base/Nat8";
import Principal "mo:base/Principal";

module {

    public type Account = {
        account : ?[Nat8];
        principal : Principal;
    };

    public let mbActor = actor (Constants.mbTokenCanister) : actor {
        icrc1_name : () -> async Text;
        icrc1_symbol : () -> async Text;
        icrc1_decimals : () -> async Nat8;
        icrc1_fee : () -> async Nat;
        // icrc1_metadata : () -> async [{ text; Value }];
        icrc1_balance_of : (Account) -> async Nat;
        // icrc1_transfer : (TransferArgs) -> async {
        //     Ok : nat;
        //     Err : TransferError;
        // };
        // icrc1_metadata : () -> (vec record { text; Value; }) query;
        // icrc1_name : () -> (text) query;
        // icrc1_symbol : () -> (text) query;
        // icrc1_decimals : () -> (nat8) query;
        // icrc1_fee : () -> (nat) query;
        // icrc1_total_supply : () -> (nat) query;
        // icrc1_minting_account : () -> (opt Account) query;
        // icrc1_balance_of : (Account) -> (nat) query;
        // icrc1_transfer : (TransferArgs) -> (variant { Ok : nat; Err : TransferError });
        // icrc1_supported_standards : () -> (vec record { name : text; url : text }) query;
    };
};
