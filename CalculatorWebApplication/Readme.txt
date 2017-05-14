- What is WSDL and what's purpose?
- How is proxy class generated?
- What is the use of a proxy class?
- What actually happens when a web service reference is added?

Visual Studio generates a proxy class using the WSDL of the web service. The WSDL contains 
1) all the methods that are exposed
2) parameter and their types
3) return types of the methods.

Client application calls  the proxy class method.
The proxy class will seriallize the parameters and prepare a SOAP request message and send it to the web service.
The web service executes method and return SOAP response message to the proxy.
The proxy class will deserialize SOAP response message and send it to client.