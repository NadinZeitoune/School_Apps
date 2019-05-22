function VodClass(_parent, _img, _name, _voteAve, _voteCount, _description) {
    this.parent = _parent;
    this.img = _img;
    this.name = _name;
    this.voteAve = _voteAve;
    this.voteCount = _voteCount;
    this.description = _description;
}


VodClass.prototype.addToHTML = function () {
    var newMovie = document.createElement("div");
    newMovie.className = "box";
    this.parent.appendChild(newMovie);

    newMovie.innerHTML += `<img src="${this.img}">`;
    newMovie.innerHTML += `<h2>${this.name}</h2>`;
    newMovie.innerHTML += `<div>Rating: ${this.voteAve}</div>`;
    newMovie.innerHTML += `<div>No. of rates: ${this.voteCount}</div>`;
    newMovie.innerHTML += `<br><div>Description: ${this.description}</div>`;

    newMovie.onclick = function () {
        id_dark.style.display = "flex";
        id_dark_img.src = this.img;
        id_dark_h2.innerHTML = this.name;
        id_dark_p.innerHTML = this.description;
    }.bind(this);
}