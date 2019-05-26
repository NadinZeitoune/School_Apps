function CoinsClass(_parent, _id, _img, _name, _symbol, _price_usd) {
    this.parent = _parent;
    this.id = _id;
    this.img = _img;
    this.name = _name;
    this.symbol = _symbol;

    // Style the number.
    this.price_usd = Number(_price_usd).toFixed(2);
}


CoinsClass.prototype.addToHTML = function () {
    var newCoin = document.createElement("div");
    newCoin.className = "box";
    this.parent.appendChild(newCoin);

    newCoin.innerHTML += `<img src="${this.img}">`;
    newCoin.innerHTML += `<h2>${this.name}</h2>`;
    newCoin.innerHTML += `<div>Symbol: ${this.symbol}</div>`;
    newCoin.innerHTML += `<div>Price of ${this.symbol} in $: ${this.price_usd}$</div>`;

    newCoin.onclick = function () {
        var url = "https://coinmarketcap.com/currencies/" + this.id + "/#charts";
        window.open(url, "_blank");
    }.bind(this);
}