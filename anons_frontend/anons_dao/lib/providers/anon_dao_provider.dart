import 'package:anons_dao/did/anons_ic_backend.idl.dart';
import 'package:anons_dao/services/anons_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final anonDaoProvider = ChangeNotifierProvider<AnonDaoProvider>((ref) {
  return AnonDaoProvider();
});

class AnonDaoProvider with ChangeNotifier {
  final _anonService = AnonsService();

  List<Proposal> proposals = [];
  Map<int, List<Vote>> votes = {};
  bool isBusy = false;

  setBusy(bool isBusy) async {
    this.isBusy = isBusy;
    notifyListeners();
  }

  getAllProposals() async {
    proposals.clear();
    setBusy(true);
    final prs = await _anonService.getAllProposalsS();
    for (var p in prs) {
      proposals.add(p.item2);
      getVotesOnProposal(p.item1.toInt());
    }
    setBusy(false);
  }

  getVotesOnProposal(int id) async {
    final c = await _anonService.getVotesOnProposalS(id);
    if (c != null) {
      if (c.isNotEmpty) {
        votes[id] = c;
        notifyListeners();
      }
    }
  }
}
