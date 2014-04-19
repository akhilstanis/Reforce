if("WebSocket" in window) {

    var ws = new ReconnectingWebSocket("%%WEBSOCKET_URL%%");

    ws.onopen = function() {
        // Web Socket is connected
        // alert("websocket is open");

        // You can send data now
        // ws.send("Hey man, you got the time?");

        console.log('onOpen!');
    };

    ws.onmessage = function(evt) {
        // alert("received: " + evt.data);
        console.log('onMessage!');
        evt.data == 'r' ? Reveal.right() : Reveal.left();
    };

    ws.onclose = function() {
        console.log('onClose!');
    };

} else alert("Browser doesn't support WebSocket!");
