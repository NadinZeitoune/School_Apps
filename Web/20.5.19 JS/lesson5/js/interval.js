var timer;
var frames;
var secs;
var mins;
var play = false;

window.onload = function () {
    resetApp();
}

function resetApp() {
    frames = 0;
    id_frames.innerHTML = 0;
    secs = 0;
    id_sec.innerHTML = addZero(secs);
    mins = 0;
    id_min.innerHTML = addZero(mins);
    play = false;
}

function update() {
    if (play) {
        frames++;
        let miliSec = Math.floor((frames % 30) * 3.33);
        id_frames.innerHTML = addZero(miliSec);

        if (frames % 30 == 0) {
            secs++;

            if (secs >= 60) {
                secs = 0;
                mins++;
                id_min.innerHTML = addZero(mins);
            }

            id_sec.innerHTML = addZero(secs);
        }
    }
}

function addZero(_value) {
    if (_value >= 10) {
        return _value;
    }

    return "0" + _value;
}

function onClickStart() {
    play = true;
    timer = setInterval(update, 1000 / 30);
}

function onClickPause() {
    play = false;
}

function onClickReset() {
    clearInterval(timer);
    resetApp();
}