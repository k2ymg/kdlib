/** ncrypt.d

Converted from 'ncrypt.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.ncrypt;


import c.windows.windef;
import c.windows.bcrypt;
//import c.windows.wincrypt;


extern(C){

alias LONG SECURITY_STATUS;

const wchar* MS_KEY_STORAGE_PROVIDER = "Microsoft Software Key Storage Provider";
const wchar* MS_SMART_CARD_KEY_STORAGE_PROVIDER = "Microsoft Smart Card Key Storage Provider";

alias BCRYPT_RSA_ALGORITHM NCRYPT_RSA_ALGORITHM;
alias BCRYPT_RSA_SIGN_ALGORITHM NCRYPT_RSA_SIGN_ALGORITHM;
alias BCRYPT_DH_ALGORITHM NCRYPT_DH_ALGORITHM;
alias BCRYPT_DSA_ALGORITHM NCRYPT_DSA_ALGORITHM;
alias BCRYPT_MD2_ALGORITHM NCRYPT_MD2_ALGORITHM;
alias BCRYPT_MD4_ALGORITHM NCRYPT_MD4_ALGORITHM;
alias BCRYPT_MD5_ALGORITHM NCRYPT_MD5_ALGORITHM;
alias BCRYPT_SHA1_ALGORITHM NCRYPT_SHA1_ALGORITHM;
alias BCRYPT_SHA256_ALGORITHM NCRYPT_SHA256_ALGORITHM;
alias BCRYPT_SHA384_ALGORITHM NCRYPT_SHA384_ALGORITHM;
alias BCRYPT_SHA512_ALGORITHM NCRYPT_SHA512_ALGORITHM;
alias BCRYPT_ECDSA_P256_ALGORITHM NCRYPT_ECDSA_P256_ALGORITHM;
alias BCRYPT_ECDSA_P384_ALGORITHM NCRYPT_ECDSA_P384_ALGORITHM;
alias BCRYPT_ECDSA_P521_ALGORITHM NCRYPT_ECDSA_P521_ALGORITHM;
alias BCRYPT_ECDH_P256_ALGORITHM NCRYPT_ECDH_P256_ALGORITHM;
alias BCRYPT_ECDH_P384_ALGORITHM NCRYPT_ECDH_P384_ALGORITHM;
alias BCRYPT_ECDH_P521_ALGORITHM NCRYPT_ECDH_P521_ALGORITHM;

const wchar* NCRYPT_KEY_STORAGE_ALGORITHM = "KEY_STORAGE";

alias BCRYPT_HASH_INTERFACE NCRYPT_HASH_INTERFACE;
alias BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE NCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE;
alias BCRYPT_SECRET_AGREEMENT_INTERFACE NCRYPT_SECRET_AGREEMENT_INTERFACE;
alias BCRYPT_SIGNATURE_INTERFACE NCRYPT_SIGNATURE_INTERFACE;

enum {
	NCRYPT_KEY_STORAGE_INTERFACE        = 0x00010001,
	NCRYPT_SCHANNEL_INTERFACE           = 0x00010002,
	NCRYPT_SCHANNEL_SIGNATURE_INTERFACE = 0x00010003,
}

alias NCRYPT_RSA_ALGORITHM NCRYPT_RSA_ALGORITHM_GROUP;
alias NCRYPT_DH_ALGORITHM NCRYPT_DH_ALGORITHM_GROUP;
alias NCRYPT_DSA_ALGORITHM NCRYPT_DSA_ALGORITHM_GROUP;
const wchar* NCRYPT_ECDSA_ALGORITHM_GROUP = "ECDSA";
const wchar* NCRYPT_ECDH_ALGORITHM_GROUP = "ECDH";


enum {
	NCRYPTBUFFER_VERSION             = 0,
	NCRYPTBUFFER_EMPTY               = 0,
	NCRYPTBUFFER_DATA                = 1,
	NCRYPTBUFFER_SSL_CLIENT_RANDOM   = 20,
	NCRYPTBUFFER_SSL_SERVER_RANDOM   = 21,
	NCRYPTBUFFER_SSL_HIGHEST_VERSION = 22,
	NCRYPTBUFFER_SSL_CLEAR_KEY       = 23,
	NCRYPTBUFFER_SSL_KEY_ARG_DATA    = 24,
	NCRYPTBUFFER_PKCS_OID            = 40,
	NCRYPTBUFFER_PKCS_ALG_OID        = 41,
	NCRYPTBUFFER_PKCS_ALG_PARAM      = 42,
	NCRYPTBUFFER_PKCS_ALG_ID         = 43,
	NCRYPTBUFFER_PKCS_ATTRS          = 44,
	NCRYPTBUFFER_PKCS_KEY_NAME       = 45,
	NCRYPTBUFFER_PKCS_SECRET         = 46,
	NCRYPTBUFFER_CERT_BLOB           = 47,
}

enum NCryptBuffer : BCryptBuffer {init = (BCryptBuffer).init}
alias NCryptBuffer* PNCryptBuffer;
enum NCryptBufferDesc : BCryptBufferDesc {init = (BCryptBufferDesc).init}
alias NCryptBufferDesc* PNCryptBufferDesc;

enum NCRYPT_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}
enum NCRYPT_PROV_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}
enum NCRYPT_KEY_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}
enum NCRYPT_HASH_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}
enum NCRYPT_SECRET_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}

alias BCRYPT_PAD_NONE NCRYPT_NO_PADDING_FLAG;
alias BCRYPT_PAD_PKCS1 NCRYPT_PAD_PKCS1_FLAG;
alias BCRYPT_PAD_OAEP NCRYPT_PAD_OAEP_FLAG;
alias BCRYPT_PAD_PSS NCRYPT_PAD_PSS_FLAG;
alias BCRYPT_NO_KEY_VALIDATION NCRYPT_NO_KEY_VALIDATION;
enum {
	NCRYPT_MACHINE_KEY_FLAG               = 0x00000020,
	NCRYPT_SILENT_FLAG                    = 0x00000040,
	NCRYPT_OVERWRITE_KEY_FLAG             = 0x00000080,
	NCRYPT_WRITE_KEY_TO_LEGACY_STORE_FLAG = 0x00000200,
	NCRYPT_DO_NOT_FINALIZE_FLAG           = 0x00000400,
	NCRYPT_PERSIST_ONLY_FLAG              = 0x40000000,
	NCRYPT_PERSIST_FLAG                   = 0x80000000,
	NCRYPT_REGISTER_NOTIFY_FLAG           = 0x00000001,
	NCRYPT_UNREGISTER_NOTIFY_FLAG         = 0x00000002,
}

export extern(Windows) SECURITY_STATUS NCryptOpenStorageProvider(NCRYPT_PROV_HANDLE* phProvider, LPCWSTR pszProviderName, DWORD dwFlags);

alias BCRYPT_CIPHER_OPERATION NCRYPT_CIPHER_OPERATION;
alias BCRYPT_HASH_OPERATION NCRYPT_HASH_OPERATION;
alias BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION NCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION;
alias BCRYPT_SECRET_AGREEMENT_OPERATION NCRYPT_SECRET_AGREEMENT_OPERATION;
alias BCRYPT_SIGNATURE_OPERATION NCRYPT_SIGNATURE_OPERATION;
alias BCRYPT_RNG_OPERATION NCRYPT_RNG_OPERATION;

struct NCryptAlgorithmName {
	LPWSTR pszName;
	DWORD dwClass;
	DWORD dwAlgOperations;
	DWORD dwFlags;
}

export extern(Windows) SECURITY_STATUS NCryptEnumAlgorithms(NCRYPT_PROV_HANDLE hProvider, DWORD dwAlgOperations, DWORD* pdwAlgCount, NCryptAlgorithmName** ppAlgList, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptIsAlgSupported(NCRYPT_PROV_HANDLE hProvider, LPCWSTR pszAlgId, DWORD dwFlags);

struct NCryptKeyName {
	LPWSTR pszName;
	LPWSTR pszAlgid;
	DWORD dwLegacyKeySpec;
	DWORD dwFlags;
}

export extern(Windows) SECURITY_STATUS NCryptEnumKeys(NCRYPT_PROV_HANDLE hProvider, LPCWSTR pszScope, NCryptKeyName** ppKeyName, PVOID* ppEnumState, DWORD dwFlags);

struct NCryptProviderName {
	LPWSTR pszName;
	LPWSTR pszComment;
}

export extern(Windows) SECURITY_STATUS NCryptEnumStorageProviders(DWORD* pdwProviderCount, NCryptProviderName** ppProviderList, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptFreeBuffer(PVOID pvInput);
export extern(Windows) SECURITY_STATUS NCryptOpenKey(NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE* phKey, LPCWSTR pszKeyName, DWORD dwLegacyKeySpec, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptCreatePersistedKey(NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE* phKey, LPCWSTR pszAlgId, LPCWSTR pszKeyName, DWORD dwLegacyKeySpec, DWORD dwFlags);

const wchar* NCRYPT_NAME_PROPERTY = "Name";
const wchar* NCRYPT_UNIQUE_NAME_PROPERTY = "Unique Name";
const wchar* NCRYPT_ALGORITHM_PROPERTY = "Algorithm Name";
const wchar* NCRYPT_LENGTH_PROPERTY = "Length";
const wchar* NCRYPT_LENGTHS_PROPERTY = "Lengths";
const wchar* NCRYPT_BLOCK_LENGTH_PROPERTY = "Block Length";
const wchar* NCRYPT_UI_POLICY_PROPERTY = "UI Policy";
const wchar* NCRYPT_EXPORT_POLICY_PROPERTY = "Export Policy";
const wchar* NCRYPT_WINDOW_HANDLE_PROPERTY = "HWND Handle";
const wchar* NCRYPT_USE_CONTEXT_PROPERTY = "Use Context";
const wchar* NCRYPT_IMPL_TYPE_PROPERTY = "Impl Type";
const wchar* NCRYPT_KEY_USAGE_PROPERTY = "Key Usage";
const wchar* NCRYPT_KEY_TYPE_PROPERTY = "Key Type";
const wchar* NCRYPT_VERSION_PROPERTY = "Version";
const wchar* NCRYPT_SECURITY_DESCR_SUPPORT_PROPERTY = "Security Descr Support";
const wchar* NCRYPT_SECURITY_DESCR_PROPERTY = "Security Descr";
const wchar* NCRYPT_USE_COUNT_ENABLED_PROPERTY = "Enabled Use Count";
const wchar* NCRYPT_USE_COUNT_PROPERTY = "Use Count";
const wchar* NCRYPT_LAST_MODIFIED_PROPERTY = "Modified";
const wchar* NCRYPT_MAX_NAME_LENGTH_PROPERTY = "Max Name Length";
const wchar* NCRYPT_ALGORITHM_GROUP_PROPERTY = "Algorithm Group";
alias BCRYPT_DH_PARAMETERS NCRYPT_DH_PARAMETERS_PROPERTY;
const wchar* NCRYPT_PROVIDER_HANDLE_PROPERTY = "Provider Handle";
const wchar* NCRYPT_PIN_PROPERTY = "SmartCardPin";
const wchar* NCRYPT_READER_PROPERTY = "SmartCardReader";
const wchar* NCRYPT_SMARTCARD_GUID_PROPERTY = "SmartCardGuid";
const wchar* NCRYPT_CERTIFICATE_PROPERTY = "SmartCardKeyCertificate";
const wchar* NCRYPT_PIN_PROMPT_PROPERTY = "SmartCardPinPrompt";
const wchar* NCRYPT_USER_CERTSTORE_PROPERTY = "SmartCardUserCertStore";
const wchar* NCRYPT_ROOT_CERTSTORE_PROPERTY = "SmartcardRootCertStore";
const wchar* NCRYPT_SECURE_PIN_PROPERTY = "SmartCardSecurePin";
const wchar* NCRYPT_ASSOCIATED_ECDH_KEY = "SmartCardAssociatedECDHKey";
const wchar* NCRYPT_SCARD_PIN_ID = "SmartCardPinId";
const wchar* NCRYPT_SCARD_PIN_INFO = "SmartCardPinInfo";

enum {
	NCRYPT_MAX_PROPERTY_NAME              = 64,
	NCRYPT_MAX_PROPERTY_DATA              = 0x100000,
	NCRYPT_ALLOW_EXPORT_FLAG              = 0x00000001,
	NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG    = 0x00000002,
	NCRYPT_ALLOW_ARCHIVING_FLAG           = 0x00000004,
	NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG = 0x00000008,
	NCRYPT_IMPL_HARDWARE_FLAG             = 0x00000001,
	NCRYPT_IMPL_SOFTWARE_FLAG             = 0x00000002,
	NCRYPT_IMPL_REMOVABLE_FLAG            = 0x00000008,
	NCRYPT_IMPL_HARDWARE_RNG_FLAG         = 0x00000010,
	NCRYPT_ALLOW_DECRYPT_FLAG             = 0x00000001,
	NCRYPT_ALLOW_SIGNING_FLAG             = 0x00000002,
	NCRYPT_ALLOW_KEY_AGREEMENT_FLAG       = 0x00000004,
	NCRYPT_ALLOW_ALL_USAGES               = 0x00ffffff,
	NCRYPT_UI_PROTECT_KEY_FLAG            = 0x00000001,
	NCRYPT_UI_FORCE_HIGH_PROTECTION_FLAG  = 0x00000002,
}

struct NCRYPT_UI_POLICY_BLOB {
	DWORD dwVersion;
	DWORD dwFlags;
	DWORD cbCreationTitle;
	DWORD cbFriendlyName;
	DWORD cbDescription;
}

struct NCRYPT_UI_POLICY {
	DWORD dwVersion;
	DWORD dwFlags;
	LPCWSTR pszCreationTitle;
	LPCWSTR pszFriendlyName;
	LPCWSTR pszDescription;
}

struct NCRYPT_SUPPORTED_LENGTHS {
	DWORD dwMinLength;
	DWORD dwMaxLength;
	DWORD dwIncrement;
	DWORD dwDefaultLength;
}

export extern(Windows) SECURITY_STATUS NCryptGetProperty(NCRYPT_HANDLE hObject, LPCWSTR pszProperty, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptSetProperty(NCRYPT_HANDLE hObject, LPCWSTR pszProperty, PBYTE pbInput, DWORD cbInput, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptFinalizeKey(NCRYPT_KEY_HANDLE hKey, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptEncrypt(NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, VOID* pPaddingInfo, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptDecrypt(NCRYPT_KEY_HANDLE hKey, PBYTE pbInput, DWORD cbInput, VOID* pPaddingInfo, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);

const wchar* NCRYPT_PKCS7_ENVELOPE_BLOB = "PKCS7_ENVELOPE";
const wchar* NCRYPT_PKCS8_PRIVATE_KEY_BLOB = "PKCS8_PRIVATEKEY";
const wchar* NCRYPT_OPAQUETRANSPORT_BLOB = "OpaqueTransport";

enum {
	NCRYPT_EXPORT_LEGACY_FLAG   = 0x00000800,
}

export extern(Windows) SECURITY_STATUS NCryptImportKey(NCRYPT_PROV_HANDLE hProvider, NCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, NCryptBufferDesc* pParameterList, NCRYPT_KEY_HANDLE* phKey, PBYTE pbData, DWORD cbData, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptExportKey(NCRYPT_KEY_HANDLE hKey, NCRYPT_KEY_HANDLE hExportKey, LPCWSTR pszBlobType, NCryptBufferDesc* pParameterList, PBYTE pbOutput, DWORD cbOutput, DWORD* pcbResult, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptSignHash(NCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD* pcbResult, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptVerifySignature(NCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PBYTE pbHashValue, DWORD cbHashValue, PBYTE pbSignature, DWORD cbSignature, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptDeleteKey(NCRYPT_KEY_HANDLE hKey, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptFreeObject(NCRYPT_HANDLE hObject);
export extern(Windows) BOOL NCryptIsKeyHandle(NCRYPT_KEY_HANDLE hKey);
export extern(Windows) SECURITY_STATUS NCryptTranslateHandle(NCRYPT_PROV_HANDLE* phProvider, NCRYPT_KEY_HANDLE* phKey, HCRYPTPROV hLegacyProv, HCRYPTKEY hLegacyKey, DWORD dwLegacyKeySpec, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptNotifyChangeKey(NCRYPT_PROV_HANDLE hProvider, HANDLE* phEvent, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptSecretAgreement(NCRYPT_KEY_HANDLE hPrivKey, NCRYPT_KEY_HANDLE hPubKey, NCRYPT_SECRET_HANDLE* phAgreedSecret, DWORD dwFlags);
export extern(Windows) SECURITY_STATUS NCryptDeriveKey(NCRYPT_SECRET_HANDLE hSharedSecret, LPCWSTR pwszKDF, NCryptBufferDesc* pParameterList, PBYTE pbDerivedKey, DWORD cbDerivedKey, DWORD* pcbResult, ULONG dwFlags);

//	NCRYPT_KEY_STORAGE_INTERFACE_VERSION BCRYPT_MAKE_INTERFACE_VERSION(1,0)

}// extern(C)
