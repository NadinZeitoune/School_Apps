var fileName1 = "united_kingdom.jpg";
var fileName2 = "united_state_of_america.jpg";
var longFile = "the_brown_fox_is_good_fox.png";

window.onload = function (){
    changeFile1();
    // changeFile2();
    // changeLongFile();
}

function changeFile1(){
    fileName1 = fileName1.replace("_", " ");
    let indxDot = fileName1.indexOf(".");
    fileName1 = fileName1.substr(0, indxDot);
    id_file1.innerHTML = fileName1;
}

function returnFileName(_fileName){
    _fileName = _fileName.replace("_", " ");
    let indxDot = _fileName.indexOf(".");
    _fileName = _fileName.substr(0, indxDot);
    return _fileName;
}