/** propsys.d

Converted from 'propsys.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.propsys;


import c.windows.windef;
import c.windows.wtypes;
import c.windows.guiddef;
import c.windows.unknwn;
import c.windows.objidl;
import c.windows.rpcdcep;
import c.windows.propkeydef;
import c.windows.propidl;
import c.windows.shtypes;
import c.windows.structuredquerycondition;
import c.windows.oaidl;


extern(C){

//extern extern(C) const IID IID_IInitializeWithFile;
interface IInitializeWithFile : IUnknown {
public extern(Windows):
	HRESULT Initialize(LPCWSTR pszFilePath, DWORD grfMode);
}
mixin DEFINE_IID!(IInitializeWithFile, "b7d14566-0509-4cce-a71f-0a554233bd9b");

//extern extern(C) const IID IID_IInitializeWithStream;
interface IInitializeWithStream : IUnknown {
public extern(Windows):
	HRESULT Initialize(IStream pstream, DWORD grfMode);
}
mixin DEFINE_IID!(IInitializeWithStream, "b824b49d-22ac-4161-ac8a-9916e8fa3f7f");

export extern(Windows){
	HRESULT IInitializeWithStream_RemoteInitialize_Proxy(IInitializeWithStream This, IStream pstream, DWORD grfMode);
	void IInitializeWithStream_RemoteInitialize_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD _pdwStubPhase);
}

//extern extern(C) const IID IID_IPropertyStore;
interface IPropertyStore : IUnknown {
public extern(Windows):
	HRESULT GetCount(DWORD* cProps);
	HRESULT GetAt(DWORD iProp, PROPERTYKEY* pkey);
	HRESULT GetValue(REFPROPERTYKEY key, PROPVARIANT* pv);
	HRESULT SetValue(REFPROPERTYKEY key, REFPROPVARIANT propvar);
	HRESULT Commit();
}
mixin DEFINE_IID!(IPropertyStore, "886d8eeb-8cf2-4446-8d02-cdba1dbdcf99");
alias IPropertyStore LPPROPERTYSTORE;

//extern extern(C) const IID IID_INamedPropertyStore;
interface INamedPropertyStore : IUnknown {
public extern(Windows):
	HRESULT GetNamedValue(LPCWSTR pszName, PROPVARIANT* ppropvar);
	HRESULT SetNamedValue(LPCWSTR pszName, REFPROPVARIANT propvar);
	HRESULT GetNameCount(DWORD* pdwCount);
	HRESULT GetNameAt(DWORD iProp, BSTR* pbstrName);
}
mixin DEFINE_IID!(INamedPropertyStore, "71604b0f-97b0-4764-8577-2f13e98a1422");

enum {
	GPS_DEFAULT               = 0,
	GPS_HANDLERPROPERTIESONLY = 0x1,
	GPS_READWRITE             = 0x2,
	GPS_TEMPORARY             = 0x4,
	GPS_FASTPROPERTIESONLY    = 0x8,
	GPS_OPENSLOWITEM          = 0x10,
	GPS_DELAYCREATION         = 0x20,
	GPS_BESTEFFORT            = 0x40,
	GPS_NO_OPLOCK             = 0x80,
	GPS_MASK_VALID            = 0xff
}
alias int GETPROPERTYSTOREFLAGS;

//extern extern(C) const IID IID_IObjectWithPropertyKey;
interface IObjectWithPropertyKey : IUnknown {
public extern(Windows):
	HRESULT SetPropertyKey(REFPROPERTYKEY key);
	HRESULT GetPropertyKey(PROPERTYKEY* pkey);
}
mixin DEFINE_IID!(IObjectWithPropertyKey, "fc0ca0a7-c316-4fd2-9031-3e628e6d4f23");

enum {
	PKA_SET = 0,
	PKA_APPEND,
	PKA_DELETE,
}
alias int PKA_FLAGS;

//extern extern(C) const IID IID_IPropertyChange;
interface IPropertyChange : IObjectWithPropertyKey {
public extern(Windows):
	HRESULT ApplyToPropVariant(REFPROPVARIANT propvarIn, PROPVARIANT* ppropvarOut);
}
mixin DEFINE_IID!(IPropertyChange, "f917bc8a-1bba-4478-a245-1bde03eb9431");

//extern extern(C) const IID IID_IPropertyChangeArray;
interface IPropertyChangeArray : IUnknown {
public extern(Windows):
	HRESULT GetCount(UINT* pcOperations);
	HRESULT GetAt(UINT iIndex, REFIID riid, void** ppv);
	HRESULT InsertAt(UINT iIndex, IPropertyChange ppropChange);
	HRESULT Append(IPropertyChange ppropChange);
	HRESULT AppendOrReplace(IPropertyChange ppropChange);
	HRESULT RemoveAt(UINT iIndex);
	HRESULT IsKeyInArray(REFPROPERTYKEY key);
}
mixin DEFINE_IID!(IPropertyChangeArray, "380f5cad-1b5e-42f2-805d-637fd392d31e");

//extern extern(C) const IID IID_IPropertyStoreCapabilities;
interface IPropertyStoreCapabilities : IUnknown {
public extern(Windows):
	HRESULT IsPropertyWritable(REFPROPERTYKEY key);
}
mixin DEFINE_IID!(IPropertyStoreCapabilities, "c8e2d566-186e-4d49-bf41-6909ead56acc");

enum {
	PSC_NORMAL      = 0,
	PSC_NOTINSOURCE = 1,
	PSC_DIRTY       = 2,
	PSC_READONLY    = 3
}
alias int PSC_STATE;

//extern extern(C) const IID IID_IPropertyStoreCache;
interface IPropertyStoreCache : IPropertyStore {
public extern(Windows):
	HRESULT GetState(REFPROPERTYKEY key, PSC_STATE* pstate);
	HRESULT GetValueAndState(REFPROPERTYKEY key, PROPVARIANT* ppropvar, PSC_STATE* pstate);
	HRESULT SetState(REFPROPERTYKEY key, PSC_STATE state);
	HRESULT SetValueAndState(REFPROPERTYKEY key, const(PROPVARIANT)* ppropvar, PSC_STATE state);
}
mixin DEFINE_IID!(IPropertyStoreCache, "3017056d-9a91-4e90-937d-746c72abbf4f");

enum {
	PET_DISCRETEVALUE = 0,
	PET_RANGEDVALUE   = 1,
	PET_DEFAULTVALUE  = 2,
	PET_ENDRANGE      = 3
}
alias int PROPENUMTYPE;

//extern extern(C) const IID IID_IPropertyEnumType;
interface IPropertyEnumType : IUnknown {
public extern(Windows):
	HRESULT GetEnumType(PROPENUMTYPE* penumtype);
	HRESULT GetValue(PROPVARIANT* ppropvar);
	HRESULT GetRangeMinValue(PROPVARIANT* ppropvarMin);
	HRESULT GetRangeSetValue(PROPVARIANT* ppropvarSet);
	HRESULT GetDisplayText(LPWSTR* ppszDisplay);
}
mixin DEFINE_IID!(IPropertyEnumType, "11e1fbf9-2d56-4a6b-8db3-7cd193a471f2");

//extern extern(C) const IID IID_IPropertyEnumType2;
interface IPropertyEnumType2 : IPropertyEnumType {
public extern(Windows):
	HRESULT GetImageReference(LPWSTR* ppszImageRes);
}
mixin DEFINE_IID!(IPropertyEnumType2, "9b6e051c-5ddd-4321-9070-fe2acb55e794");

//extern extern(C) const IID IID_IPropertyEnumTypeList;
interface IPropertyEnumTypeList : IUnknown {
public extern(Windows):
	HRESULT GetCount(UINT* pctypes);
	HRESULT GetAt(UINT itype, REFIID riid, void** ppv);
	HRESULT GetConditionAt(UINT nIndex, REFIID riid, void** ppv);
	HRESULT FindMatchingIndex(REFPROPVARIANT propvarCmp, UINT* pnIndex);
}
mixin DEFINE_IID!(IPropertyEnumTypeList, "a99400f4-3d84-4557-94ba-1242fb2cc9a6");

enum {
	PDTF_DEFAULT                = 0,
	PDTF_MULTIPLEVALUES         = 0x1,
	PDTF_ISINNATE               = 0x2,
	PDTF_ISGROUP                = 0x4,
	PDTF_CANGROUPBY             = 0x8,
	PDTF_CANSTACKBY             = 0x10,
	PDTF_ISTREEPROPERTY         = 0x20,
	PDTF_INCLUDEINFULLTEXTQUERY = 0x40,
	PDTF_ISVIEWABLE             = 0x80,
	PDTF_ISQUERYABLE            = 0x100,
	PDTF_CANBEPURGED            = 0x200,
	PDTF_SEARCHRAWVALUE         = 0x400,
	PDTF_ISSYSTEMPROPERTY       = 0x80000000,
	PDTF_MASK_ALL               = 0x800007ff
}
alias int PROPDESC_TYPE_FLAGS;

enum {
	PDVF_DEFAULT             = 0,
	PDVF_CENTERALIGN         = 0x1,
	PDVF_RIGHTALIGN          = 0x2,
	PDVF_BEGINNEWGROUP       = 0x4,
	PDVF_FILLAREA            = 0x8,
	PDVF_SORTDESCENDING      = 0x10,
	PDVF_SHOWONLYIFPRESENT   = 0x20,
	PDVF_SHOWBYDEFAULT       = 0x40,
	PDVF_SHOWINPRIMARYLIST   = 0x80,
	PDVF_SHOWINSECONDARYLIST = 0x100,
	PDVF_HIDELABEL           = 0x200,
	PDVF_HIDDEN              = 0x800,
	PDVF_CANWRAP             = 0x1000,
	PDVF_MASK_ALL            = 0x1bff
}
alias int PROPDESC_VIEW_FLAGS;

enum {
	PDDT_STRING     = 0,
	PDDT_NUMBER     = 1,
	PDDT_BOOLEAN    = 2,
	PDDT_DATETIME   = 3,
	PDDT_ENUMERATED = 4
}
alias int PROPDESC_DISPLAYTYPE;

enum {
	PDGR_DISCRETE     = 0,
	PDGR_ALPHANUMERIC = 1,
	PDGR_SIZE         = 2,
	PDGR_DYNAMIC      = 3,
	PDGR_DATE         = 4,
	PDGR_PERCENT      = 5,
	PDGR_ENUMERATED   = 6
}
alias int PROPDESC_GROUPING_RANGE;

enum {
	PDFF_DEFAULT              = 0,
	PDFF_PREFIXNAME           = 0x1,
	PDFF_FILENAME             = 0x2,
	PDFF_ALWAYSKB             = 0x4,
	PDFF_RESERVED_RIGHTTOLEFT = 0x8,
	PDFF_SHORTTIME            = 0x10,
	PDFF_LONGTIME             = 0x20,
	PDFF_HIDETIME             = 0x40,
	PDFF_SHORTDATE            = 0x80,
	PDFF_LONGDATE             = 0x100,
	PDFF_HIDEDATE             = 0x200,
	PDFF_RELATIVEDATE         = 0x400,
	PDFF_USEEDITINVITATION    = 0x800,
	PDFF_READONLY             = 0x1000,
	PDFF_NOAUTOREADINGORDER   = 0x2000
}
alias int PROPDESC_FORMAT_FLAGS;

enum {
	PDSD_GENERAL          = 0,
	PDSD_A_Z              = 1,
	PDSD_LOWEST_HIGHEST   = 2,
	PDSD_SMALLEST_BIGGEST = 3,
	PDSD_OLDEST_NEWEST    = 4
}
alias int PROPDESC_SORTDESCRIPTION;

enum {
	PDRDT_GENERAL  = 0,
	PDRDT_DATE     = 1,
	PDRDT_SIZE     = 2,
	PDRDT_COUNT    = 3,
	PDRDT_REVISION = 4,
	PDRDT_LENGTH   = 5,
	PDRDT_DURATION = 6,
	PDRDT_SPEED    = 7,
	PDRDT_RATE     = 8,
	PDRDT_RATING   = 9,
	PDRDT_PRIORITY = 10
}
alias int PROPDESC_RELATIVEDESCRIPTION_TYPE;

enum {
	PDAT_DEFAULT   = 0,
	PDAT_FIRST     = 1,
	PDAT_SUM       = 2,
	PDAT_AVERAGE   = 3,
	PDAT_DATERANGE = 4,
	PDAT_UNION     = 5,
	PDAT_MAX       = 6,
	PDAT_MIN       = 7
}
alias int PROPDESC_AGGREGATION_TYPE;

enum {
	PDCOT_NONE     = 0,
	PDCOT_STRING   = 1,
	PDCOT_SIZE     = 2,
	PDCOT_DATETIME = 3,
	PDCOT_BOOLEAN  = 4,
	PDCOT_NUMBER   = 5
}
alias int PROPDESC_CONDITION_TYPE;

//extern extern(C) const IID IID_IPropertyDescription;
interface IPropertyDescription : IUnknown {
public extern(Windows):
	HRESULT GetPropertyKey(PROPERTYKEY* pkey);
	HRESULT GetCanonicalName(LPWSTR* ppszName);
	HRESULT GetPropertyType(VARTYPE* pvartype);
	HRESULT GetDisplayName(LPWSTR* ppszName);
	HRESULT GetEditInvitation(LPWSTR* ppszInvite);
	HRESULT GetTypeFlags(PROPDESC_TYPE_FLAGS mask, PROPDESC_TYPE_FLAGS* ppdtFlags);
	HRESULT GetViewFlags(PROPDESC_VIEW_FLAGS* ppdvFlags);
	HRESULT GetDefaultColumnWidth(UINT* pcxChars);
	HRESULT GetDisplayType(PROPDESC_DISPLAYTYPE* pdisplaytype);
	HRESULT GetColumnState(SHCOLSTATEF* pcsFlags);
	HRESULT GetGroupingRange(PROPDESC_GROUPING_RANGE* pgr);
	HRESULT GetRelativeDescriptionType(PROPDESC_RELATIVEDESCRIPTION_TYPE* prdt);
	HRESULT GetRelativeDescription(REFPROPVARIANT propvar1, REFPROPVARIANT propvar2, LPWSTR* ppszDesc1, LPWSTR* ppszDesc2);
	HRESULT GetSortDescription(PROPDESC_SORTDESCRIPTION* psd);
	HRESULT GetSortDescriptionLabel(BOOL fDescending, LPWSTR* ppszDescription);
	HRESULT GetAggregationType(PROPDESC_AGGREGATION_TYPE* paggtype);
	HRESULT GetConditionType(PROPDESC_CONDITION_TYPE* pcontype, CONDITION_OPERATION* popDefault);
	HRESULT GetEnumTypeList(REFIID riid, void** ppv);
	HRESULT CoerceToCanonicalValue(PROPVARIANT* ppropvar);
	HRESULT FormatForDisplay(REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdfFlags, LPWSTR* ppszDisplay);
	HRESULT IsValueCanonical(REFPROPVARIANT propvar);
}
mixin DEFINE_IID!(IPropertyDescription, "6f79d558-3e96-4549-a1d1-7d75d2288814");

export extern(Windows){
	HRESULT IPropertyDescription_RemoteCoerceToCanonicalValue_Proxy(IPropertyDescription This, REFPROPVARIANT propvar, PROPVARIANT* ppropvar);
	void IPropertyDescription_RemoteCoerceToCanonicalValue_Stub(IRpcStubBuffer This, IRpcChannelBuffer _pRpcChannelBuffer, PRPC_MESSAGE _pRpcMessage, DWORD* _pdwStubPhase);
}

//extern extern(C) const IID IID_IPropertyDescription2;
interface IPropertyDescription2 : IPropertyDescription {
public extern(Windows):
	HRESULT GetImageReferenceForValue(REFPROPVARIANT propvar, LPWSTR* ppszImageRes);
}
mixin DEFINE_IID!(IPropertyDescription2, "57d2eded-5062-400e-b107-5dae79fe57a6");

//extern extern(C) const IID IID_IPropertyDescriptionAliasInfo;
interface IPropertyDescriptionAliasInfo : IPropertyDescription {
public extern(Windows):
	HRESULT GetSortByAlias(REFIID riid, void** ppv);
	HRESULT GetAdditionalSortByAliases(REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IPropertyDescriptionAliasInfo, "f67104fc-2af9-46fd-b32d-243c1404f3d1");

enum {
	PDSIF_DEFAULT         = 0,
	PDSIF_ININVERTEDINDEX = 0x1,
	PDSIF_ISCOLUMN        = 0x2,
	PDSIF_ISCOLUMNSPARSE  = 0x4,
	PDSIF_ALWAYSINCLUDE   = 0x8
}
alias int PROPDESC_SEARCHINFO_FLAGS;

enum {
	PDCIT_NONE         = 0,
	PDCIT_ONDISK       = 1,
	PDCIT_INMEMORY     = 2,
	PDCIT_ONDEMAND     = 3,
	PDCIT_ONDISKALL    = 4,
	PDCIT_ONDISKVECTOR = 5
}
alias int PROPDESC_COLUMNINDEX_TYPE;

//extern extern(C) const IID IID_IPropertyDescriptionSearchInfo;
interface IPropertyDescriptionSearchInfo : IPropertyDescription {
public extern(Windows):
	HRESULT GetSearchInfoFlags(PROPDESC_SEARCHINFO_FLAGS* ppdsiFlags);
	HRESULT GetColumnIndexType(PROPDESC_COLUMNINDEX_TYPE* ppdciType);
	HRESULT GetProjectionString(LPWSTR* ppszProjection);
	HRESULT GetMaxSize(UINT* pcbMaxSize);
}
mixin DEFINE_IID!(IPropertyDescriptionSearchInfo, "078f91bd-29a2-440f-924e-46a291524520");

//extern extern(C) const IID IID_IPropertyDescriptionRelatedPropertyInfo;
interface IPropertyDescriptionRelatedPropertyInfo : IPropertyDescription {
public extern(Windows):
	HRESULT GetRelatedProperty(LPCWSTR pszRelationshipName, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IPropertyDescriptionRelatedPropertyInfo, "507393f4-2a3d-4a60-b59e-d9c75716c2dd");

enum {
	PDEF_ALL             = 0,
	PDEF_SYSTEM          = 1,
	PDEF_NONSYSTEM       = 2,
	PDEF_VIEWABLE        = 3,
	PDEF_QUERYABLE       = 4,
	PDEF_INFULLTEXTQUERY = 5,
	PDEF_COLUMN          = 6
}
alias int PROPDESC_ENUMFILTER;

//extern extern(C) const IID IID_IPropertySystem;
interface IPropertySystem : IUnknown {
public extern(Windows):
	HRESULT GetPropertyDescription(REFPROPERTYKEY propkey, REFIID riid, void** ppv);
	HRESULT GetPropertyDescriptionByName(LPCWSTR pszCanonicalName, REFIID riid, void** ppv);
	HRESULT GetPropertyDescriptionListFromString(LPCWSTR pszPropList, REFIID riid, void** ppv);
	HRESULT EnumeratePropertyDescriptions(PROPDESC_ENUMFILTER filterOn, REFIID riid, void** ppv);
	HRESULT FormatForDisplay(REFPROPERTYKEY key, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdff, LPWSTR pszText, DWORD cchText);
	HRESULT FormatForDisplayAlloc(REFPROPERTYKEY key, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdff, LPWSTR* ppszDisplay);
	HRESULT RegisterPropertySchema(LPCWSTR pszPath);
	HRESULT UnregisterPropertySchema(LPCWSTR pszPath);
	HRESULT RefreshPropertySchema();
}
mixin DEFINE_IID!(IPropertySystem, "ca724e8a-c3e6-442b-88a4-6fb0db8035a3");

//extern extern(C) const IID IID_IPropertyDescriptionList;
interface IPropertyDescriptionList : IUnknown {
public extern(Windows):
	HRESULT GetCount(UINT* pcElem);
	HRESULT GetAt(UINT iElem, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IPropertyDescriptionList, "1f9fc1d0-c39b-4b26-817f-011967d3440e");

//extern extern(C) const IID IID_IPropertyStoreFactory;
interface IPropertyStoreFactory : IUnknown {
public extern(Windows):
	HRESULT GetPropertyStore(GETPROPERTYSTOREFLAGS flags, IUnknown pUnkFactory, REFIID riid, void** ppv);
	HRESULT GetPropertyStoreForKeys(const(PROPERTYKEY)* rgKeys, UINT cKeys, GETPROPERTYSTOREFLAGS flags, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IPropertyStoreFactory, "bc110b6d-57e8-4148-a9c6-91015ab2f3a5");

//extern extern(C) const IID IID_IDelayedPropertyStoreFactory;
interface IDelayedPropertyStoreFactory : IPropertyStoreFactory {
public extern(Windows):
	HRESULT GetDelayedPropertyStore(GETPROPERTYSTOREFLAGS flags, DWORD dwStoreId, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(IDelayedPropertyStoreFactory, "40d4577f-e237-4bdb-bd69-58f089431b6a");

enum {
	FPSPS_DEFAULT  = 0,
	FPSPS_READONLY = 0x1
}
alias int PERSIST_SPROPSTORE_FLAGS;

struct SERIALIZEDPROPSTORAGE {}
alias SERIALIZEDPROPSTORAGE* PUSERIALIZEDPROPSTORAGE;
alias const(SERIALIZEDPROPSTORAGE)* PCUSERIALIZEDPROPSTORAGE;

//extern extern(C) const IID IID_IPersistSerializedPropStorage;
interface IPersistSerializedPropStorage : IUnknown {
public extern(Windows):
	HRESULT SetFlags(PERSIST_SPROPSTORE_FLAGS flags);
	HRESULT SetPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, DWORD cb);
	HRESULT GetPropertyStorage(SERIALIZEDPROPSTORAGE** ppsps, DWORD* pcb);
}
mixin DEFINE_IID!(IPersistSerializedPropStorage, "e318ad57-0aa0-450f-aca5-6fab7103d917");

//extern extern(C) const IID IID_IPersistSerializedPropStorage2;
interface IPersistSerializedPropStorage2 : IPersistSerializedPropStorage {
public extern(Windows):
	HRESULT GetPropertyStorageSize(DWORD* pcb);
	HRESULT GetPropertyStorageBuffer(SERIALIZEDPROPSTORAGE* psps, DWORD cb, DWORD* pcbWritten);
}
mixin DEFINE_IID!(IPersistSerializedPropStorage2, "77effa68-4f98-4366-ba72-573b3d880571");

//extern extern(C) const IID IID_IPropertySystemChangeNotify;
interface IPropertySystemChangeNotify : IUnknown {
public extern(Windows):
	HRESULT SchemaRefreshed();
}
mixin DEFINE_IID!(IPropertySystemChangeNotify, "fa955fd9-38be-4879-a6ce-824cf52d609f");

//extern extern(C) const IID IID_ICreateObject;
interface ICreateObject : IUnknown {
public extern(Windows):
	HRESULT CreateObject(REFCLSID clsid, IUnknown pUnkOuter, REFIID riid, void** ppv);
}
mixin DEFINE_IID!(ICreateObject, "75121952-e0d0-43e5-9380-1d80483acf72");

export extern(Windows){
	HRESULT PSFormatForDisplay(REFPROPERTYKEY propkey, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdfFlags, LPWSTR pwszText, DWORD cchText);
	HRESULT PSFormatForDisplayAlloc(REFPROPERTYKEY key, REFPROPVARIANT propvar, PROPDESC_FORMAT_FLAGS pdff, PWSTR* ppszDisplay);
	HRESULT PSFormatPropertyValue(IPropertyStore pps, IPropertyDescription ppd, PROPDESC_FORMAT_FLAGS pdff, LPWSTR* ppszDisplay);
	HRESULT PSGetImageReferenceForValue(REFPROPERTYKEY propkey, REFPROPVARIANT propvar, PWSTR* ppszImageRes);
}

enum {
	PKEY_PIDSTR_MAX = 10,
	GUIDSTRING_MAX  = 1 + 8 + 1 + 4 + 1 + 4 + 1 + 4 + 1 + 12 + 1 + 1,
	PKEYSTR_MAX     = GUIDSTRING_MAX + 1 + PKEY_PIDSTR_MAX,
}

export extern(Windows){
	HRESULT PSStringFromPropertyKey(REFPROPERTYKEY pkey, LPWSTR psz, UINT cch);
	HRESULT PSPropertyKeyFromString(LPCWSTR pszString, PROPERTYKEY* pkey);
	HRESULT PSCreateMemoryPropertyStore(REFIID riid, void** ppv);
	HRESULT PSCreateDelayedMultiplexPropertyStore(GETPROPERTYSTOREFLAGS flags, IDelayedPropertyStoreFactory pdpsf, const(DWORD)* rgStoreIds, DWORD cStores, REFIID riid, void** ppv);
	HRESULT PSCreateMultiplexPropertyStore(IUnknown* prgpunkStores, DWORD cStores, REFIID riid, void** ppv);
	HRESULT PSCreatePropertyChangeArray(const(PROPERTYKEY)* rgpropkey, const(PKA_FLAGS)* rgflags, const(PROPVARIANT)* rgpropvar, UINT cChanges, REFIID riid, void** ppv);
	HRESULT PSCreateSimplePropertyChange(PKA_FLAGS flags, REFPROPERTYKEY key, REFPROPVARIANT propvar, REFIID riid, void** ppv);
	HRESULT PSGetPropertyDescription(REFPROPERTYKEY propkey, REFIID riid, void** ppv);
	HRESULT PSGetPropertyDescriptionByName(LPCWSTR pszCanonicalName, REFIID riid, void** ppv);
	HRESULT PSLookupPropertyHandlerCLSID(PCWSTR pszFilePath, CLSID* pclsid);
	HRESULT PSGetItemPropertyHandler(IUnknown punkItem, BOOL fReadWrite, REFIID riid, void** ppv);
	HRESULT PSGetItemPropertyHandlerWithCreateObject(IUnknown punkItem, BOOL fReadWrite, IUnknown punkCreateObject, REFIID riid, void** ppv);
	HRESULT PSGetPropertyValue(IPropertyStore pps, IPropertyDescription ppd, PROPVARIANT* ppropvar);
	HRESULT PSSetPropertyValue(IPropertyStore pps, IPropertyDescription ppd, REFPROPVARIANT propvar);
	HRESULT PSRegisterPropertySchema(PCWSTR pszPath);
	HRESULT PSUnregisterPropertySchema(PCWSTR pszPath);
	HRESULT PSRefreshPropertySchema();
	HRESULT PSEnumeratePropertyDescriptions(PROPDESC_ENUMFILTER filterOn, REFIID riid, void** ppv);
	HRESULT PSGetPropertyKeyFromName(PCWSTR pszName, PROPERTYKEY* ppropkey);
	HRESULT PSGetNameFromPropertyKey(REFPROPERTYKEY propkey, PWSTR* ppszCanonicalName);
	HRESULT PSCoerceToCanonicalValue(REFPROPERTYKEY key, PROPVARIANT* ppropvar);
	HRESULT PSGetPropertyDescriptionListFromString(LPCWSTR pszPropList, REFIID riid, void** ppv);
	HRESULT PSCreatePropertyStoreFromPropertySetStorage(IPropertySetStorage ppss, DWORD grfMode, REFIID riid, void** ppv);
	HRESULT PSCreatePropertyStoreFromObject(IUnknown punk, DWORD grfMode, REFIID riid, void** ppv);
	HRESULT PSCreateAdapterFromPropertyStore(IPropertyStore pps, REFIID riid, void** ppv);
	HRESULT PSGetPropertySystem(REFIID riid, void** ppv);
	HRESULT PSGetPropertyFromPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, DWORD cb, REFPROPERTYKEY rpkey, PROPVARIANT* ppropvar);
	HRESULT PSGetNamedPropertyFromPropertyStorage(PCUSERIALIZEDPROPSTORAGE psps, DWORD cb, LPCWSTR pszName, PROPVARIANT* ppropvar);
	HRESULT PSPropertyBag_ReadType(IPropertyBag propBag, LPCWSTR propName, VARIANT* var, VARTYPE type);
	HRESULT PSPropertyBag_ReadStr(IPropertyBag propBag, LPCWSTR propName, LPWSTR value, int characterCount);
	HRESULT PSPropertyBag_ReadStrAlloc(IPropertyBag propBag, LPCWSTR propName, PWSTR* value);
	HRESULT PSPropertyBag_ReadBSTR(IPropertyBag propBag, LPCWSTR propName, BSTR* value);
	HRESULT PSPropertyBag_WriteStr(IPropertyBag propBag, LPCWSTR propName, LPCWSTR value);
	HRESULT PSPropertyBag_WriteBSTR(IPropertyBag propBag, LPCWSTR propName, BSTR value);
	HRESULT PSPropertyBag_ReadInt(IPropertyBag propBag, LPCWSTR propName, INT* value);
	HRESULT PSPropertyBag_WriteInt(IPropertyBag propBag, LPCWSTR propName, INT value);
	HRESULT PSPropertyBag_ReadSHORT(IPropertyBag propBag, LPCWSTR propName, SHORT* value);
	HRESULT PSPropertyBag_WriteSHORT(IPropertyBag propBag, LPCWSTR propName, SHORT value);
	HRESULT PSPropertyBag_ReadLONG(IPropertyBag propBag, LPCWSTR propName, LONG* value);
	HRESULT PSPropertyBag_WriteLONG(IPropertyBag propBag, LPCWSTR propName, LONG value);
	HRESULT PSPropertyBag_ReadDWORD(IPropertyBag propBag, LPCWSTR propName, DWORD* value);
	HRESULT PSPropertyBag_WriteDWORD(IPropertyBag propBag, LPCWSTR propName, DWORD value);
	HRESULT PSPropertyBag_ReadBOOL(IPropertyBag propBag, LPCWSTR propName, BOOL* value);
	HRESULT PSPropertyBag_WriteBOOL(IPropertyBag propBag, LPCWSTR propName, BOOL value);
	HRESULT PSPropertyBag_ReadPOINTL(IPropertyBag propBag, LPCWSTR propName, POINTL* value);
	HRESULT PSPropertyBag_WritePOINTL(IPropertyBag propBag, LPCWSTR propName, const(POINTL)* value);
	HRESULT PSPropertyBag_ReadPOINTS(IPropertyBag propBag, LPCWSTR propName, POINTS* value);
	HRESULT PSPropertyBag_WritePOINTS(IPropertyBag propBag, LPCWSTR propName, const(POINTS)* value);
	HRESULT PSPropertyBag_ReadRECTL(IPropertyBag propBag, LPCWSTR propName, RECTL* value);
	HRESULT PSPropertyBag_WriteRECTL(IPropertyBag propBag, LPCWSTR propName, const(RECTL)* value);
	HRESULT PSPropertyBag_ReadStream(IPropertyBag propBag, LPCWSTR propName, IStream* value);
	HRESULT PSPropertyBag_WriteStream(IPropertyBag propBag, LPCWSTR propName, IStream value);
	HRESULT PSPropertyBag_Delete(IPropertyBag propBag, LPCWSTR propName);
	HRESULT PSPropertyBag_ReadULONGLONG(IPropertyBag propBag, LPCWSTR propName, ULONGLONG* value);
	HRESULT PSPropertyBag_WriteULONGLONG(IPropertyBag propBag, LPCWSTR propName, ULONGLONG value);
	HRESULT PSPropertyBag_ReadUnknown(IPropertyBag propBag, LPCWSTR propName, REFIID riid, void** ppv);
	HRESULT PSPropertyBag_WriteUnknown(IPropertyBag propBag, LPCWSTR propName, IUnknown punk);
	HRESULT PSPropertyBag_ReadGUID(IPropertyBag propBag, LPCWSTR propName, GUID* value);
	HRESULT PSPropertyBag_WriteGUID(IPropertyBag propBag, LPCWSTR propName, const(GUID)* value);
	HRESULT PSPropertyBag_ReadPropertyKey(IPropertyBag propBag, LPCWSTR propName, PROPERTYKEY* value);
	HRESULT PSPropertyBag_WritePropertyKey(IPropertyBag propBag, LPCWSTR propName, REFPROPERTYKEY value);
}

extern extern(C) const IID LIBID_PropSysObjects;
//extern extern(C) const CLSID CLSID_InMemoryPropertyStore;
mixin DEFINE_GUID!("CLSID_InMemoryPropertyStore", "9a02e012-6303-4e1e-b9a1-630f802592c5");
extern extern(C) const CLSID CLSID_PropertySystem;
mixin DEFINE_GUID!("CLSID_PropertySystem", "b8967f85-58ae-4f46-9fb2-5d7904798f4b");

export extern(Windows){
	uint BSTR_UserSize(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal(uint*, ubyte*, BSTR*);
	void BSTR_UserFree(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree(uint*, LPSAFEARRAY*);

	uint BSTR_UserSize64(uint*, uint, BSTR*);
	ubyte* BSTR_UserMarshal64(uint*, ubyte*, BSTR*);
	ubyte* BSTR_UserUnmarshal64(uint*, ubyte*, BSTR*);
	void BSTR_UserFree64(uint*, BSTR*);

	uint LPSAFEARRAY_UserSize64(uint*, uint, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserMarshal64(uint*, ubyte*, LPSAFEARRAY*);
	ubyte* LPSAFEARRAY_UserUnmarshal64(uint*, ubyte*, LPSAFEARRAY*);
	void LPSAFEARRAY_UserFree64(uint*, LPSAFEARRAY*);
}

export extern(Windows){
	HRESULT IInitializeWithStream_Initialize_Stub(IInitializeWithStream This, IStream pstream, DWORD grfMode);
	HRESULT IPropertyDescription_CoerceToCanonicalValue_Proxy(IPropertyDescription This, PROPVARIANT* ppropvar);
	HRESULT IPropertyDescription_CoerceToCanonicalValue_Stub(IPropertyDescription This, REFPROPVARIANT propvar, PROPVARIANT* ppropvar);
}

} // extern(C)
