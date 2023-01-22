const player = new Gapless5({useHTML5Audio:false});
const audio = new PreciseAudio();
function addTrack(track) {
    //audio.updateTracks(track);
    player.addTrack(track);
}

function play() {
    player.play();
    //audio.play()
}

function stop(){
    player.stop()
    //audio.pause()
}