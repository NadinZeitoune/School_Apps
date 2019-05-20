function CardClass(_img, _name, _price, _time) {
    this.img = _img;
    this.name = _name;
    this.price = _price;
    this.time = _time;

    this.addToHtml = function () {
        var newDiv = document.createElement("div");
        newDiv.className = "card p-3";
        newDiv.style.width = "18rem";
        id_parent.appendChild(newDiv);

        var newImg = document.createElement("img");
        newImg.src = "_images/" + this.img;
        newImg.className = "card-img-top";
        newImg.alt = "Card image cap";
        newDiv.appendChild(newImg);
        newDiv.innerHTML += `<h4 class="card-title">${this.name}</h4>
        <p class="card-text">Price: ${this.price}$</p>
        <p class="card-text">Will take: ${this.time} hours</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>`;
    }
}