window.onload = function () {
    restApi();
}

function createAllCoins(_json) {
    for (let i in _json) {

        let {
            id,
            name,
            price_usd
        } = _json[i];

        let coin = new BitClass(id_row_parent, name, id, price_usd);
        coin.addToHtml();
    }

}

function restApi() {
    var xmlHttp = new XMLHttpRequest();
    var url = "https://api.coinmarketcap.com/v1/ticker/?limit=10";
    xmlHttp.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var json_ar = JSON.parse(this.response);
            createAllCoins(json_ar);
        }
    }

    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}