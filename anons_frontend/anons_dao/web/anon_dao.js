async function vote(id, passed, message) {
    let vote;
    if (passed) {
        vote =
            { 'Pass': message, };
    } else {
        vote =
            { 'Reject': message }
    }
    let request = {
        id,
        vote,
    }
    const result = await anons_dao_actor.vote(request);
    console.log(result);
    return jsonFactory(result);
}

async function submitProposal(message) {
    let request = { title: message }
    const result = await anons_dao_actor.submit_proposal(message);
    console.log(result);
    return jsonFactory(result);

}
