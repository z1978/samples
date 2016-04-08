// ==UserScript==
// @name        test user js
// @namespace   http://www.yahoo.co.jp/
// @description 「Hello Yahoo !」を表示するだけのサンプルです。「http://www.yahoo.co.jp/」の「code」以外のページを開いた場合にのみ動作します。
// @include     http://www.yahoo.co.jp/*
// @exclude     http://www.yahoo.co.jp/code/*
// ==/UserScript==

// Yahoo 検索
var script04 = document.createElement('script');
script04.innerHTML = 'function autoInput(){document.getElementById("srchtxt").value="yahoo";}'
script04.innerHTML = script04.innerHTML + 'function clickBtn(){autoInput();	document.getElementById("srchbtn").click();}';
document.body.appendChild(script04);

var strButton='<form><input type="button"  value="My Button" onclick="clickBtn()"></form>';
var testdiv = document.getElementById("searchbox");
testdiv.innerHTML=testdiv.innerHTML + strButton;