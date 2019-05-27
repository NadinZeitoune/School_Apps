$(document).ready(function () {

    $("h2").html("jquery-rule");

    $(".para3").css("color", "red");

    $("#id_para7").html("jquery controls you");
    $(id_para7).css("color", "skyblue");

    $(id_img1).attr("width", 200);

    $("p:nth-of-type(4)").css("border", "3px solid gold");

    $("p:contains(mon)").css("background", "aqua");


    var obj_css = {
        color: "red",
        backgroundColor: "yellow",
        fontSize: "5em"
    }
    $(".para8").css(obj_css);
});