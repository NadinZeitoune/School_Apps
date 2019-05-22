window.onload = function () {
    //createAllVIP();

    doApiRequest();
}

function doApiRequest() {
    var xmlHttp = new XMLHttpRequest();
    var url = "rich.json";
    xmlHttp.onreadystatechange = function () {
        if (this.status == 200 && this.readyState == 4) {
            var json_ar = JSON.parse(this.response);
            console.table(json_ar);
            createAllVIP(json_ar);
        }
    }

    xmlHttp.open("GET", url, true);
    xmlHttp.send();
}

function createAllVIP(_json_ar) {
    for (var i in _json_ar) {
        var item = _json_ar[i];

        let {
            image,
            name,
            birth_year,
            worth
        } = item;

        var myVIP = new RichClass(id_parent, image, name, 2019 - birth_year, worth);
        myVIP.AddToHTML();
    }
}