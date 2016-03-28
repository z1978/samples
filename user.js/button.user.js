// ==UserScript==
// @name        test user js
// @namespace   http://www.yahoo.co.jp/
// @description 「Hello Yahoo !」を表示するだけのサンプルです。「http://www.yahoo.co.jp/」の「code」以外のページを開いた場合にのみ動作します。
// @include     http://www.yahoo.co.jp/*
// @exclude     http://www.yahoo.co.jp/code/*
// ==/UserScript==

alert("Test Start!");

var divObj=document.createElement("div"); 
divObj.innerHTML="hi，欢迎访问 www.phpernote.com php 程序员教程网！";
var first=document.body.firstChild; //得到第一个元素
document.body.insertBefore(divObj,first); //在第原来的第一个元素之前插入

    function testArray() {
        // 空の配列を生成する
        var hairetsu = [];

        // 配列に要素を追加する
        hairetsu.push("値1");
        hairetsu.push("値2");
        hairetsu.push("値3");

        // 配列の内容を表示する
        alert("要素を追加した配列の内容\n↓\n" + hairetsu);
    }


        var hairetsu = [];

        // 配列に要素を追加する
        hairetsu.push("値1");
        hairetsu.push("値2");
        hairetsu.push("値3");

        // 配列の内容を表示する
        alert("要素を追加した配列の内容\n↓\n" + hairetsu);
alert("Test 2!");



function add()
{
    var div_element = document.createElement("div");
    div_element.innerHTML = '<hr>Title: <br><input type="text" name="title" size="50" value="試験文字列"><br>Contents: <br><textarea name="contents" rows="30" cols="100">試験\n試験\n試験</textarea>';
    var parent_object = document.getElementById("piyo");
    parent_object.appendChild(div_element);
}
add();
alert("Test End!");
