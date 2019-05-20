var timer;
var text;
var count;

window.onload = function () {

}

function onInputText() {
    // open input


    if (id_input.value.length > 6) {
        id_input.disabled = true;
    }
}

function onClickPlay() {
    // disable btn
    //id_btn.disabled = true;

    text = id_input.value;
    count = 0;
    id_h4.innerHTML = "";
    timer = setInterval(update, 500);
}

function update() {
    if (count < text.length) {
        id_h4.innerHTML += text.substr(count, 1);

        count++;
    } else {
        clearInterval(timer);

        // open btn
        //id_btn.disabled = false;
    }
}