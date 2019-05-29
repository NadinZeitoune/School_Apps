class Car {
    constructor(_name, _color) {
        this.name = _name;
        this.color = _color;
    }

    addToHtml() {
        let newDiv = document.createElement("div");
        this.newDiv = newDiv;
        document.body.appendChild(newDiv);

        newDiv.innerHTML = `<h2>${this.name}</h2>`;
        newDiv.innerHTML += `<p>Color: ${this.color}</p>`;
    }
}

class Truck extends Car {
    constructor(_name, _color, _kg) {
        super(_name, _color);
        this.kg = _kg;
    }

    addKgToHtml() {
        this.newDiv.innerHTML += `<p>Kg: ${this.kg}</p>`;
    }
}

class Plane extends Car {
    setKmh(_kmh) {
        this.kmh = _kmh;
    }

    addKmhToHtml() {
        this.addToHtml();
        this.newDiv.innerHTML += `<p>Kmh: ${this.kmh}</p>`
    }
}