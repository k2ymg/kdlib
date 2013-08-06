/** bcrypt.d

Converted from 'bcrypt.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.bcrypt;


import c.windows.windef;
import c.windows.winternl; // NTSTATUS


extern(C){

//BCRYPT_SUCCESS(Status) (((NTSTATUS)(Status)) >= 0)
//BCRYPT_OBJECT_ALIGNMENT 16
//BCRYPT_STRUCT_ALIGNMENT

const wchar* BCRYPT_KDF_HASH = "HASH";
const wchar* BCRYPT_KDF_HMAC = "HMAC";
const wchar* BCRYPT_KDF_TLS_PRF = "TLS_PRF";
const wchar* BCRYPT_KDF_SP80056A_CONCAT = "SP800_56A_CONCAT";

enum {
	 KDF_HASH_ALGORITHM              = 0x0,
	 KDF_SECRET_PREPEND              = 0x1,
	 KDF_SECRET_APPEND               = 0x2,
	 KDF_HMAC_KEY                    = 0x3,
	 KDF_TLS_PRF_LABEL               = 0x4,
	 KDF_TLS_PRF_SEED                = 0x5,
	 KDF_SECRET_HANDLE               = 0x6,
	 KDF_TLS_PRF_PROTOCOL            = 0x7,
	 KDF_ALGORITHMID                 = 0x8,
	 KDF_PARTYUINFO                  = 0x9,
	 KDF_PARTYVINFO                  = 0xA,
	 KDF_SUPPPUBINFO                 = 0xB,
	 KDF_SUPPPRIVINFO                = 0xC,
	 KDF_USE_SECRET_AS_HMAC_KEY_FLAG = 0x1,
}

struct BCRYPT_KEY_LENGTHS_STRUCT {
	ULONG dwMinLength;
	ULONG dwMaxLength;
	ULONG dwIncrement;
}
alias BCRYPT_KEY_LENGTHS_STRUCT BCRYPT_AUTH_TAG_LENGTHS_STRUCT;

struct BCRYPT_OID {
	ULONG cbOID;
	PUCHAR pbOID;
}

struct BCRYPT_OID_LIST {
	ULONG dwOIDCount;
	BCRYPT_OID* pOIDs;
}

struct BCRYPT_PKCS1_PADDING_INFO {
	LPCWSTR pszAlgId;
}

struct BCRYPT_PSS_PADDING_INFO {
	LPCWSTR pszAlgId;
	ULONG cbSalt;
}

struct BCRYPT_OAEP_PADDING_INFO {
	LPCWSTR pszAlgId;
	PUCHAR pbLabel;
	ULONG cbLabel;
}

enum BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION = 1;
enum {
	BCRYPT_AUTH_MODE_CHAIN_CALLS_FLAG = 0x00000001,
	BCRYPT_AUTH_MODE_IN_PROGRESS_FLAG = 0x00000002,
}

struct BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO {
	ULONG cbSize;
	ULONG dwInfoVersion;
	PUCHAR pbNonce;
	ULONG cbNonce;
	PUCHAR pbAuthData;
	ULONG cbAuthData;
	PUCHAR pbTag;
	ULONG cbTag;
	PUCHAR pbMacContext;
	ULONG cbMacContext;
	ULONG cbAAD;
	ULONGLONG cbData;
	ULONG dwFlags;
}
alias BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO* PBCRYPT_AUTHENTICATED_CIPHER_MODE_INFO;

/*void BCRYPT_INIT_AUTH_MODE_INFO(BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO _AUTH_INFO_STRUCT_)
{
	RtlZeroMemory(&_AUTH_INFO_STRUCT_, BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO.sizeof);
	_AUTH_INFO_STRUCT_.cbSize = BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO.sizeof;
	_AUTH_INFO_STRUCT_.dwInfoVersion = BCRYPT_AUTHENTICATED_CIPHER_MODE_INFO_VERSION;
}*/

const wchar* BCRYPT_OPAQUE_KEY_BLOB = "OpaqueKeyBlob";
const wchar* BCRYPT_KEY_DATA_BLOB = "KeyDataBlob";
const wchar* BCRYPT_AES_WRAP_KEY_BLOB = "Rfc3565KeyWrapBlob";
const wchar* BCRYPT_OBJECT_LENGTH = "ObjectLength";
const wchar* BCRYPT_ALGORITHM_NAME = "AlgorithmName";
const wchar* BCRYPT_PROVIDER_HANDLE = "ProviderHandle";
const wchar* BCRYPT_CHAINING_MODE = "ChainingMode";
const wchar* BCRYPT_BLOCK_LENGTH = "BlockLength";
const wchar* BCRYPT_KEY_LENGTH = "KeyLength";
const wchar* BCRYPT_KEY_OBJECT_LENGTH = "KeyObjectLength";
const wchar* BCRYPT_KEY_STRENGTH = "KeyStrength";
const wchar* BCRYPT_KEY_LENGTHS = "KeyLengths";
const wchar* BCRYPT_BLOCK_SIZE_LIST = "BlockSizeList";
const wchar* BCRYPT_EFFECTIVE_KEY_LENGTH = "EffectiveKeyLength";
const wchar* BCRYPT_HASH_LENGTH = "HashDigestLength";
const wchar* BCRYPT_HASH_OID_LIST = "HashOIDList";
const wchar* BCRYPT_PADDING_SCHEMES = "PaddingSchemes";
const wchar* BCRYPT_SIGNATURE_LENGTH = "SignatureLength";
const wchar* BCRYPT_HASH_BLOCK_LENGTH = "HashBlockLength";
const wchar* BCRYPT_AUTH_TAG_LENGTH = "AuthTagLength";
const wchar* BCRYPT_PRIMITIVE_TYPE = "PrimitiveType";
const wchar* BCRYPT_IS_KEYED_HASH = "IsKeyedHash";
const wchar* BCRYPT_INITIALIZATION_VECTOR = "IV";
const wchar* BCRYPT_CHAIN_MODE_NA = "ChainingModeN/A";
const wchar* BCRYPT_CHAIN_MODE_CBC = "ChainingModeCBC";
const wchar* BCRYPT_CHAIN_MODE_ECB = "ChainingModeECB";
const wchar* BCRYPT_CHAIN_MODE_CFB = "ChainingModeCFB";
const wchar* BCRYPT_CHAIN_MODE_CCM = "ChainingModeCCM";
const wchar* BCRYPT_CHAIN_MODE_GCM = "ChainingModeGCM";

enum {
	 BCRYPT_SUPPORTED_PAD_ROUTER    = 0x00000001,
	 BCRYPT_SUPPORTED_PAD_PKCS1_ENC = 0x00000002,
	 BCRYPT_SUPPORTED_PAD_PKCS1_SIG = 0x00000004,
	 BCRYPT_SUPPORTED_PAD_OAEP      = 0x00000008,
	 BCRYPT_SUPPORTED_PAD_PSS       = 0x00000010,
	 BCRYPT_PROV_DISPATCH           = 0x00000001,
	 BCRYPT_BLOCK_PADDING           = 0x00000001,
	 BCRYPT_PAD_NONE                = 0x00000001,
	 BCRYPT_PAD_PKCS1               = 0x00000002,
	 BCRYPT_PAD_OAEP                = 0x00000004,
	 BCRYPT_PAD_PSS                 = 0x00000008,
}

enum BCRYPTBUFFER_VERSION = 0;

struct BCryptBuffer {
	ULONG cbBuffer;
	ULONG BufferType;
	PVOID pvBuffer;
}
alias BCryptBuffer* PBCryptBuffer;

struct BCryptBufferDesc {
	ULONG ulVersion;
	ULONG cBuffers;
	PBCryptBuffer pBuffers;
}
alias BCryptBufferDesc* PBCryptBufferDesc;

enum BCRYPT_HANDLE : PVOID {init = (PVOID).init}
enum BCRYPT_ALG_HANDLE : PVOID {init = (PVOID).init}
enum BCRYPT_KEY_HANDLE : PVOID {init = (PVOID).init}
enum BCRYPT_HASH_HANDLE : PVOID {init = (PVOID).init}
enum BCRYPT_SECRET_HANDLE : PVOID {init = (PVOID).init}

const wchar* BCRYPT_PUBLIC_KEY_BLOB = "PUBLICBLOB";
const wchar* BCRYPT_PRIVATE_KEY_BLOB = "PRIVATEBLOB";

struct BCRYPT_KEY_BLOB {
	ULONG Magic;
}

const wchar* BCRYPT_RSAPUBLIC_BLOB = "RSAPUBLICBLOB";
const wchar* BCRYPT_RSAPRIVATE_BLOB = "RSAPRIVATEBLOB";
const wchar* LEGACY_RSAPUBLIC_BLOB = "CAPIPUBLICBLOB";
const wchar* LEGACY_RSAPRIVATE_BLOB = "CAPIPRIVATEBLOB";

enum {
	 BCRYPT_RSAPUBLIC_MAGIC  = 0x31415352,
	 BCRYPT_RSAPRIVATE_MAGIC = 0x32415352,
}

struct BCRYPT_RSAKEY_BLOB {
	ULONG Magic;
	ULONG BitLength;
	ULONG cbPublicExp;
	ULONG cbModulus;
	ULONG cbPrime1;
	ULONG cbPrime2;
}

const wchar* BCRYPT_RSAFULLPRIVATE_BLOB = "RSAFULLPRIVATEBLOB";

enum BCRYPT_RSAFULLPRIVATE_MAGIC = 0x33415352;

const wchar* BCRYPT_ECCPUBLIC_BLOB = "ECCPUBLICBLOB";
const wchar* BCRYPT_ECCPRIVATE_BLOB = "ECCPRIVATEBLOB";

enum {
	 BCRYPT_ECDH_PUBLIC_P256_MAGIC  = 0x314B4345,
	 BCRYPT_ECDH_PRIVATE_P256_MAGIC = 0x324B4345,
	 BCRYPT_ECDH_PUBLIC_P384_MAGIC  = 0x334B4345,
	 BCRYPT_ECDH_PRIVATE_P384_MAGIC = 0x344B4345,
	 BCRYPT_ECDH_PUBLIC_P521_MAGIC  = 0x354B4345,
	 BCRYPT_ECDH_PRIVATE_P521_MAGIC = 0x364B4345,
}
enum {
	 BCRYPT_ECDSA_PUBLIC_P256_MAGIC  = 0x31534345,
	 BCRYPT_ECDSA_PRIVATE_P256_MAGIC = 0x32534345,
	 BCRYPT_ECDSA_PUBLIC_P384_MAGIC  = 0x33534345,
	 BCRYPT_ECDSA_PRIVATE_P384_MAGIC = 0x34534345,
	 BCRYPT_ECDSA_PUBLIC_P521_MAGIC  = 0x35534345,
	 BCRYPT_ECDSA_PRIVATE_P521_MAGIC = 0x36534345,
}

struct BCRYPT_ECCKEY_BLOB {
	ULONG dwMagic;
	ULONG cbKey;
}
alias BCRYPT_ECCKEY_BLOB* PBCRYPT_ECCKEY_BLOB;

const wchar* BCRYPT_DH_PUBLIC_BLOB = "DHPUBLICBLOB";
const wchar* BCRYPT_DH_PRIVATE_BLOB = "DHPRIVATEBLOB";
const wchar* LEGACY_DH_PUBLIC_BLOB = "CAPIDHPUBLICBLOB";
const wchar* LEGACY_DH_PRIVATE_BLOB = "CAPIDHPRIVATEBLOB";

enum {
	 BCRYPT_DH_PUBLIC_MAGIC  = 0x42504844,
	 BCRYPT_DH_PRIVATE_MAGIC = 0x56504844,
}

struct BCRYPT_DH_KEY_BLOB {
	ULONG dwMagic;
	ULONG cbKey;
}
alias BCRYPT_DH_KEY_BLOB* PBCRYPT_DH_KEY_BLOB;

const wchar* BCRYPT_DH_PARAMETERS = "DHParameters";
enum BCRYPT_DH_PARAMETERS_MAGIC = 0x4d504844;

struct BCRYPT_DH_PARAMETER_HEADER {
	ULONG cbLength;
	ULONG dwMagic;
	ULONG cbKeyLength;
}

const wchar* BCRYPT_DSA_PUBLIC_BLOB = "DSAPUBLICBLOB";
const wchar* BCRYPT_DSA_PRIVATE_BLOB = "DSAPRIVATEBLOB";
const wchar* LEGACY_DSA_PUBLIC_BLOB = "CAPIDSAPUBLICBLOB";
const wchar* LEGACY_DSA_PRIVATE_BLOB = "CAPIDSAPRIVATEBLOB";
const wchar* LEGACY_DSA_V2_PUBLIC_BLOB = "V2CAPIDSAPUBLICBLOB";
const wchar* LEGACY_DSA_V2_PRIVATE_BLOB = "V2CAPIDSAPRIVATEBLOB";

enum {
	 BCRYPT_DSA_PUBLIC_MAGIC  = 0x42505344,
	 BCRYPT_DSA_PRIVATE_MAGIC = 0x56505344,
}

struct BCRYPT_DSA_KEY_BLOB {
	ULONG dwMagic;
	ULONG cbKey;
	UCHAR[4] Count;
	UCHAR[20] Seed;
	UCHAR[20] q;
}
alias BCRYPT_DSA_KEY_BLOB* PBCRYPT_DSA_KEY_BLOB;

struct BCRYPT_KEY_DATA_BLOB_HEADER {
	ULONG dwMagic;
	ULONG dwVersion;
	ULONG cbKeyData;
}
alias BCRYPT_KEY_DATA_BLOB_HEADER* PBCRYPT_KEY_DATA_BLOB_HEADER;

enum BCRYPT_KEY_DATA_BLOB_MAGIC = 0x4d42444b;
enum BCRYPT_KEY_DATA_BLOB_VERSION1 = 0x1;

const wchar* BCRYPT_DSA_PARAMETERS = "DSAParameters";
enum BCRYPT_DSA_PARAMETERS_MAGIC = 0x4d505344;

struct BCRYPT_DSA_PARAMETER_HEADER {
	ULONG cbLength;
	ULONG dwMagic;
	ULONG cbKeyLength;
	UCHAR[4] Count;
	UCHAR[20] Seed;
	UCHAR[20] q;
}

const wchar* MS_PRIMITIVE_PROVIDER = "Microsoft Primitive Provider";

const wchar* BCRYPT_RSA_ALGORITHM = "RSA";
const wchar* BCRYPT_RSA_SIGN_ALGORITHM = "RSA_SIGN";
const wchar* BCRYPT_DH_ALGORITHM = "DH";
const wchar* BCRYPT_DSA_ALGORITHM = "DSA";
const wchar* BCRYPT_RC2_ALGORITHM = "RC2";
const wchar* BCRYPT_RC4_ALGORITHM = "RC4";
const wchar* BCRYPT_AES_ALGORITHM = "AES";
const wchar* BCRYPT_DES_ALGORITHM = "DES";
const wchar* BCRYPT_DESX_ALGORITHM = "DESX";
const wchar* BCRYPT_3DES_ALGORITHM = "3DES";
const wchar* BCRYPT_3DES_112_ALGORITHM = "3DES_112";
const wchar* BCRYPT_MD2_ALGORITHM = "MD2";
const wchar* BCRYPT_MD4_ALGORITHM = "MD4";
const wchar* BCRYPT_MD5_ALGORITHM = "MD5";
const wchar* BCRYPT_SHA1_ALGORITHM = "SHA1";
const wchar* BCRYPT_SHA256_ALGORITHM = "SHA256";
const wchar* BCRYPT_SHA384_ALGORITHM = "SHA384";
const wchar* BCRYPT_SHA512_ALGORITHM = "SHA512";
const wchar* BCRYPT_AES_GMAC_ALGORITHM = "AES-GMAC";
const wchar* BCRYPT_ECDSA_P256_ALGORITHM = "ECDSA_P256";
const wchar* BCRYPT_ECDSA_P384_ALGORITHM = "ECDSA_P384";
const wchar* BCRYPT_ECDSA_P521_ALGORITHM = "ECDSA_P521";
const wchar* BCRYPT_ECDH_P256_ALGORITHM = "ECDH_P256";
const wchar* BCRYPT_ECDH_P384_ALGORITHM = "ECDH_P384";
const wchar* BCRYPT_ECDH_P521_ALGORITHM = "ECDH_P521";
const wchar* BCRYPT_RNG_ALGORITHM = "RNG";
const wchar* BCRYPT_RNG_FIPS186_DSA_ALGORITHM = "FIPS186DSARNG";
const wchar* BCRYPT_RNG_DUAL_EC_ALGORITHM = "DUALECRNG";

enum {
	 BCRYPT_CIPHER_INTERFACE                = 0x00000001,
	 BCRYPT_HASH_INTERFACE                  = 0x00000002,
	 BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE = 0x00000003,
	 BCRYPT_SECRET_AGREEMENT_INTERFACE      = 0x00000004,
	 BCRYPT_SIGNATURE_INTERFACE             = 0x00000005,
	 BCRYPT_RNG_INTERFACE                   = 0x00000006,
	 BCRYPT_ALG_HANDLE_HMAC_FLAG            = 0x00000008,
}

export extern(Windows) NTSTATUS BCryptOpenAlgorithmProvider(BCRYPT_ALG_HANDLE* phAlgorithm, LPCWSTR pszAlgId, LPCWSTR pszImplementation, ULONG dwFlags);

enum {
	 BCRYPT_CIPHER_OPERATION                = 0x00000001,
	 BCRYPT_HASH_OPERATION                  = 0x00000002,
	 BCRYPT_ASYMMETRIC_ENCRYPTION_OPERATION = 0x00000004,
	 BCRYPT_SECRET_AGREEMENT_OPERATION      = 0x00000008,
	 BCRYPT_SIGNATURE_OPERATION             = 0x00000010,
	 BCRYPT_RNG_OPERATION                   = 0x00000020,
}

struct BCRYPT_ALGORITHM_IDENTIFIER {
	LPWSTR pszName;
	ULONG dwClass;
	ULONG dwFlags;
}

export extern(Windows) NTSTATUS BCryptEnumAlgorithms(ULONG dwAlgOperations, ULONG* pAlgCount, BCRYPT_ALGORITHM_IDENTIFIER** ppAlgList, ULONG dwFlags);

struct BCRYPT_PROVIDER_NAME {
	LPWSTR pszProviderName;
}

export extern(Windows) NTSTATUS BCryptEnumProviders(LPCWSTR pszAlgId, ULONG* pImplCount, BCRYPT_PROVIDER_NAME** ppImplList, ULONG dwFlags);

enum {
	 BCRYPT_PUBLIC_KEY_FLAG  = 0x00000001,
	 BCRYPT_PRIVATE_KEY_FLAG = 0x00000002,
}

export extern(Windows) NTSTATUS BCryptGetProperty(BCRYPT_HANDLE hObject, LPCWSTR pszProperty, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptSetProperty(BCRYPT_HANDLE hObject, LPCWSTR pszProperty, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptCloseAlgorithmProvider(BCRYPT_ALG_HANDLE hAlgorithm, ULONG dwFlags);
export extern(Windows) VOID BCryptFreeBuffer(PVOID pvBuffer);
export extern(Windows) NTSTATUS BCryptGenerateSymmetricKey(BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbKeyObject, ULONG cbKeyObject, PUCHAR pbSecret, ULONG cbSecret, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptGenerateKeyPair(BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE* phKey, ULONG dwLength, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptEncrypt(BCRYPT_KEY_HANDLE hKey, PUCHAR pbInput, ULONG cbInput, VOID* pPaddingInfo, PUCHAR pbIV, ULONG cbIV, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDecrypt(BCRYPT_KEY_HANDLE hKey, PUCHAR pbInput, ULONG cbInput, VOID* pPaddingInfo, PUCHAR pbIV, ULONG cbIV, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptExportKey(BCRYPT_KEY_HANDLE hKey, BCRYPT_KEY_HANDLE hExportKey, LPCWSTR pszBlobType, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptImportKey(BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbKeyObject, ULONG cbKeyObject, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);

enum BCRYPT_NO_KEY_VALIDATION = 0x00000008;

export extern(Windows) NTSTATUS BCryptImportKeyPair(BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_KEY_HANDLE hImportKey, LPCWSTR pszBlobType, BCRYPT_KEY_HANDLE* phKey, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDuplicateKey(BCRYPT_KEY_HANDLE hKey, BCRYPT_KEY_HANDLE* phNewKey, PUCHAR pbKeyObject, ULONG cbKeyObject, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptFinalizeKeyPair(BCRYPT_KEY_HANDLE hKey, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDestroyKey(BCRYPT_KEY_HANDLE hKey);
export extern(Windows) NTSTATUS BCryptDestroySecret(BCRYPT_SECRET_HANDLE hSecret);
export extern(Windows) NTSTATUS BCryptSignHash(BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PUCHAR pbInput, ULONG cbInput, PUCHAR pbOutput, ULONG cbOutput, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptVerifySignature(BCRYPT_KEY_HANDLE hKey, VOID* pPaddingInfo, PUCHAR pbHash, ULONG cbHash, PUCHAR pbSignature, ULONG cbSignature, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptSecretAgreement(BCRYPT_KEY_HANDLE hPrivKey, BCRYPT_KEY_HANDLE hPubKey, BCRYPT_SECRET_HANDLE* phAgreedSecret, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDeriveKey(BCRYPT_SECRET_HANDLE hSharedSecret, LPCWSTR pwszKDF, BCryptBufferDesc* pParameterList, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG* pcbResult, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptCreateHash(BCRYPT_ALG_HANDLE hAlgorithm, BCRYPT_HASH_HANDLE* phHash, PUCHAR pbHashObject, ULONG cbHashObject, PUCHAR pbSecret, ULONG cbSecret, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptHashData(BCRYPT_HASH_HANDLE hHash, PUCHAR pbInput, ULONG cbInput, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptFinishHash(BCRYPT_HASH_HANDLE hHash, PUCHAR pbOutput, ULONG cbOutput, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDuplicateHash(BCRYPT_HASH_HANDLE hHash, BCRYPT_HASH_HANDLE* phNewHash, PUCHAR pbHashObject, ULONG cbHashObject, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDestroyHash(BCRYPT_HASH_HANDLE hHash);

enum {
	 BCRYPT_RNG_USE_ENTROPY_IN_BUFFER = 0x00000001,
	 BCRYPT_USE_SYSTEM_PREFERRED_RNG  = 0x00000002,
}

export extern(Windows) NTSTATUS BCryptGenRandom(BCRYPT_ALG_HANDLE hAlgorithm, PUCHAR pbBuffer, ULONG cbBuffer, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDeriveKeyCapi(BCRYPT_HASH_HANDLE hHash, BCRYPT_ALG_HANDLE hTargetAlg, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);
export extern(Windows) NTSTATUS BCryptDeriveKeyPBKDF2(BCRYPT_ALG_HANDLE hPrf, PUCHAR pbPassword, ULONG cbPassword, PUCHAR pbSalt, ULONG cbSalt, ULONGLONG cIterations, PUCHAR pbDerivedKey, ULONG cbDerivedKey, ULONG dwFlags);

struct BCRYPT_INTERFACE_VERSION {
	USHORT MajorVersion;
	USHORT MinorVersion;
}
alias BCRYPT_INTERFACE_VERSION* PBCRYPT_INTERFACE_VERSION;

//BCRYPT_MAKE_INTERFACE_VERSION(major,minor) {(USHORT)major, (USHORT)minor}
//BCRYPT_IS_INTERFACE_VERSION_COMPATIBLE(loader, provider)  ((loader).MajorVersion <= (provider).MajorVersion)
const BCRYPT_INTERFACE_VERSION BCRYPT_CIPHER_INTERFACE_VERSION_1 = {1 , 0};
const BCRYPT_INTERFACE_VERSION BCRYPT_HASH_INTERFACE_VERSION_1 = {1, 0};
const BCRYPT_INTERFACE_VERSION BCRYPT_ASYMMETRIC_ENCRYPTION_INTERFACE_VERSION_1 = {1, 0};
const BCRYPT_INTERFACE_VERSION BCRYPT_SECRET_AGREEMENT_INTERFACE_VERSION_1 = {1, 0};
const BCRYPT_INTERFACE_VERSION BCRYPT_SIGNATURE_INTERFACE_VERSION_1 = {1, 0};
const BCRYPT_INTERFACE_VERSION BCRYPT_RNG_INTERFACE_VERSION_1 = {1, 0};

enum {
	 CRYPT_MIN_DEPENDENCIES = 0x00000001,
	 CRYPT_PROCESS_ISOLATE  = 0x00010000,
	 CRYPT_UM               = 0x00000001,
	 CRYPT_KM               = 0x00000002,
	 CRYPT_MM               = 0x00000003,
	 CRYPT_ANY              = 0x00000004,
	 CRYPT_OVERWRITE        = 0x00000001,
	 CRYPT_LOCAL            = 0x00000001,
	 CRYPT_DOMAIN           = 0x00000002,
	 CRYPT_EXCLUSIVE        = 0x00000001,
	 CRYPT_OVERRIDE         = 0x00010000,
	 CRYPT_ALL_FUNCTIONS    = 0x00000001,
	 CRYPT_ALL_PROVIDERS    = 0x00000002,
	 CRYPT_PRIORITY_TOP     = 0x00000000,
	 CRYPT_PRIORITY_BOTTOM  = 0xFFFFFFFF,
}

const wchar* CRYPT_DEFAULT_CONTEXT = "Default";

struct CRYPT_INTERFACE_REG {
	ULONG dwInterface;
	ULONG dwFlags;
	ULONG cFunctions;
	PWSTR* rgpszFunctions;
}
alias CRYPT_INTERFACE_REG* PCRYPT_INTERFACE_REG;

struct CRYPT_IMAGE_REG {
	PWSTR pszImage;
	ULONG cInterfaces;
	PCRYPT_INTERFACE_REG* rgpInterfaces;
}
alias CRYPT_IMAGE_REG* PCRYPT_IMAGE_REG;

struct CRYPT_PROVIDER_REG {
	ULONG cAliases;
	PWSTR* rgpszAliases;
	PCRYPT_IMAGE_REG pUM;
	PCRYPT_IMAGE_REG pKM;
}
alias CRYPT_PROVIDER_REG* PCRYPT_PROVIDER_REG;

struct CRYPT_PROVIDERS {
	ULONG cProviders;
	PWSTR* rgpszProviders;
}
alias CRYPT_PROVIDERS* PCRYPT_PROVIDERS;

struct CRYPT_CONTEXT_CONFIG {
	ULONG dwFlags;
	ULONG dwReserved;
}
alias CRYPT_CONTEXT_CONFIG* PCRYPT_CONTEXT_CONFIG;

struct CRYPT_CONTEXT_FUNCTION_CONFIG {
	ULONG dwFlags;
	ULONG dwReserved;
}
alias CRYPT_CONTEXT_FUNCTION_CONFIG* PCRYPT_CONTEXT_FUNCTION_CONFIG;

struct CRYPT_CONTEXTS {
	ULONG cContexts;
	PWSTR* rgpszContexts;
}
alias CRYPT_CONTEXTS* PCRYPT_CONTEXTS;

struct CRYPT_CONTEXT_FUNCTIONS {
	ULONG cFunctions;
	PWSTR* rgpszFunctions;
}
alias CRYPT_CONTEXT_FUNCTIONS* PCRYPT_CONTEXT_FUNCTIONS;

struct CRYPT_CONTEXT_FUNCTION_PROVIDERS {
	ULONG cProviders;
	PWSTR* rgpszProviders;
}
alias CRYPT_CONTEXT_FUNCTION_PROVIDERS* PCRYPT_CONTEXT_FUNCTION_PROVIDERS;

struct CRYPT_PROPERTY_REF {
	PWSTR pszProperty;
	ULONG cbValue;
	PUCHAR pbValue;
}
alias CRYPT_PROPERTY_REF* PCRYPT_PROPERTY_REF;

struct CRYPT_IMAGE_REF {
	PWSTR pszImage;
	ULONG dwFlags;
}
alias CRYPT_IMAGE_REF* PCRYPT_IMAGE_REF;

struct CRYPT_PROVIDER_REF {
	ULONG dwInterface;
	PWSTR pszFunction;
	PWSTR pszProvider;
	ULONG cProperties;
	PCRYPT_PROPERTY_REF* rgpProperties;
	PCRYPT_IMAGE_REF pUM;
	PCRYPT_IMAGE_REF pKM;
}
alias CRYPT_PROVIDER_REF* PCRYPT_PROVIDER_REF;

struct CRYPT_PROVIDER_REFS {
	ULONG cProviders;
	PCRYPT_PROVIDER_REF* rgpProviders;
}
alias CRYPT_PROVIDER_REFS* PCRYPT_PROVIDER_REFS;

export extern(Windows){
	NTSTATUS BCryptQueryProviderRegistration(LPCWSTR pszProvider, ULONG dwMode, ULONG dwInterface, ULONG* pcbBuffer, PCRYPT_PROVIDER_REG* ppBuffer);
	NTSTATUS BCryptEnumRegisteredProviders(ULONG* pcbBuffer, PCRYPT_PROVIDERS* ppBuffer);
	NTSTATUS BCryptCreateContext(ULONG dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
	NTSTATUS BCryptDeleteContext(ULONG dwTable, LPCWSTR pszContext);
	NTSTATUS BCryptEnumContexts(ULONG dwTable, ULONG* pcbBuffer, PCRYPT_CONTEXTS* ppBuffer);
	NTSTATUS BCryptConfigureContext(ULONG dwTable, LPCWSTR pszContext, PCRYPT_CONTEXT_CONFIG pConfig);
	NTSTATUS BCryptQueryContextConfiguration(ULONG dwTable, LPCWSTR pszContext, ULONG* pcbBuffer, PCRYPT_CONTEXT_CONFIG* ppBuffer);
	NTSTATUS BCryptAddContextFunction(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, ULONG dwPosition);
	NTSTATUS BCryptRemoveContextFunction(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction);
	NTSTATUS BCryptEnumContextFunctions( ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTIONS* ppBuffer);
	NTSTATUS BCryptConfigureContextFunction(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, PCRYPT_CONTEXT_FUNCTION_CONFIG pConfig);
	NTSTATUS BCryptQueryContextFunctionConfiguration(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_CONFIG* ppBuffer);
	NTSTATUS BCryptEnumContextFunctionProviders(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, ULONG* pcbBuffer, PCRYPT_CONTEXT_FUNCTION_PROVIDERS* ppBuffer);
	NTSTATUS BCryptSetContextFunctionProperty(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG cbValue, PUCHAR pbValue);
	NTSTATUS BCryptQueryContextFunctionProperty(ULONG dwTable, LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, LPCWSTR pszProperty, ULONG* pcbValue, PUCHAR* ppbValue);
	NTSTATUS BCryptRegisterConfigChangeNotify(HANDLE* phEvent);
	NTSTATUS BCryptUnregisterConfigChangeNotify(HANDLE hEvent);
	NTSTATUS BCryptResolveProviders(LPCWSTR pszContext, ULONG dwInterface, LPCWSTR pszFunction, LPCWSTR pszProvider, ULONG dwMode, ULONG dwFlags, ULONG* pcbBuffer, PCRYPT_PROVIDER_REFS* ppBuffer);
	NTSTATUS BCryptGetFipsAlgorithmMode(BOOLEAN* pfEnabled);
}

}// extern(C)
