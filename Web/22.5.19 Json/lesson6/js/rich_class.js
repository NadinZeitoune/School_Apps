function RichClass(_parent, _img, _name, _age, _money) {
    this.parent = _parent;
    this.img = _img;
    this.name = _name;
    this.age = _age;
    this.money = _money;
}

RichClass.prototype.AddToHTML = function () {
    var newCard = document.createElement("div");
    newCard.className = "card p-2 col-4 text-center";
    newCard.style.width = "30%";
    this.parent.appendChild(newCard);

    newCard.innerHTML += `<img src="${this.img}" class="card-img-top">`;
    newCard.innerHTML += `<h2>${this.name}</h2>`;
    newCard.innerHTML += `<p class="card-text">Age:${this.age}</p>`;

    var newMoneyP = document.createElement("p");
    newMoneyP.className = "card-text";
    newMoneyP.innerHTML = "Money: UNKNWON";
    newCard.appendChild(newMoneyP);

    var newBtn = document.createElement("button");
    newBtn.className = "btn btn-info";
    newBtn.innerHTML = "Show me the money";
    newCard.appendChild(newBtn);

    newBtn.onclick = function () {
        newMoneyP.innerHTML = `Money: ${this.money}`;
    }.bind(this);
}