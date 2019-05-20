window.onload = function () {
    createAllBooks();
}
var newCake;

function createAllBooks() {
    newCake = new Book("pic1.jpg", "cake1", "chocolate", 150);
    // newCake.addToHtml();

    newCake1 = new Book("pic1.jpg", "cake1", "chocolate", 150);
    newCake2 = new Book("pic2.jpg", "cake2", "chocolate", 150);
    newCake3 = new Book("pic3.jpg", "cake3", "chocolate", 150);
    newCake4 = new Book("pic4.jpg", "cake4", "chocolate", 150);

    let cakes_ar = [newCake1, newCake2, newCake3, newCake4];

    let rnd = Math.random() * 4;
    rnd = Math.ceil(rnd);
    cakes_ar[rnd - 1].addToHtml();
}