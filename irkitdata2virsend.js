var sys = require('sys');
var http = require('http');
var spawn = require('child_process').spawn;

var server = http.createServer(
    function (request, response) {
	var data = '';
	request.on('readable', function(chunk) {
	    var r = request.read();
	    if (r) {
		data += r;
	    }
	});
	request.on('end', function() {
	    var p = spawn('irkitdata2virsend.pl');
	    p.stdin.write(data);
	    sys.log(data+'\n');
	    p.stdin.end();
            response.writeHead(200);
	    response.end();
	});
    }
).listen(80);
sys.log('Server running at http://localhost:80/');
