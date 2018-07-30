<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Camel Twitter WebSocket Example</title>
    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
    <script type='text/javascript'>

        if (!window.WebSocket) {
        alert("WebSocket not supported by this browser");
        }

        function $() { return document.getElementById(arguments[0]); }

        var room = {
        join: function(name) {
       // this._username=name;
        var location = "ws://localhost:8080/powerroom/websocket";
        this._ws=new WebSocket(location);
        this._ws.onmessage=this._onmessage;
        this._ws.onclose=this._onclose;
        },

        _onmessage: function(m) {
        if (m.data){
        //var data =  eval("(" + m.data + ")");
        //var result = "温度:"+data.TempValue+" "+"湿度:"+data.HumValue+" "+"时间:"+data.Time;
        var chat=$('chat');
        var spanText = document.createElement('span');
        spanText.className='text';
        spanText.innerHTML=m.data;
        var lineBreak = document.createElement('br');
        chat.appendChild(spanText);
        chat.appendChild(lineBreak);
        chat.scrollTop = chat.scrollHeight - chat.clientHeight;
        }
        },

        _onclose: function(m) {
        this._ws=null;
        }

        };

    </script>
    <style type='text/css'>
        div { border: 0px solid black; }
        div#chat { clear: both; width: 80em; height: 60ex; overflow: auto; background-color: #f0f0f0; padding: 4px; border: 1px solid black; }
    </style>
</head>
<body>
<div id='chat'></div>
<script type='text/javascript'>
    room.join("Testing");
</script>
</body>
</html>
