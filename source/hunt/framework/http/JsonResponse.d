module hunt.framework.http.JsonResponse;

import std.conv;
import std.datetime;
import std.json;


import hunt.logging;
// import hunt.framework.http.cookie;
import hunt.framework.util.String;
import hunt.framework.Version;
import hunt.framework.http.Response;
import hunt.framework.http.Request;

import hunt.http.codec.http.model.HttpHeader;

/**
 * Response represents an HTTP response in JSON format.
 *
 * Note that this class does not force the returned JSON content to be an
 * object. It is however recommended that you do return an object as it
 * protects yourself against XSSI and JSON-JavaScript Hijacking.
 *
 * @see https://www.owasp.org/index.php/OWASP_AJAX_Security_Guidelines#Always_return_JSON_with_an_Object_on_the_outside
 *
 */
class JsonResponse : Response
{
    this(Request request, string contentType = JsonContentType)
    {
        super(request);
        setHeader(HttpHeader.CONTENT_TYPE, contentType);
    }

    this(Request request, JSONValue data, string contentType = JsonContentType)
    {
        this(request, data.toString(), contentType);
    }

    this(Request request, string data, string contentType = JsonContentType)
    {
        super(request);
        setHeader(HttpHeader.CONTENT_TYPE, contentType);
        setContent(data);
    }

    /**
     * Get the json_decoded data from the response.
     *
     * @return JSONValue
     */
    // JSONValue getData()
    // {
    //     return parseJSON(getContent());
    // }

    /**
     * Sets a raw string containing a JSON document to be sent.
     *
     * @param string data
     *
     * @return this
     */
    JsonResponse json(JSONValue data)
    {
        this.setContent(data.toString());
        return this;
    }

}
