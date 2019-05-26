window.onload = function () {
    doApiRequest();
}


function doApiRequest(_limit = 10) {
    id_parent.innerHTML = "";
    var xmlHttp = new XMLHttpRequest();
    var url = "https://api.coinmarketcap.com/v1/ticker/?limit=" + _limit;
    xmlHttp.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var json_ar = JSON.parse(this.response);
            createAllCoins(json_ar);
        }
    }

    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}

function createAllCoins(_json_ar) {
    for (let i in _json_ar) {
        let {
            id,
            name,
            symbol,
            price_usd
        } = _json_ar[i];

        let url_image = "https://files.coinmarketcap.com/static/widget/coins_legacy/64x64/" + id + ".png";

        var newCoin = new CoinsClass(id_parent, id, url_image, name, symbol, price_usd);
        newCoin.addToHTML();
    }
}

function onChangeInput(_this){
    doApiRequest(_this.value);
}