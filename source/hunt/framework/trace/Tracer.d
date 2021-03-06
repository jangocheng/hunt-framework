module hunt.framework.trace.Tracer;

import hunt.framework.http.Request;
import hunt.framework.http.Response;
import hunt.trace;
import hunt.logging;

import std.conv;


void newFrameworkTrace(Request req)
{
    if(!tracing())
        return ;

    auto tracer = new Tracer(req.getMCA() , req.headerExists("b3")?req.header("b3"):"");
    tracer.root.addTag(HTTP_HOST , req.host);
    tracer.root.addTag(HTTP_URL , req.url);
    tracer.root.addTag(HTTP_PATH , req.path);
    tracer.root.addTag(HTTP_METHOD , req.methodAsString);
    tracer.root.addTag(HTTP_REQUEST_SIZE ,  to!string(req.size));
    tracer.root.start();
    setTracer(tracer);
}

void finishFrameworkTrace(string error)
{
    auto tracer = getTracer();
    if(tracer is null)
        return;
    tracer.root.addTag(SPAN_ERROR , error);
    finishFrameworkUpload(tracer);
}

void finishFrameworkTrace(Response response)
{
    auto tracer = getTracer();
    if(tracer is null)
        return ;

    tracer.root.addTag(HTTP_STATUS_CODE , to!string(response.status));
    tracer.root.addTag(HTTP_RESPONSE_SIZE , to!string(response.size));
    finishFrameworkUpload(tracer);
}

private void finishFrameworkUpload(Tracer tracer)
{
    tracer.root.finish();

    uploadFromIMF(tracer.root ~ tracer.children);

    version(HUNT_DEBUG) logInfo(" mca: " , tracer.root.name , " duration: " , 
        tracer.root.duration / 1000 , " traceId: " , tracer.root.traceId );
}



