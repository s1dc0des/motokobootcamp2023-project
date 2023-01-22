import 'package:anons_dao/did/anons_ic_backend.idl.dart';
import 'package:anons_dao/services/anons_controller.dart';
import 'package:anons_dao/services/init.dart';
import 'package:tuple/tuple.dart';
import '../constants/constants.dart';

class AnonsService {
  static late AnonsController _controller;
  String canister = Constants.anonsCanister;

  Future<AnonsController> setup() async {
    String url = "https://ic0.app";
    _controller = await AgentFactory.create(
      canisterId: canister,
      url: url,
      idl: AnonsIcBackend.idl,
      debug: true,
    ).hook(AnonsController());
    return _controller;
  }

  Future<List<Tuple2<BigInt, Proposal>>> getAllProposalsS() {
    return getAllProposals(_controller.actor);
  }

  Future<Proposal?> getProposalS(int id) {
    return getProposal(_controller.actor, BigInt.from(id));
  }

  Future<List<Vote>?> getVotesOnProposalS(int id) {
    return getVotesOnProposal(_controller.actor, BigInt.from(id));
  }

  Future<BigInt> lastExecutionAtS() {
    return lastExecutionAt(_controller.actor);
  }
}
