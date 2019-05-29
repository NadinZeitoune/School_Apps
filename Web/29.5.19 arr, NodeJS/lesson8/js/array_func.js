// filter
let products_ar = [{
        name: "apple",
        price: 9
    },
    {
        name: "banana",
        price: 4
    }, {
        name: "orange",
        price: 6
    }
];

let expansive_prod_ar = products_ar.filter(function (item) {

    return item.price > 5;

    // if (item.price > 5) {
    //     return true;
    // } else {
    //     return false;
    // }
});

// map
let names_ar = [{
        first: "ofer",
        last: "shelly"
    },
    {
        first: "koko",
        last: "akof"
    },
    {
        first: "donald",
        last: "duck"
    }
];

let fullName_ar = names_ar.map(getFullName);

function getFullName(item) {
    return item.first + " " + item.last;
}

// reduce
let usd_ar = [40, 30, 20, 5];

let totalUSD = usd_ar.reduce(function (prev, curr) {
    let total;
    total = prev + curr;
    // console.log(total);
    return total;
});

let totalNIS = usd_ar.reduce(function (prev, curr, i, arr) {
    let total;
    total = prev + curr;
    if (i == arr.length - 1) {
        total *= 3.7;
    }
    // console.log(total);
    return total;
});

window.onload = function () {
    // console.table(expansive_prod_ar);
    // console.table(fullName_ar);
    console.log(totalNIS);
}