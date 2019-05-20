window.onload = function () {
    createCard();
}

function createCard() {
    var newCakeCard1 = new CardClass("pic1.jpg", "Chocolate cherry CAKE", 250, 5);
    var newCakeCard2 = new CardClass("pic2.jpg", "Chocolate CAKE", 150, 2);
    var newCakeCard3 = new CardClass("pic3.jpg", "Cheese CAKE", 275, 4);
    var newCakeCard4 = new CardClass("pic4.jpg", "Choco-Cheese CAKE", 200, 3);

    newCakeCard1.addToHtml();
    newCakeCard2.addToHtml();
    newCakeCard3.addToHtml();
    newCakeCard4.addToHtml();
}