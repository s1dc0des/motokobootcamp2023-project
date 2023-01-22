// const ghostTokenCanisterId = "fjbi2-fyaaa-aaaan-qanjq-cai";
// const lotteryCanisterId = "6hl7o-nqaaa-aaaak-acqwq-cai";

const anons_dao_canister = "kbnct-kyaaa-aaaap-aayka-cai";
const whitelist = [anons_dao_canister];

// let ghostTokenActor;
// let lotteryActor;

let anons_dao_actor;
let principal;
let anonsDaoIDl;

async function setupAnonsDao() {
  anons_dao_actor = await window.ic.plug.createActor({
    caniterId: anons_dao_canister,
    interfaceFactory: anonsDaoIDl,
  });
  console.log("anons dao actor");
  console.log(anons_dao_actor);
}

// async function setupGhostToken() {
//   ghostTokenActor = await window.ic.plug.createActor({
//     canisterId: ghostTokenCanisterId,
//     interfaceFactory: ghostIDL,
//   });
//   console.log("ghost token actor");
//   console.log(ghostTokenActor);
// }

// async function setupLottery() {
//   lotteryActor = await window.ic.plug.createActor({
//     canisterId: lotteryCanisterId,
//     interfaceFactory: lotteryIDL,
//   });
//   console.log("lottery actor");
//   console.log(lotteryActor);
// }

async function requestConnect() {
  await window?.ic?.plug?.requestConnect({
    whitelist,
  });
}

async function isConnected() {
  console.log(window?.ic);
  const connected = await window.ic.plug.isConnected();
  if (!connected) await window.ic.plug.requestConnect({ whitelist });
  await window?.ic?.plug?.requestConnect({
    whitelist,
  });
  principal = await window.ic.plug.agent.getPrincipal();
  console.log(principal);
  await setupGhostToken();
  await setupLottery();
  return principal !== undefined ? true : false;
}

function getPrincipal() {
  return principal.toText();
}

async function transfer(params) {
  const result = await window.ic.plug.requestTransfer(params);
  console.log(result);
  return jsonFactory(result);
}

function jsonFactory(json) {
  return JSON.stringify(
    json,
    (key, value) => (typeof value === "bigint" ? value.toString() : value) // return everything else unchanged
  );
}