//http://www.pori2.net/html5/File/020.html
//テキストファイルを読み込む－JavaScript入門（HTML5編）
// 
function zMain(){
  var obj1 = document.getElementById("selfile");
  
  //ダイアログでファイルが選択された時
  obj1.addEventListener("change",function(evt){
  
    var file = evt.target.files;
  
    //FileReaderの作成
    var reader = new FileReader();
    //テキスト形式で読み込む
    reader.readAsText(file[0]);

    //読込終了後の処理
    reader.onload = function(ev){
      //テキストエリアに表示する
      document.test.txt.value = reader.result;
      zReadline(reader.result);
    }
  },false);
}

// 
function zReadline(text){
	var lines = text.split( '\n' );
	var outArray = new Array();
    for ( var i = 0; i < lines.length; i++ ) {
        // 空行は無視する
        if ( lines[i] == '' ) {
            continue;
        }
        //outArray.push( lines[i] );
        console.log(lines[i]);
        zCreateLink(i,lines[i]);
    }
 
    return outArray;
}

// 
function zCreateLink(i,url) {
   document.body.appendChild(document.createElement("br"));
   var a=document.createElement("a");
   a.id="a"+i;
   a.href=url;
   a.innerText="我是超链接"+i;
   a.title="我是超链接"+i;
   a.target="_blank";
   document.body.appendChild(a);
    
   i++;
}

// 
function readFile(){
  var obj1 = document.getElementById("selfile");
  
  //ダイアログでファイルが選択された時
  obj1.addEventListener("change",function(evt){
  
    var file = evt.target.files;
  
    //FileReaderの作成
    var reader = new FileReader();
    //テキスト形式で読み込む
    reader.readAsText(file[0]);

    //読込終了後の処理
    reader.onload = function(ev){
      //テキストエリアに表示する
      document.test.txt.value = reader.result;
    }
  },false);
}
