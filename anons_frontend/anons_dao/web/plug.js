const anons_dao_canister = "kbnct-kyaaa-aaaap-aayka-cai";
const whitelist = [anons_dao_canister];

let anons_dao_actor;
let principal;

async function setupAnonsDao() {
  try {
    anons_dao_actor = await window.ic.plug.createActor({
      canisterId: anons_dao_canister,
      interfaceFactory: anonsDaoIDL,
    });
    console.log("anons dao actor");
    console.log(anons_dao_actor);

  } catch (error) {
    console.log(error);
  }
}

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
  await setupAnonsDao();
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