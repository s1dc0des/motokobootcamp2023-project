const anonsDaoIDL = ({ IDL }) => {
  const Proposal = IDL.Record({
    'id': IDL.Int,
    'rejectedWith': IDL.Opt(IDL.Int),
    'createdOn': IDL.Int,
    'finalisedAt': IDL.Opt(IDL.Int),
    'message': IDL.Text,
    'passedWith': IDL.Opt(IDL.Int),
    'proposer': IDL.Principal,
    'proposalStatus': IDL.Opt(IDL.Bool),
  });
  const Vote = IDL.Record({
    'vote': IDL.Variant({ 'Pass': IDL.Text, 'Reject': IDL.Text }),
    'voterPrincipal': IDL.Principal,
  });
  const Result = IDL.Variant({ 'Ok': IDL.Text, 'Err': IDL.Text });
  return IDL.Service({
    'getCycles': IDL.Func([], [IDL.Nat], ['query']),
    'getHeapSize': IDL.Func([], [IDL.Nat], ['query']),
    'getMemorySize': IDL.Func([], [IDL.Nat], ['query']),
    'getMyMbBalance': IDL.Func([], [IDL.Nat], []),
    'get_all_proposals': IDL.Func(
      [],
      [IDL.Vec(IDL.Tuple(IDL.Nat, Proposal))],
      ['query'],
    ),
    'get_proposal': IDL.Func([IDL.Nat], [IDL.Opt(Proposal)], ['query']),
    'get_votes_on_proposal': IDL.Func(
      [IDL.Nat],
      [IDL.Opt(IDL.Vec(Vote))],
      ['query'],
    ),
    'submit_proposal': IDL.Func([IDL.Text], [Result], []),
    'testMbTokenService': IDL.Func([], [IDL.Text], []),
    'vote': IDL.Func(
      [IDL.Nat, IDL.Variant({ 'Pass': IDL.Text, 'Reject': IDL.Text })],
      [Result],
      [],
    ),
  });
};
