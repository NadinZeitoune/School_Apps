let http = require("http");
let fs = require("fs");

http.createServer(function (req, res) {

    // fs.readFile("firstHttp.html", function (err, data) {
    fs.readFile("." + req.url, function (err, data) {
        if (err) {
            console.log(err);
            res.writeHead(200, {
                'content-type': `text/html`
            });
            res.write("<h2>Bad URL! 404 404 404</h2>");
            res.end();
        } else {
            res.writeHead(200, {
                'content-type': `text/html`
            });
            res.write(data /* + " " + req.url*/ );
            res.end();

        }
    });

}).listen(3000);