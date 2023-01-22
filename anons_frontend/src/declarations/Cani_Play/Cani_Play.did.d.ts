import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export type Result = { 'ok' : string } |
  { 'err' : string };
export type Result_1 = { 'ok' : Array<Track> } |
  { 'err' : string };
export interface Track {
  'id' : string,
  'pid' : string,
  'likes' : bigint,
  'dislikes' : bigint,
}
export interface _SERVICE {
  'addToPlaylist' : ActorMethod<[string, string], Result>,
  'getPlaylist' : ActorMethod<[string], Result_1>,
  'putDislike' : ActorMethod<[string, string], Result>,
  'putLike' : ActorMethod<[string, string], Result>,
}
