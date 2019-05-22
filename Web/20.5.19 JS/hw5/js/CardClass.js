function CardClass(_img,_name,_money,_age,_state, _company){
    this.img = _img;
    this.name = _name;
    this.money = _money;
    this.age = _age;
    this.state = _state;
    this.company = _company;
}

CardClass.prototype.addToHtml = function(){
    var newCard = document.createElement("div");
    newCard.className = "card p-3";
    newCard.style.width = "25%";
    id_parent.appendChild(newCard);

    var newImage = document.createElement("img");
    newImage.src = "_images/QM.jpg";
    newImage.className = "card-img-top";
    newCard.appendChild(newImage);

    var newName = document.createElement("h4");
    newName.className = "card-title";
    newName.innerHTML = "????????";
    newCard.appendChild(newName);

    // solution: instead of newCard - newSpan.
    var newSpan = document.createElement("span");
    newCard.appendChild(newSpan);
    newSpan.innerHTML += `<p class="card-text">Age: ${this.age}</p>`;
    newSpan.innerHTML += `<p class="card-text">State: ${this.state}</p>`;
    newSpan.innerHTML += `<p class="card-text">Company: ${this.company}</p>`;
    newSpan.innerHTML += `<p class="card-text">Money: ${this.money}</p>`;

    var cardBtn = document.createElement("button");
    cardBtn.className = "btn btn-success";
    cardBtn.innerHTML = "Show me the answer!";
    newCard.appendChild(cardBtn);

    cardBtn.onclick = function(){
        newImage.src = this.img;
        newName.innerHTML = this.name;
    }.bind(this);

}
