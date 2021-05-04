//We have to create a new Request Executor class inherit from Sys.Net.XMLHttpExecutor for using the sync or async requests.
//The main changes are redirect the executerequest() method to a new executerequest() method in our new class which can be defined 
//the async flag true or false.
//begin - new HttpExecutor class
var useAsyncRequest = true;
            
Type.registerNamespace("EEC");

EEC.XMLHttpExecutor = function EEC$XMLHttpExecutor()
{
    EEC.XMLHttpExecutor.initializeBase(this);
    this._useAsyncRequest = useAsyncRequest;
}

EEC.XMLHttpExecutor.prototype =
{
    executeRequest : EEC$XMLHttpExecutor$executeRequest
}

function EEC$XMLHttpExecutor$executeRequest() 
{
    /// <summary locid="M:J#this._onTimeout" />
    if (arguments.length !== 0) throw Error.parameterCount();
    this._webRequest = this.get_webRequest();

    if (this._started) {
        throw Error.invalidOperation(String.format(Sys.Res.cannotCallOnceStarted, 'executeRequest'));
    }
    if (this._webRequest === null) {
        throw Error.invalidOperation(Sys.Res.nullWebRequest);
    }

    var body = this._webRequest.get_body();
    var headers = this._webRequest.get_headers();
    this._xmlHttpRequest = new XMLHttpRequest();
    this._xmlHttpRequest.onreadystatechange = this._onReadyStateChange;
    var verb = this._webRequest.get_httpVerb();
    this._xmlHttpRequest.open(verb, this._webRequest.getResolvedUrl(), this._useAsyncRequest);
    if (headers) {
        for (var header in headers) {
            var val = headers[header];
            if (typeof(val) !== "function")
                this._xmlHttpRequest.setRequestHeader(header, val);
        }
    }

    if (verb.toLowerCase() === "post") {
        // If it's a POST but no Content-Type was specified, default to application/x-www-form-urlencoded; charset=utf-8
        if ((headers === null) || !headers['Content-Type']) {
            // DevDiv 109456: Include charset=utf-8. Javascript encoding methods always use utf-8, server may be set to assume other encoding.
            this._xmlHttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=utf-8');
        }

        // DevDiv 15893: If POST with no body, default to ""(FireFox needs this)
        if (!body) {
            body = "";
        }
    }

    var timeout = this._webRequest.get_timeout();
    if (timeout > 0) {
        this._timer = window.setTimeout(Function.createDelegate(this, this._onTimeout), timeout);
    }
    this._xmlHttpRequest.send(body);
    this._started = true;
        
    if (!this._useAsyncRequest)
        this._useAsyncRequest = true;
}
    
EEC.XMLHttpExecutor.registerClass("EEC.XMLHttpExecutor", Sys.Net.XMLHttpExecutor);
Sys.Net.WebRequestManager.set_defaultExecutorType("EEC.XMLHttpExecutor");
//end - new HttpExecutor class