// console.log("from page 1");

class Man {
    constructor(_name, _age) {
        this.name = _name;
        this.age = _age;
    }

    showName() {
        console.log(this.name);
    }

    showAge() {
        console.log(this.age);
    }
}
module.exports = Man;