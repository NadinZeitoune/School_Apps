var fileName1 = "united_kingdom.jpg";
var fileName2 = "united_state_of_america.jpg";
var longFile = "the_brown_fox_is_good_fox.png";

window.onload = function (){
    changeFile1();
    changeFile2();
    
    id_longFile.innerHTML = returnFileName(longFile);
}

function changeFile1(){
    fileName1 = fileName1.replace("_", " ");
    let indxDot = fileName1.indexOf(".");
    fileName1 = fileName1.substr(0, indxDot);
    id_file1.innerHTML = fileName1;
}

function changeFile2(){
    while(fileName2.indexOf("_") != -1){
        fileName2 = fileName2.replace("_", " ");
    }

    let indxDot = fileName2.indexOf(".");
    fileName2 = fileName2.substr(0, indxDot);
    id_file2.innerHTML = fileName2;
}

function returnFileName(_fileName){
    while(_fileName.indexOf("_") != -1){
        _fileName = _fileName.replace("_", " ");
    }

    let indxDot = _fileName.indexOf(".");
    _fileName = _fileName.substr(0, indxDot);
    return _fileName;
}