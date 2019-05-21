window.onload = function () {
    createCard();
}

function createCard(){
    let cards_ar = [];

    for(let item of json_ar){
        cards_ar.push(new CardClass(item.image, item.name, item.worth, 2019 - item.birth_year, item.country, item.source));
    }

    let rnd = Math.random() * cards_ar.length;
    rnd = Math.ceil(rnd);
    
    cards_ar[rnd-1].addToHtml();
}