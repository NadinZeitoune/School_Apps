let users_ar = [{
        name: "moshe",
        age: 40,
        state: "israel"
    },
    {
        name: "jack",
        age: 30,
        state: "USA"
    },
    {
        name: "david",
        age: 20,
        state: "UK"
    },
    {
        name: "koko",
        age: 90,
        state: "zoo"
    },
    {
        name: "mark",
        age: 35,
        state: "USA"
    }
];

window.onload = function () {
    createAllUsers(users_ar);
}

function createAllUsers(users) {
    for (let i in users) {
        let {
            name,
            age,
            state
        } = users[i];

        let newUser = new User(id_parent, name, age, state);
        newUser.addToHtml();
    }
}

class User {
    constructor(_parent, _name, _age, _state) {
        this.parent = _parent;
        this.name = _name;
        this.age = _age;
        this.state = _state;
    }

    addToHtml() {
        let newDiv = document.createElement("div");
        newDiv.className = "box border";
        newDiv.style.width = "50%";
        this.parent.appendChild(newDiv);

        newDiv.innerHTML = `<label class="box-text text-left">${this.name}</label>`;
        newDiv.innerHTML += `<label class="box-text text-right">${this.state}</label>`;
        newDiv.innerHTML += `<p class="box-text">${this.age}</p>`;
    }
}