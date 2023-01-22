// ignore_for_file: type=lint
///
/// GENERATED CODE - DO NOT MODIFY BY HAND
///

import 'package:agent_dart/agent_dart.dart';
import 'package:collection/collection.dart';
import 'package:tuple/tuple.dart';

class AnonsIcBackend {
  const AnonsIcBackend._();

  /// getCycles:()->(nat)query
  static const String getCycles = 'getCycles';

  /// getHeapSize:()->(nat)query
  static const String getHeapSize = 'getHeapSize';

  /// getMemorySize:()->(nat)query
  static const String getMemorySize = 'getMemorySize';

  /// getMyMbBalance:()->(nat)
  static const String getMyMbBalance = 'getMyMbBalance';

  /// get_all_proposals:()->(vecrecord{nat;Proposal;})query
  static const String getAllProposals = 'get_all_proposals';

  /// get_proposal:(nat)->(optProposal)query
  static const String getProposal = 'get_proposal';

  /// get_votes_on_proposal:(nat)->(optvecVote)query
  static const String getVotesOnProposal = 'get_votes_on_proposal';

  /// lastExecutionAt:()->(int)query
  static const String lastExecutionAt = 'lastExecutionAt';

  /// submit_proposal:(text)->(Result)
  static const String submitProposal = 'submit_proposal';

  /// testMbTokenService:()->(text)
  static const String testMbTokenService = 'testMbTokenService';

  /// vote:(nat,variant{pass:text;reject:text;})->(Result)
  static const String vote = 'vote';

  static final Service idl = IDL.Service(<String, FuncClass>{
    /// [getCycles] defined in Candid
    /// getCycles:()->(nat)query
    getCycles: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Nat],
      <String>['query'],
    ),

    /// [getHeapSize] defined in Candid
    /// getHeapSize:()->(nat)query
    getHeapSize: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Nat],
      <String>['query'],
    ),

    /// [getMemorySize] defined in Candid
    /// getMemorySize:()->(nat)query
    getMemorySize: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Nat],
      <String>['query'],
    ),

    /// [getMyMbBalance] defined in Candid
    /// getMyMbBalance:()->(nat)
    getMyMbBalance: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Nat],
      <String>[],
    ),

    /// [getAllProposals] defined in Candid
    /// get_all_proposals:()->(vecrecord{nat;Proposal;})query
    getAllProposals: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[
        IDL.Vec(
          IDL.Tuple(
            <CType<dynamic>>[IDL.Nat, Proposal.idl],
          ),
        )
      ],
      <String>['query'],
    ),

    /// [getProposal] defined in Candid
    /// get_proposal:(nat)->(optProposal)query
    getProposal: IDL.Func(
      <CType<dynamic>>[IDL.Nat],
      <CType<dynamic>>[
        IDL.Opt(
          Proposal.idl,
        )
      ],
      <String>['query'],
    ),

    /// [getVotesOnProposal] defined in Candid
    /// get_votes_on_proposal:(nat)->(optvecVote)query
    getVotesOnProposal: IDL.Func(
      <CType<dynamic>>[IDL.Nat],
      <CType<dynamic>>[
        IDL.Opt(
          IDL.Vec(
            Vote.idl,
          ),
        )
      ],
      <String>['query'],
    ),

    /// [lastExecutionAt] defined in Candid
    /// lastExecutionAt:()->(int)query
    lastExecutionAt: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Int],
      <String>['query'],
    ),

    /// [submitProposal] defined in Candid
    /// submit_proposal:(text)->(Result)
    submitProposal: IDL.Func(
      <CType<dynamic>>[IDL.Text],
      <CType<dynamic>>[Result.idl],
      <String>[],
    ),

    /// [testMbTokenService] defined in Candid
    /// testMbTokenService:()->(text)
    testMbTokenService: IDL.Func(
      <CType<dynamic>>[],
      <CType<dynamic>>[IDL.Text],
      <String>[],
    ),

    /// [vote] defined in Candid
    /// vote:(nat,variant{pass:text;reject:text;})->(Result)
    vote: IDL.Func(
      <CType<dynamic>>[
        IDL.Nat,
        IDL.Tuple(
          <CType<dynamic>>[IDL.Text, IDL.Text],
        )
      ],
      <CType<dynamic>>[Result.idl],
      <String>[],
    ),
  });
}

/// [getCycles] defined in Candid
/// getCycles:()->(nat)query
///
/// Dart IDL
/// [AnonsIcBackend.getCycles] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Nat],
///    <String>['query'],
/// )
///
Future<BigInt> getCycles(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getCycles)!(dat);
  return resp is BigInt ? resp : BigInt.from(resp);
}

/// [getHeapSize] defined in Candid
/// getHeapSize:()->(nat)query
///
/// Dart IDL
/// [AnonsIcBackend.getHeapSize] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Nat],
///    <String>['query'],
/// )
///
Future<BigInt> getHeapSize(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getHeapSize)!(dat);
  return resp is BigInt ? resp : BigInt.from(resp);
}

/// [getMemorySize] defined in Candid
/// getMemorySize:()->(nat)query
///
/// Dart IDL
/// [AnonsIcBackend.getMemorySize] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Nat],
///    <String>['query'],
/// )
///
Future<BigInt> getMemorySize(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getMemorySize)!(dat);
  return resp is BigInt ? resp : BigInt.from(resp);
}

/// [getMyMbBalance] defined in Candid
/// getMyMbBalance:()->(nat)
///
/// Dart IDL
/// [AnonsIcBackend.getMyMbBalance] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Nat],
///    <String>[],
/// )
///
Future<BigInt> getMyMbBalance(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getMyMbBalance)!(dat);
  return resp is BigInt ? resp : BigInt.from(resp);
}

/// [getAllProposals] defined in Candid
/// get_all_proposals:()->(vecrecord{nat;Proposal;})query
///
/// Dart IDL
/// [AnonsIcBackend.getAllProposals] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Vec(IDL.Tuple(<CType<dynamic>>[IDL.Nat,Proposal.idl],),)],
///    <String>['query'],
/// )
///
Future<List<Tuple2<BigInt, Proposal>>> getAllProposals(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getAllProposals)!(dat);
  return resp.map<Tuple2<BigInt, Proposal>>((e) {
    return Tuple2<BigInt, Proposal>.fromList(
      <dynamic>[
        e[0] is BigInt ? e[0] : BigInt.from(e[0]),
        Proposal.fromJson(
          e[1],
        ),
      ],
    );
  }).toList(growable: false);
}

/// [getProposal] defined in Candid
/// get_proposal:(nat)->(optProposal)query
///
/// Dart IDL
/// [AnonsIcBackend.getProposal] : IDL.Func(
///    <CType<dynamic>>[IDL.Nat],
///    <CType<dynamic>>[IDL.Opt(Proposal.idl,)],
///    <String>['query'],
/// )
///
Future<Proposal?> getProposal(
  CanisterActor actor,
  BigInt arg,
) async {
  final List<dynamic> dat = <dynamic>[arg];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getProposal)!(dat);
  return (resp as List?)?.map((e) {
    return e == null
        ? null
        : Proposal.fromJson(
            e,
          );
  }).firstOrNull;
}

/// [getVotesOnProposal] defined in Candid
/// get_votes_on_proposal:(nat)->(optvecVote)query
///
/// Dart IDL
/// [AnonsIcBackend.getVotesOnProposal] : IDL.Func(
///    <CType<dynamic>>[IDL.Nat],
///    <CType<dynamic>>[IDL.Opt(IDL.Vec(Vote.idl,),)],
///    <String>['query'],
/// )
///
Future<List<Vote>?> getVotesOnProposal(
  CanisterActor actor,
  BigInt arg,
) async {
  final List<dynamic> dat = <dynamic>[arg];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.getVotesOnProposal)!(dat);
  return (resp as List?)?.map((e) {
    return e?.map<Vote>((e) {
      return Vote.fromJson(
        e,
      );
    }).toList(growable: false);
  }).firstOrNull;
}

/// [lastExecutionAt] defined in Candid
/// lastExecutionAt:()->(int)query
///
/// Dart IDL
/// [AnonsIcBackend.lastExecutionAt] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Int],
///    <String>['query'],
/// )
///
Future<BigInt> lastExecutionAt(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.lastExecutionAt)!(dat);
  return resp is BigInt ? resp : BigInt.from(resp);
}

/// [submitProposal] defined in Candid
/// submit_proposal:(text)->(Result)
///
/// Dart IDL
/// [AnonsIcBackend.submitProposal] : IDL.Func(
///    <CType<dynamic>>[IDL.Text],
///    <CType<dynamic>>[Result.idl],
///    <String>[],
/// )
///
Future<Result> submitProposal(
  CanisterActor actor,
  String arg,
) async {
  final List<dynamic> dat = <dynamic>[arg];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.submitProposal)!(dat);
  return Result.fromJson(
    resp,
  );
}

/// [testMbTokenService] defined in Candid
/// testMbTokenService:()->(text)
///
/// Dart IDL
/// [AnonsIcBackend.testMbTokenService] : IDL.Func(
///    <CType<dynamic>>[],
///    <CType<dynamic>>[IDL.Text],
///    <String>[],
/// )
///
Future<String> testMbTokenService(
  CanisterActor actor,
) async {
  final List<dynamic> dat = const <dynamic>[];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.testMbTokenService)!(dat);
  return resp;
}

/// [vote] defined in Candid
/// vote:(nat,variant{pass:text;reject:text;})->(Result)
///
/// Dart IDL
/// [AnonsIcBackend.vote] : IDL.Func(
///    <CType<dynamic>>[IDL.Nat,IDL.Tuple(<CType<dynamic>>[IDL.Text,IDL.Text],)],
///    <CType<dynamic>>[Result.idl],
///    <String>[],
/// )
///
Future<Result> vote(
  CanisterActor actor,
  Tuple2<BigInt, Tuple2<String?, String?>> args,
) async {
  final List<dynamic> dat = <dynamic>[
    args.item1,
    <dynamic>[
      args.item2.item1,
      args.item2.item2,
    ],
  ];
  final dynamic resp = await actor.getFunc(AnonsIcBackend.vote)!(dat);
  return Result.fromJson(
    resp,
  );
}

/// [Vote] defined in Candid
/// record{vote:variant{pass:text;reject:text;};voterPrincipal:principal;}
class Vote {
  const Vote({
    required this.vote,
    required this.voterPrincipal,
  });

  factory Vote.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    return Vote(
      vote: VoteVote.fromJson(
        map['vote'],
      ),
      voterPrincipal: Principal.from(map['voterPrincipal']),
    );
  }

  /// [vote] : variant{pass:text;reject:text;}
  final VoteVote vote;

  /// [voterPrincipal] : principal
  final Principal voterPrincipal;

  static final RecordClass idl = IDL.Record(
    <String, dynamic>{
      'vote': VoteVote.idl,
      'voterPrincipal': IDL.Principal,
    },
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'vote': vote,
      'voterPrincipal': voterPrincipal,
    }..removeWhere((String key, dynamic value) {
        return value == null;
      });
  }

  /// Types defined in Candid
  /// * [vote] : variant{pass:text;reject:text;}
  /// * [voterPrincipal] : principal
  Vote copyWith({
    VoteVote? vote,
    Principal? voterPrincipal,
  }) {
    return Vote(
      vote: vote ?? this.vote,
      voterPrincipal: voterPrincipal ?? this.voterPrincipal,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Vote && runtimeType == other.runtimeType && this.vote == other.vote && this.voterPrincipal == other.voterPrincipal;

  @override
  int get hashCode => vote.hashCode ^ voterPrincipal.hashCode;
}

/// [VoteVote] defined in Candid
/// variant{pass:text;reject:text;}
class VoteVote {
  const VoteVote({
    this.pass,
    this.reject,
  });

  factory VoteVote.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    return VoteVote(
      pass: map['pass'],
      reject: map['reject'],
    );
  }

  /// [pass] : text
  final String? pass;

  /// [reject] : text
  final String? reject;

  static final VariantClass idl = IDL.Variant(
    <String, CType<dynamic>>{
      'pass': IDL.Text,
      'reject': IDL.Text,
    },
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'pass': pass,
      'reject': reject,
    }
      ..removeWhere((String key, dynamic value) {
        return value == null || value == false;
      })
      ..updateAll((String key, dynamic value) {
        return value is bool ? null : value;
      });
  }

  /// Types defined in Candid
  /// * [pass] : text
  /// * [reject] : text
  VoteVote copyWith({
    String? pass,
    String? reject,
  }) {
    return VoteVote(
      pass: pass ?? this.pass,
      reject: reject ?? this.reject,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoteVote && runtimeType == other.runtimeType && this.pass == other.pass && this.reject == other.reject;

  @override
  int get hashCode => pass.hashCode ^ reject.hashCode;
}

/// [Result] defined in Candid
/// variant{Err:text;Ok:text;}
class Result {
  const Result({
    this.err,
    this.ok,
  });

  factory Result.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    return Result(
      err: map['Err'],
      ok: map['Ok'],
    );
  }

  /// [err] : text
  final String? err;

  /// [ok] : text
  final String? ok;

  static final VariantClass idl = IDL.Variant(
    <String, CType<dynamic>>{
      'Err': IDL.Text,
      'Ok': IDL.Text,
    },
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'Err': err,
      'Ok': ok,
    }
      ..removeWhere((String key, dynamic value) {
        return value == null || value == false;
      })
      ..updateAll((String key, dynamic value) {
        return value is bool ? null : value;
      });
  }

  /// Types defined in Candid
  /// * [err] : text
  /// * [ok] : text
  Result copyWith({
    String? err,
    String? ok,
  }) {
    return Result(
      err: err ?? this.err,
      ok: ok ?? this.ok,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Result && runtimeType == other.runtimeType && this.err == other.err && this.ok == other.ok;

  @override
  int get hashCode => err.hashCode ^ ok.hashCode;
}

/// [Proposal] defined in Candid
/// record{createdOn:int;executed:optbool;finalisedAt:optint;id:nat;message:text;passedWith:optint;proposer:principal;rejectedWith:optint;}
class Proposal {
  const Proposal({
    required this.createdOn,
    this.executed,
    this.finalisedAt,
    required this.id,
    required this.message,
    this.passedWith,
    required this.proposer,
    this.rejectedWith,
  });

  factory Proposal.fromJson(
    Map<dynamic, dynamic> map,
  ) {
    return Proposal(
      createdOn: map['createdOn'] is BigInt ? map['createdOn'] : BigInt.from(map['createdOn']),
      executed: (map['executed'] as List?)?.firstOrNull,
      finalisedAt: (map['finalisedAt'] as List?)?.map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      id: map['id'] is BigInt ? map['id'] : BigInt.from(map['id']),
      message: map['message'],
      passedWith: (map['passedWith'] as List?)?.map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
      proposer: Principal.from(map['proposer']),
      rejectedWith: (map['rejectedWith'] as List?)?.map((e) {
        return e == null
            ? null
            : e is BigInt
                ? e
                : BigInt.from(e);
      }).firstOrNull,
    );
  }

  /// [createdOn] : int
  final BigInt createdOn;

  /// [executed] : optbool
  final bool? executed;

  /// [finalisedAt] : optint
  final BigInt? finalisedAt;

  /// [id] : nat
  final BigInt id;

  /// [message] : text
  final String message;

  /// [passedWith] : optint
  final BigInt? passedWith;

  /// [proposer] : principal
  final Principal proposer;

  /// [rejectedWith] : optint
  final BigInt? rejectedWith;

  static final RecordClass idl = IDL.Record(
    <String, dynamic>{
      'createdOn': IDL.Int,
      'executed': IDL.Opt(
        IDL.Bool,
      ),
      'finalisedAt': IDL.Opt(
        IDL.Int,
      ),
      'id': IDL.Nat,
      'message': IDL.Text,
      'passedWith': IDL.Opt(
        IDL.Int,
      ),
      'proposer': IDL.Principal,
      'rejectedWith': IDL.Opt(
        IDL.Int,
      ),
    },
  );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'createdOn': createdOn,
      'executed': [if (executed != null) executed],
      'finalisedAt': [if (finalisedAt != null) finalisedAt],
      'id': id,
      'message': message,
      'passedWith': [if (passedWith != null) passedWith],
      'proposer': proposer,
      'rejectedWith': [if (rejectedWith != null) rejectedWith],
    }..removeWhere((String key, dynamic value) {
        return value == null;
      });
  }

  /// Types defined in Candid
  /// * [createdOn] : int
  /// * [executed] : optbool
  /// * [finalisedAt] : optint
  /// * [id] : nat
  /// * [message] : text
  /// * [passedWith] : optint
  /// * [proposer] : principal
  /// * [rejectedWith] : optint
  Proposal copyWith({
    BigInt? createdOn,
    bool? executed,
    BigInt? finalisedAt,
    BigInt? id,
    String? message,
    BigInt? passedWith,
    Principal? proposer,
    BigInt? rejectedWith,
  }) {
    return Proposal(
      createdOn: createdOn ?? this.createdOn,
      executed: executed ?? this.executed,
      finalisedAt: finalisedAt ?? this.finalisedAt,
      id: id ?? this.id,
      message: message ?? this.message,
      passedWith: passedWith ?? this.passedWith,
      proposer: proposer ?? this.proposer,
      rejectedWith: rejectedWith ?? this.rejectedWith,
    );
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Proposal &&
          runtimeType == other.runtimeType &&
          this.createdOn == other.createdOn &&
          this.executed == other.executed &&
          this.finalisedAt == other.finalisedAt &&
          this.id == other.id &&
          this.message == other.message &&
          this.passedWith == other.passedWith &&
          this.proposer == other.proposer &&
          this.rejectedWith == other.rejectedWith;

  @override
  int get hashCode =>
      createdOn.hashCode ^
      executed.hashCode ^
      finalisedAt.hashCode ^
      id.hashCode ^
      message.hashCode ^
      passedWith.hashCode ^
      proposer.hashCode ^
      rejectedWith.hashCode;
}
