function Book(_img, _name, _type, _price) {
    this.img = _img;
    this.name = _name;
    this.price = _price;
    this.type = _type;

    this.addToHtml = function () {
        var newDiv = document.createElement("div");
        newDiv.className = "col-md-6 border";
        id_parent.appendChild(newDiv);

        var newImg = document.createElement("img");
        newImg.src = "_images/" + this.img;
        newImg.className = "mr-3";
        newImg.style.float = "left";
        newDiv.appendChild(newImg);
        newDiv.innerHTML += `<h2>${this.name}</h2>
        <p class="m-0">Type: ${this.type}</p>
        <p class="m-0">Price: ${this.price}$</p>`;
        newDiv.onclick = function () {
            alert(this.name);
        }.bind(this);
    }
}