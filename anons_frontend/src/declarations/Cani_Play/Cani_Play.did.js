export const idlFactory = ({ IDL }) => {
  const Result = IDL.Variant({ 'ok' : IDL.Text, 'err' : IDL.Text });
  const Track = IDL.Record({
    'id' : IDL.Text,
    'pid' : IDL.Text,
    'likes' : IDL.Int,
    'dislikes' : IDL.Int,
  });
  const Result_1 = IDL.Variant({ 'ok' : IDL.Vec(Track), 'err' : IDL.Text });
  return IDL.Service({
    'addToPlaylist' : IDL.Func([IDL.Text, IDL.Text], [Result], []),
    'getPlaylist' : IDL.Func([IDL.Text], [Result_1], ['query']),
    'putDislike' : IDL.Func([IDL.Text, IDL.Text], [Result], []),
    'putLike' : IDL.Func([IDL.Text, IDL.Text], [Result], []),
  });
};
export const init = ({ IDL }) => { return []; };
