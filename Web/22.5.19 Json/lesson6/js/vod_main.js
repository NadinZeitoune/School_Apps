window.onload = function () {
    doApiRequest();

    declareBtn();
}

function declareBtn() {
    id_dark.addEventListener("click", function () {
        id_dark.style.display = "none";
    });
}

function onBtnVodClick(_this) {
    doApiRequest(_this.dataset.cat);
}

function doApiRequest(_id = 20) {
    id_parent.innerHTML = "";
    var xmlHttp = new XMLHttpRequest();
    var url = "https://api.themoviedb.org/3/list/" + _id + "?api_key=d4bc3c640586e7f90dc68d8b300247ff&language=en-US&fbclid=IwAR2fAU7s72zXynmFpW78E2hAHHa8WX0QT-Nro28Uxuf09U4sPP_m5Dydqik";
    xmlHttp.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var json_ar = JSON.parse(this.response).items;
            createAllVod(json_ar);
        }
    }

    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}

function createAllVod(_json_ar) {
    for (let i in _json_ar) {
        let {
            title,
            vote_average,
            vote_count,
            poster_path,
            overview
        } = _json_ar[i];

        let url_poster = "https://image.tmdb.org/t/p/w500/";

        var newMovie = new VodClass(id_parent, url_poster + poster_path, title, vote_average, vote_count, overview);
        newMovie.addToHTML();
    }
}