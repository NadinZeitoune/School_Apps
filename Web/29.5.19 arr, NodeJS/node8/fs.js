let fs = require("fs");

// fs.appendFile("books.txt", "THE BEST BOOK EVER!", function (err) {
fs.writeFile("books.txt", "THE BEST BOOK EVER!!!", function (err) {
    if (err) {
        console.log(err);
    } else {
        console.log("file created!");
    }
});