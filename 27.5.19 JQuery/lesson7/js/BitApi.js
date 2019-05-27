class BitClass {
    constructor(_parent, _name, _id, _price) {
        this.parent = _parent;
        this.name = _name;
        this.id = _id;
        this.price = Number(_price).toFixed(2);
    }

    addToHtml() {
        var col6 = document.createElement("div");
        col6.className = "col-6 p-2"
        this.parent.appendChild(col6);

        var box = document.createElement("div");
        box.className = "box_inside p-2";
        col6.appendChild(box);

        let img_url = `https://files.coinmarketcap.com/static/widget/coins_legacy/64x64/${this.id}.png`
        box.innerHTML += `<img class="float-left mr-3"
        src=${img_url}>`

        box.innerHTML += `<h2>${this.name}</h2>`
        box.innerHTML += `<p>Value: $${this.price}</p>`

        let myBtn = document.createElement("button");
        myBtn.className = "btn btn-info";
        myBtn.innerHTML = "Follow coin";
        box.appendChild(myBtn);

        let span = document.createElement("span");
        this.newSpan = span;
        box.appendChild(span);

        myBtn.onclick = function () {
            localStorage.setItem(this.id, this.price);
            this.checkSavedPrice();
        }.bind(this);

        this.checkSavedPrice();
    }

    checkSavedPrice() {
        if (localStorage[this.id]) {
            let coloredSpan = this.checkChanges((this.price - localStorage[this.id]).toFixed(2));
            this.newSpan.innerHTML = "Has changed: $ ";
            this.newSpan.appendChild(coloredSpan);
        }
    }

    checkChanges(_value) {
        let span = document.createElement("span");
        span.innerHTML = _value;

        if (_value >= 0) {
            span.style.color = "green";
        } else {
            span.style.color = "red";
        }

        return span;
    }
}