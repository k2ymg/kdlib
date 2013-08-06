/** msxml.d

Converted from 'msxml.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.msxml;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.oaidl;


extern(C){

struct XML_ERROR {
	uint _nLine;
	BSTR _pchBuf;
	uint _cchBuf;
	uint _ich;
	BSTR _pszFound;
	BSTR _pszExpected;
	DWORD _reserved1;
	DWORD _reserved2;
}

enum {
	NODE_INVALID                = 0,
	NODE_ELEMENT                = NODE_INVALID + 1,
	NODE_ATTRIBUTE              = NODE_ELEMENT + 1,
	NODE_TEXT                   = NODE_ATTRIBUTE + 1,
	NODE_CDATA_SECTION          = NODE_TEXT + 1,
	NODE_ENTITY_REFERENCE       = NODE_CDATA_SECTION + 1,
	NODE_ENTITY                 = NODE_ENTITY_REFERENCE + 1,
	NODE_PROCESSING_INSTRUCTION = NODE_ENTITY + 1,
	NODE_COMMENT                = NODE_PROCESSING_INSTRUCTION + 1,
	NODE_DOCUMENT               = NODE_COMMENT + 1,
	NODE_DOCUMENT_TYPE          = NODE_DOCUMENT + 1,
	NODE_DOCUMENT_FRAGMENT      = NODE_DOCUMENT_TYPE + 1,
	NODE_NOTATION               = NODE_DOCUMENT_FRAGMENT + 1
}
alias int DOMNodeType;

enum {
	XMLELEMTYPE_ELEMENT  = 0,
	XMLELEMTYPE_TEXT     = XMLELEMTYPE_ELEMENT + 1,
	XMLELEMTYPE_COMMENT  = XMLELEMTYPE_TEXT + 1,
	XMLELEMTYPE_DOCUMENT = XMLELEMTYPE_COMMENT + 1,
	XMLELEMTYPE_DTD      = XMLELEMTYPE_DOCUMENT + 1,
	XMLELEMTYPE_PI       = XMLELEMTYPE_DTD + 1,
	XMLELEMTYPE_OTHER    = XMLELEMTYPE_PI + 1
}
alias int XMLELEM_TYPE;

extern extern(C) const IID LIBID_MSXML;

//extern extern(C) const IID IID_IXMLDOMImplementation;
interface IXMLDOMImplementation : IDispatch {
public extern(Windows):
	HRESULT hasFeature(BSTR feature, BSTR version_, VARIANT_BOOL* hasFeature);
}
mixin DEFINE_IID!(IXMLDOMImplementation, "2933BF8F-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMNode;
interface IXMLDOMNode : IDispatch {
public extern(Windows):
	HRESULT get_nodeName(BSTR* name);
	HRESULT get_nodeValue(VARIANT* value);
	HRESULT put_nodeValue(VARIANT value);
	HRESULT get_nodeType(DOMNodeType type);
	HRESULT get_parentNode(IXMLDOMNode* parent);
	HRESULT get_childNodes(IXMLDOMNodeList* childList);
	HRESULT get_firstChild(IXMLDOMNode* firstChild);
	HRESULT get_lastChild(IXMLDOMNode* lastChild);
	HRESULT get_previousSibling(IXMLDOMNode* previousSibling);
	HRESULT get_nextSibling(IXMLDOMNode* nextSibling);
	HRESULT get_attributes(IXMLDOMNamedNodeMap* attributeMap);
	HRESULT insertBefore(IXMLDOMNode newChild, VARIANT refChild, IXMLDOMNode* outNewChild);
	HRESULT replaceChild(IXMLDOMNode newChild, IXMLDOMNode oldChild, IXMLDOMNode* outOldChild);
	HRESULT removeChild(IXMLDOMNode childNode, IXMLDOMNode* oldChild);
	HRESULT appendChild(IXMLDOMNode newChild, IXMLDOMNode* outNewChild);
	HRESULT hasChildNodes(VARIANT_BOOL* hasChild);
	HRESULT get_ownerDocument(IXMLDOMDocument* XMLDOMDocument);
	HRESULT cloneNode(VARIANT_BOOL deep, IXMLDOMNode* cloneRoot);
	HRESULT get_nodeTypeString(BSTR* nodeType);
	HRESULT get_text(BSTR* text);
	HRESULT put_text(BSTR text);
	HRESULT get_specified(VARIANT_BOOL* isSpecified);
	HRESULT get_definition(IXMLDOMNode* definitionNode);
	HRESULT get_nodeTypedValue(VARIANT* typedValue);
	HRESULT put_nodeTypedValue(VARIANT typedValue);
	HRESULT get_dataType(VARIANT* dataTypeName);
	HRESULT put_dataType(BSTR dataTypeName);
	HRESULT get_xml(BSTR* xmlString);
	HRESULT transformNode(IXMLDOMNode stylesheet, BSTR* xmlString);
	HRESULT selectNodes(BSTR queryString, IXMLDOMNodeList* resultList);
	HRESULT selectSingleNode(BSTR queryString, IXMLDOMNode* resultNode);
	HRESULT get_parsed(VARIANT_BOOL* isParsed);
	HRESULT get_namespaceURI(BSTR* namespaceURI);
	HRESULT get_prefix(BSTR* prefixString);
	HRESULT get_baseName(BSTR* nameString);
	HRESULT transformNodeToObject(IXMLDOMNode stylesheet, VARIANT outputObject);
}
mixin DEFINE_IID!(IXMLDOMNode, "2933BF80-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMDocumentFragment;
interface IXMLDOMDocumentFragment : IXMLDOMNode {
public extern(Windows):
}
mixin DEFINE_IID!(IXMLDOMDocumentFragment, "3efaa413-272f-11d2-836f-0000f87a7782");

//extern extern(C) const IID IID_IXMLDOMDocument;
interface IXMLDOMDocument : IXMLDOMNode {
public extern(Windows):
	HRESULT get_doctype(IXMLDOMDocumentType* documentType);
	HRESULT get_implementation(IXMLDOMImplementation* impl);
	HRESULT get_documentElement(IXMLDOMElement* DOMElement);
	HRESULT putref_documentElement(IXMLDOMElement DOMElement);
	HRESULT createElement(BSTR tagName, IXMLDOMElement* element);
	HRESULT createDocumentFragment(IXMLDOMDocumentFragment* docFrag);
	HRESULT createTextNode(BSTR data, IXMLDOMText* text);
	HRESULT createComment(BSTR data, IXMLDOMComment* comment);
	HRESULT createCDATASection(BSTR data, IXMLDOMCDATASection* cdata);
	HRESULT createProcessingInstruction(BSTR target, BSTR data, IXMLDOMProcessingInstruction* pi);
	HRESULT createAttribute(BSTR name, IXMLDOMAttribute* attribute);
	HRESULT createEntityReference(BSTR name, IXMLDOMEntityReference* entityRef);
	HRESULT getElementsByTagName(BSTR tagName, IXMLDOMNodeList* resultList);
	HRESULT createNode(VARIANT Type, BSTR name, BSTR namespaceURI, IXMLDOMNode* node);
	HRESULT nodeFromID(BSTR idString, IXMLDOMNode* node);
	HRESULT load(VARIANT xmlSource, VARIANT_BOOL* isSuccessful);
	HRESULT get_readyState(int* value);
	HRESULT get_parseError(IXMLDOMParseError* errorObj);
	HRESULT get_url(BSTR* urlString);
	HRESULT get_async(VARIANT_BOOL* isAsync);
	HRESULT put_async(VARIANT_BOOL isAsync);
	HRESULT abort();
	HRESULT loadXML(BSTR bstrXML, VARIANT_BOOL* isSuccessful);
	HRESULT save(VARIANT destination);
	HRESULT get_validateOnParse(VARIANT_BOOL* isValidating);
	HRESULT put_validateOnParse(VARIANT_BOOL isValidating);
	HRESULT get_resolveExternals(VARIANT_BOOL* isResolving);
	HRESULT put_resolveExternals(VARIANT_BOOL isResolving);
	HRESULT get_preserveWhiteSpace(VARIANT_BOOL* isPreserving);
	HRESULT put_preserveWhiteSpace(VARIANT_BOOL isPreserving);
	HRESULT put_onreadystatechange(VARIANT readystatechangeSink);
	HRESULT put_ondataavailable(VARIANT ondataavailableSink);
	HRESULT put_ontransformnode(VARIANT ontransformnodeSink);
}
mixin DEFINE_IID!(IXMLDOMDocument, "2933BF81-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMNodeList;
interface IXMLDOMNodeList : IDispatch {
public extern(Windows):
	HRESULT get_item(int index, IXMLDOMNode* listItem);
	HRESULT get_length(int* listLength);
	HRESULT nextNode(IXMLDOMNode* nextItem);
	HRESULT reset();
	HRESULT get__newEnum(IUnknown* ppUnk);
}
mixin DEFINE_IID!(IXMLDOMNodeList, "2933BF82-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMNamedNodeMap;
interface IXMLDOMNamedNodeMap : IDispatch {
public extern(Windows):
	HRESULT getNamedItem(BSTR name, IXMLDOMNode* namedItem);
	HRESULT setNamedItem(IXMLDOMNode newItem, IXMLDOMNode* nameItem);
	HRESULT removeNamedItem(BSTR name, IXMLDOMNode* namedItem);
	HRESULT get_item(int index, IXMLDOMNode* listItem);
	HRESULT get_length(int* listLength);
	HRESULT getQualifiedItem(BSTR baseName, BSTR namespaceURI, IXMLDOMNode* qualifiedItem);
	HRESULT removeQualifiedItem(BSTR baseName, BSTR namespaceURI, IXMLDOMNode* qualifiedItem);
	HRESULT nextNode(IXMLDOMNode* nextItem);
	HRESULT reset();
	HRESULT get__newEnum(IUnknown* ppUnk);
}
mixin DEFINE_IID!(IXMLDOMNamedNodeMap, "2933BF83-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMCharacterData;
interface IXMLDOMCharacterData : IXMLDOMNode {
public extern(Windows):
	HRESULT get_data(BSTR* data);
	HRESULT put_data(BSTR data);
	HRESULT get_length(int* dataLength);
	HRESULT substringData(int offset, int count, BSTR* data);
	HRESULT appendData(BSTR data);
	HRESULT insertData(int offset, BSTR data);
	HRESULT deleteData(int offset, int count);
	HRESULT replaceData(int offset, int count, BSTR data);
}
mixin DEFINE_IID!(IXMLDOMCharacterData, "2933BF84-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMAttribute;
interface IXMLDOMAttribute : IXMLDOMNode {
public extern(Windows):
	HRESULT get_name(BSTR* attributeName);
	HRESULT get_value(VARIANT* attributeValue);
	HRESULT put_value(VARIANT attributeValue);
}
mixin DEFINE_IID!(IXMLDOMAttribute, "2933BF85-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMElement;
interface IXMLDOMElement : IXMLDOMNode {
public extern(Windows):
	HRESULT get_tagName(BSTR* tagName);
	HRESULT getAttribute(BSTR name, VARIANT* value);
	HRESULT setAttribute(BSTR name, VARIANT value);
	HRESULT removeAttribute(BSTR name);
	HRESULT getAttributeNode(BSTR name, IXMLDOMAttribute* attributeNode);
	HRESULT setAttributeNode(IXMLDOMAttribute DOMAttribute, IXMLDOMAttribute* attributeNode);
	HRESULT removeAttributeNode(IXMLDOMAttribute DOMAttribute, IXMLDOMAttribute* attributeNode);
	HRESULT getElementsByTagName(BSTR tagName, IXMLDOMNodeList* resultList);
	HRESULT normalize();
}
mixin DEFINE_IID!(IXMLDOMElement, "2933BF86-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMText;
interface IXMLDOMText : IXMLDOMCharacterData {
public extern(Windows):
	HRESULT splitText(int offset, IXMLDOMText* rightHandTextNode);
}
mixin DEFINE_IID!(IXMLDOMText, "2933BF87-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMComment;
interface IXMLDOMComment : IXMLDOMCharacterData {
public extern(Windows):
}
mixin DEFINE_IID!(IXMLDOMComment, "2933BF88-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMProcessingInstruction;
interface IXMLDOMProcessingInstruction : IXMLDOMNode {
public extern(Windows):
	HRESULT get_target(BSTR* name);
	HRESULT get_data(BSTR* value);
	HRESULT put_data(BSTR value);
}
mixin DEFINE_IID!(IXMLDOMProcessingInstruction, "2933BF89-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMCDATASection;
interface IXMLDOMCDATASection : IXMLDOMText {
public extern(Windows):
}
mixin DEFINE_IID!(IXMLDOMCDATASection, "2933BF8A-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMDocumentType;
interface IXMLDOMDocumentType : IXMLDOMNode {
public extern(Windows):
	HRESULT get_name(BSTR* rootName);
	HRESULT get_entities(IXMLDOMNamedNodeMap* entityMap);
	HRESULT get_notations(IXMLDOMNamedNodeMap* notationMap);
}
mixin DEFINE_IID!(IXMLDOMDocumentType, "2933BF8B-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMNotation;
interface IXMLDOMNotation : IXMLDOMNode {
public extern(Windows):
	HRESULT get_publicId(VARIANT* publicID);
	HRESULT get_systemId(VARIANT* systemID);
}
mixin DEFINE_IID!(IXMLDOMNotation, "2933BF8C-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMEntity;
interface IXMLDOMEntity : IXMLDOMNode {
public extern(Windows):
	HRESULT get_publicId(VARIANT* publicID);
	HRESULT get_systemId(VARIANT* systemID);
	HRESULT get_notationName(BSTR* name);
}
mixin DEFINE_IID!(IXMLDOMEntity, "2933BF8D-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMEntityReference;
interface IXMLDOMEntityReference : IXMLDOMNode {
public extern(Windows):
}
mixin DEFINE_IID!(IXMLDOMEntityReference, "2933BF8E-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLDOMParseError;
interface IXMLDOMParseError : IDispatch {
public extern(Windows):
	HRESULT get_errorCode(int* errorCode);
	HRESULT get_url(BSTR* urlString);
	HRESULT get_reason(BSTR* reasonString);
	HRESULT get_srcText(BSTR* sourceString);
	HRESULT get_line(int* lineNumber);
	HRESULT get_linepos(int* linePosition);
	HRESULT get_filepos(int* filePosition);
}
mixin DEFINE_IID!(IXMLDOMParseError, "3efaa426-272f-11d2-836f-0000f87a7782");

//extern extern(C) const IID IID_IXTLRuntime;
interface IXTLRuntime : IXMLDOMNode {
public extern(Windows):
	HRESULT uniqueID(IXMLDOMNode pNode, int* pID);
	HRESULT depth(IXMLDOMNode pNode, int* pDepth);
	HRESULT childNumber(IXMLDOMNode pNode, int* pNumber);
	HRESULT ancestorChildNumber(BSTR bstrNodeName, IXMLDOMNode pNode, int* pNumber);
	HRESULT absoluteChildNumber(IXMLDOMNode pNode, int* pNumber);
	HRESULT formatIndex(int lIndex, BSTR bstrFormat, BSTR* pbstrFormattedString);
	HRESULT formatNumber(double dblNumber, BSTR bstrFormat, BSTR* pbstrFormattedString);
	HRESULT formatDate(VARIANT varDate, BSTR bstrFormat, VARIANT varDestLocale, BSTR* pbstrFormattedString);
	HRESULT formatTime(VARIANT varTime, BSTR bstrFormat, VARIANT varDestLocale, BSTR* pbstrFormattedString);
}
mixin DEFINE_IID!(IXTLRuntime, "3efaa425-272f-11d2-836f-0000f87a7782");

//extern extern(C) const IID DIID_XMLDOMDocumentEvents;
interface XMLDOMDocumentEvents : IDispatch {
}
mixin DEFINE_IID!(XMLDOMDocumentEvents, "3efaa427-272f-11d2-836f-0000f87a7782");

mixin DEFINE_GUID!("CLSID_DOMDocument", "2933BF90-7B36-11d2-B20E-00C04F983E60");
mixin DEFINE_GUID!("CLSID_DOMFreeThreadedDocument", "2933BF91-7B36-11d2-B20E-00C04F983E60");

//extern extern(C) const IID IID_IXMLHttpRequest;
interface IXMLHttpRequest : IDispatch {
public extern(Windows):
	HRESULT open(BSTR bstrMethod, BSTR bstrUrl, VARIANT varAsync, VARIANT bstrUser, VARIANT bstrPassword);
	HRESULT setRequestHeader(BSTR bstrHeader, BSTR bstrValue);
	HRESULT getResponseHeader(BSTR bstrHeader, BSTR* pbstrValue);
	HRESULT getAllResponseHeaders(BSTR* pbstrHeaders);
	HRESULT send(VARIANT varBody);
	HRESULT abort();
	HRESULT get_status(int* plStatus);
	HRESULT get_statusText(BSTR* pbstrStatus);
	HRESULT get_responseXML(IDispatch* ppBody);
	HRESULT get_responseText(BSTR* pbstrBody);
	HRESULT get_responseBody(VARIANT* pvarBody);
	HRESULT get_responseStream(VARIANT* pvarBody);
	HRESULT get_readyState(int* plState);
	HRESULT put_onreadystatechange(IDispatch pReadyStateSink);
}
mixin DEFINE_IID!(IXMLHttpRequest, "ED8C108D-4349-11D2-91A4-00C04F7969E8");

mixin DEFINE_GUID!("CLSID_XMLHTTPRequest", "ED8C108E-4349-11D2-91A4-00C04F7969E8");

//extern extern(C) const IID IID_IXMLDSOControl;
interface IXMLDSOControl : IDispatch {
public extern(Windows):
	HRESULT get_XMLDocument(IXMLDOMDocument* ppDoc);
	HRESULT put_XMLDocument(IXMLDOMDocument ppDoc);
	HRESULT get_JavaDSOCompatible(BOOL* fJavaDSOCompatible);
	HRESULT put_JavaDSOCompatible(BOOL fJavaDSOCompatible);
	HRESULT get_readyState(int* state);
}
mixin DEFINE_IID!(IXMLDSOControl, "310afa62-0575-11d2-9ca9-0060b0ec3d39");

mixin DEFINE_GUID!("CLSID_XMLDSOControl", "550dda30-0541-11d2-9ca9-0060b0ec3d39");

//extern extern(C) const IID IID_IXMLElementCollection;
interface IXMLElementCollection : IDispatch {
public extern(Windows):
	HRESULT put_length(int v);
	HRESULT get_length(int* p);
	HRESULT get__newEnum(IUnknown* ppUnk);
	HRESULT item(VARIANT var1, VARIANT var2, IDispatch* ppDisp);
}
mixin DEFINE_IID!(IXMLElementCollection, "65725580-9B5D-11d0-9BFE-00C04FC99C8E");

//extern extern(C) const IID IID_IXMLDocument;
interface IXMLDocument : IDispatch {
public extern(Windows):
	HRESULT get_root(IXMLElement* p);
	HRESULT get_fileSize(BSTR* p);
	HRESULT get_fileModifiedDate(BSTR* p);
	HRESULT get_fileUpdatedDate(BSTR* p);
	HRESULT get_URL(BSTR* p);
	HRESULT put_URL(BSTR p);
	HRESULT get_mimeType(BSTR* p);
	HRESULT get_readyState(int* pl);
	HRESULT get_charset(BSTR* p);
	HRESULT put_charset(BSTR p);
	HRESULT get_version(BSTR* p);
	HRESULT get_doctype(BSTR* p);
	HRESULT get_dtdURL(BSTR* p);
	HRESULT createElement(VARIANT vType, VARIANT var1, IXMLElement* ppElem);
}
mixin DEFINE_IID!(IXMLDocument, "F52E2B61-18A1-11d1-B105-00805F49916B");

//extern extern(C) const IID IID_IXMLDocument2;
interface IXMLDocument2 : IDispatch {
public extern(Windows):
	HRESULT get_root(IXMLElement2* p);
	HRESULT get_fileSize(BSTR* p);
	HRESULT get_fileModifiedDate(BSTR* p);
	HRESULT get_fileUpdatedDate(BSTR* p);
	HRESULT get_URL(BSTR* p);
	HRESULT put_URL(BSTR p);
	HRESULT get_mimeType(BSTR* p);
	HRESULT get_readyState(int* pl);
	HRESULT get_charset(BSTR* p);
	HRESULT put_charset(BSTR p);
	HRESULT get_version(BSTR* p);
	HRESULT get_doctype(BSTR* p);
	HRESULT get_dtdURL(BSTR* p);
	HRESULT createElement(VARIANT vType, VARIANT var1, IXMLElement2* ppElem);
	HRESULT get_async(VARIANT_BOOL* pf);
	HRESULT put_async(VARIANT_BOOL f);
}
mixin DEFINE_IID!(IXMLDocument2, "2B8DE2FE-8D2D-11d1-B2FC-00C04FD915A9");

//extern extern(C) const IID IID_IXMLElement;
interface IXMLElement : IDispatch {
public extern(Windows):
	HRESULT get_tagName(BSTR* p);
	HRESULT put_tagName(BSTR p);
	HRESULT get_parent(IXMLElement* ppParent);
	HRESULT setAttribute(BSTR strPropertyName, VARIANT PropertyValue);
	HRESULT getAttribute(BSTR strPropertyName, VARIANT* PropertyValue);
	HRESULT removeAttribute(BSTR strPropertyName);
	HRESULT get_children(IXMLElementCollection* pp);
	HRESULT get_type(int* plType);
	HRESULT get_text(BSTR* p);
	HRESULT put_text(BSTR p);
	HRESULT addChild(IXMLElement pChildElem, int lIndex, int lReserved);
	HRESULT removeChild(IXMLElement pChildElem);
}
mixin DEFINE_IID!(IXMLElement, "3F7F31AC-E15F-11d0-9C25-00C04FC99C8E");

//extern extern(C) const IID IID_IXMLElement2;
interface IXMLElement2 : IDispatch {
public extern(Windows):
	HRESULT get_tagName(BSTR* p);
	HRESULT put_tagName(BSTR p);
	HRESULT get_parent(IXMLElement2* ppParent);
	HRESULT setAttribute(BSTR strPropertyName, VARIANT PropertyValue);
	HRESULT getAttribute(BSTR strPropertyName, VARIANT* PropertyValue);
	HRESULT removeAttribute(BSTR strPropertyName);
	HRESULT get_children(IXMLElementCollection* pp);
	HRESULT get_type(int* plType);
	HRESULT get_text(BSTR* p);
	HRESULT put_text(BSTR p);
	HRESULT addChild(IXMLElement2 pChildElem, int lIndex, int lReserved);
	HRESULT removeChild(IXMLElement2 pChildElem);
	HRESULT get_attributes(IXMLElementCollection* pp);
}
mixin DEFINE_IID!(IXMLElement2, "2B8DE2FF-8D2D-11d1-B2FC-00C04FD915A9");

//extern extern(C) const IID IID_IXMLAttribute;
interface IXMLAttribute : IDispatch {
public extern(Windows):
	HRESULT get_name(BSTR* n);
	HRESULT get_value(BSTR* v);
}
mixin DEFINE_IID!(IXMLAttribute, "D4D4A0FC-3B73-11d1-B2B4-00C04FB92596");

extern extern(C) const IID IID_IXMLError;
interface IXMLError : IUnknown {
public extern(Windows):
	HRESULT GetErrorInfo(XML_ERROR* pErrorReturn);
}
mixin DEFINE_IID!(IXMLError, "948C5AD3-C58D-11d0-9C0B-00C04FC99C8E");

mixin DEFINE_GUID!("CLSID_XMLDocument", "CFC399AF-D876-11d0-9C10-00C04FC99C8E");

} // extern(C)
