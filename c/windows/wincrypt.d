/** wincrypt.d

Converted from 'wincrypt.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.wincrypt;


import c.windows.sdkddkver;
import c.windows.windef;
import c.windows.guiddef;
import c.windows.winbase;
import c.windows.bcrypt;
import c.windows.ncrypt;


extern(C){


/*	GET_ALG_CLASS(x) (x & (7 << 13))
	GET_ALG_TYPE(x) (x & (15 << 9))
	GET_ALG_SID(x) (x & (511))
*/

enum {
	ALG_CLASS_ANY          = 0,
	ALG_CLASS_SIGNATURE    = 1 << 13,
	ALG_CLASS_MSG_ENCRYPT  = 2 << 13,
	ALG_CLASS_DATA_ENCRYPT = 3 << 13,
	ALG_CLASS_HASH         = 4 << 13,
	ALG_CLASS_KEY_EXCHANGE = 5 << 13,
	ALG_CLASS_ALL          = 7 << 13,
	ALG_TYPE_ANY           = 0,
	ALG_TYPE_DSS           = 1 << 9,
	ALG_TYPE_RSA           = 2 << 9,
	ALG_TYPE_BLOCK         = 3 << 9,
	ALG_TYPE_STREAM        = 4 << 9,
	ALG_TYPE_DH            = 5 << 9,
	ALG_TYPE_SECURECHANNEL = 6 << 9,
}

enum {
	ALG_SID_ANY          = 0,
	ALG_SID_RSA_ANY      = 0,
	ALG_SID_RSA_PKCS     = 1,
	ALG_SID_RSA_MSATWORK = 2,
	ALG_SID_RSA_ENTRUST  = 3,
	ALG_SID_RSA_PGP      = 4,
	ALG_SID_DSS_ANY      = 0,
	ALG_SID_DSS_PKCS     = 1,
	ALG_SID_DSS_DMS      = 2,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		ALG_SID_ECDSA = 3,
	ALG_SID_DES        = 1,
	ALG_SID_3DES       = 3,
	ALG_SID_DESX       = 4,
	ALG_SID_IDEA       = 5,
	ALG_SID_CAST       = 6,
	ALG_SID_SAFERSK64  = 7,
	ALG_SID_SAFERSK128 = 8,
	ALG_SID_3DES_112   = 9,
	ALG_SID_CYLINK_MEK = 12,
	ALG_SID_RC5        = 13,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		ALG_SID_AES_128 = 14,
		ALG_SID_AES_192 = 15,
		ALG_SID_AES_256 = 16,
		ALG_SID_AES     = 17,
	ALG_SID_SKIPJACK       = 10,
	ALG_SID_TEK            = 11,
	CRYPT_MODE_CBCI        = 6,
	CRYPT_MODE_CFBP        = 7,
	CRYPT_MODE_OFBP        = 8,
	CRYPT_MODE_CBCOFM      = 9,
	CRYPT_MODE_CBCOFMI     = 10,
	ALG_SID_RC2            = 2,
	ALG_SID_RC4            = 1,
	ALG_SID_SEAL           = 2,
	ALG_SID_DH_SANDF       = 1,
	ALG_SID_DH_EPHEM       = 2,
	ALG_SID_AGREED_KEY_ANY = 3,
	ALG_SID_KEA            = 4,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		ALG_SID_ECDH = 5,
	ALG_SID_MD2        = 1,
	ALG_SID_MD4        = 2,
	ALG_SID_MD5        = 3,
	ALG_SID_SHA        = 4,
	ALG_SID_SHA1       = 4,
	ALG_SID_MAC        = 5,
	ALG_SID_RIPEMD     = 6,
	ALG_SID_RIPEMD160  = 7,
	ALG_SID_SSL3SHAMD5 = 8,
	ALG_SID_HMAC       = 9,
	ALG_SID_TLS1PRF    = 10,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		ALG_SID_HASH_REPLACE_OWF = 11,
	//(NTDDI_VERSION > NTDDI_WINXPSP2)
		ALG_SID_SHA_256 = 12,
		ALG_SID_SHA_384 = 13,
		ALG_SID_SHA_512 = 14,
	ALG_SID_SSL3_MASTER          = 1,
	ALG_SID_SCHANNEL_MASTER_HASH = 2,
	ALG_SID_SCHANNEL_MAC_KEY     = 3,
	ALG_SID_PCT1_MASTER          = 4,
	ALG_SID_SSL2_MASTER          = 5,
	ALG_SID_TLS1_MASTER          = 6,
	ALG_SID_SCHANNEL_ENC_KEY     = 7,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		ALG_SID_ECMQV = 1,
	ALG_SID_EXAMPLE = 80,
}

alias int ALG_ID;

enum {
	CALG_MD2      = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_MD2,
	CALG_MD4      = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_MD4,
	CALG_MD5      = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_MD5,
	CALG_SHA      = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SHA,
	CALG_SHA1     = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SHA1,
	CALG_MAC      = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_MAC,
	CALG_RSA_SIGN = ALG_CLASS_SIGNATURE | ALG_TYPE_RSA | ALG_SID_RSA_ANY,
	CALG_DSS_SIGN = ALG_CLASS_SIGNATURE | ALG_TYPE_DSS | ALG_SID_DSS_ANY,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CALG_NO_SIGN = ALG_CLASS_SIGNATURE | ALG_TYPE_ANY | ALG_SID_ANY,
	CALG_RSA_KEYX             = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_RSA|ALG_SID_RSA_ANY,
	CALG_DES                  = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_DES,
	CALG_3DES_112             = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_3DES_112,
	CALG_3DES                 = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_3DES,
	CALG_DESX                 = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_DESX,
	CALG_RC2                  = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_RC2,
	CALG_RC4                  = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_STREAM|ALG_SID_RC4,
	CALG_SEAL                 = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_STREAM|ALG_SID_SEAL,
	CALG_DH_SF                = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_DH|ALG_SID_DH_SANDF,
	CALG_DH_EPHEM             = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_DH|ALG_SID_DH_EPHEM,
	CALG_AGREEDKEY_ANY        = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_DH|ALG_SID_AGREED_KEY_ANY,
	CALG_KEA_KEYX             = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_DH|ALG_SID_KEA,
	CALG_HUGHES_MD5           = ALG_CLASS_KEY_EXCHANGE|ALG_TYPE_ANY|ALG_SID_MD5,
	CALG_SKIPJACK             = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_SKIPJACK,
	CALG_TEK                  = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_TEK,
	CALG_CYLINK_MEK           = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_CYLINK_MEK,
	CALG_SSL3_SHAMD5          = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SSL3SHAMD5,
	CALG_SSL3_MASTER          = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_SSL3_MASTER,
	CALG_SCHANNEL_MASTER_HASH = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_SCHANNEL_MASTER_HASH,
	CALG_SCHANNEL_MAC_KEY     = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_SCHANNEL_MAC_KEY,
	CALG_SCHANNEL_ENC_KEY     = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_SCHANNEL_ENC_KEY,
	CALG_PCT1_MASTER          = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_PCT1_MASTER,
	CALG_SSL2_MASTER          = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_SSL2_MASTER,
	CALG_TLS1_MASTER          = ALG_CLASS_MSG_ENCRYPT|ALG_TYPE_SECURECHANNEL|ALG_SID_TLS1_MASTER,
	CALG_RC5                  = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_RC5,
	CALG_HMAC                 = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_HMAC,
	CALG_TLS1PRF              = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_TLS1PRF,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CALG_HASH_REPLACE_OWF = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_HASH_REPLACE_OWF,
		CALG_AES_128          = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_AES_128,
		CALG_AES_192          = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_AES_192,
		CALG_AES_256          = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_AES_256,
		CALG_AES              = ALG_CLASS_DATA_ENCRYPT|ALG_TYPE_BLOCK|ALG_SID_AES,
	//(NTDDI_VERSION > NTDDI_WINXPSP2)
		CALG_SHA_256 = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SHA_256,
		CALG_SHA_384 = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SHA_384,
		CALG_SHA_512 = ALG_CLASS_HASH | ALG_TYPE_ANY | ALG_SID_SHA_512,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		CALG_ECDH  = ALG_CLASS_KEY_EXCHANGE | ALG_TYPE_DH | ALG_SID_ECDH,
		CALG_ECMQV = ALG_CLASS_KEY_EXCHANGE | ALG_TYPE_ANY | ALG_SID_ECMQV,
		CALG_ECDSA = ALG_CLASS_SIGNATURE | ALG_TYPE_DSS | ALG_SID_ECDSA,
}

//(NTDDI_VERSION < NTDDI_WINXP)
	enum SIGNATURE_RESOURCE_NUMBER = 0x29A;
	struct VTableProvStruc {
		DWORD Version;
		FARPROC FuncVerifyImage;
		FARPROC FuncReturnhWnd;
		DWORD dwProvType;
		BYTE* pbContextInfo;
		DWORD cbContextInfo;
		LPSTR pszProvName;
	}
	alias VTableProvStruc* PVTableProvStruc;

/* moved to windef.d
alias ULONG_PTR HCRYPTPROV;
alias ULONG_PTR HCRYPTKEY;
alias ULONG_PTR HCRYPTHASH;
*/

enum {
	CRYPT_VERIFYCONTEXT  = 0xF0000000,
	CRYPT_NEWKEYSET      = 0x00000008,
	CRYPT_DELETEKEYSET   = 0x00000010,
	CRYPT_MACHINE_KEYSET = 0x00000020,
	CRYPT_SILENT         = 0x00000040,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		CRYPT_DEFAULT_CONTAINER_OPTIONAL = 0x00000080,
	CRYPT_EXPORTABLE     = 0x00000001,
	CRYPT_USER_PROTECTED = 0x00000002,
	CRYPT_CREATE_SALT    = 0x00000004,
	CRYPT_UPDATE_KEY     = 0x00000008,
	CRYPT_NO_SALT        = 0x00000010,
	CRYPT_PREGEN         = 0x00000040,
	CRYPT_RECIPIENT      = 0x00000010,
	CRYPT_INITIATOR      = 0x00000040,
	CRYPT_ONLINE         = 0x00000080,
	CRYPT_SF             = 0x00000100,
	CRYPT_CREATE_IV      = 0x00000200,
	CRYPT_KEK            = 0x00000400,
	CRYPT_DATA_KEY       = 0x00000800,
	CRYPT_VOLATILE       = 0x00001000,
	CRYPT_SGCKEY         = 0x00002000,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CRYPT_ARCHIVABLE = 0x00004000,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		CRYPT_FORCE_KEY_PROTECTION_HIGH = 0x00008000,
	RSA1024BIT_KEY      = 0x04000000,
	CRYPT_SERVER        = 0x00000400,
	KEY_LENGTH_MASK     = 0xFFFF0000,
	CRYPT_Y_ONLY        = 0x00000001,
	CRYPT_SSL2_FALLBACK = 0x00000002,
	CRYPT_DESTROYKEY    = 0x00000004,
	CRYPT_OAEP          = 0x00000040,
	CRYPT_BLOB_VER3     = 0x00000080,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CRYPT_IPSEC_HMAC_KEY = 0x00000100,
	//(NTDDI_VERSION >= NTDDI_WS03)
		CRYPT_DECRYPT_RSA_NO_PADDING_CHECK = 0x00000020,
	CRYPT_SECRETDIGEST = 0x00000001,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		CRYPT_OWF_REPL_LM_HASH = 0x00000001,
	CRYPT_LITTLE_ENDIAN   = 0x00000001,
	CRYPT_NOHASHOID       = 0x00000001,
	CRYPT_TYPE2_FORMAT    = 0x00000002,
	CRYPT_X931_FORMAT     = 0x00000004,
	CRYPT_MACHINE_DEFAULT = 0x00000001,
	CRYPT_USER_DEFAULT    = 0x00000002,
	CRYPT_DELETE_DEFAULT  = 0x00000004,
}

enum {
	SIMPLEBLOB           = 0x1,
	PUBLICKEYBLOB        = 0x6,
	PRIVATEKEYBLOB       = 0x7,
	PLAINTEXTKEYBLOB     = 0x8,
	OPAQUEKEYBLOB        = 0x9,
	PUBLICKEYBLOBEX      = 0xA,
	SYMMETRICWRAPKEYBLOB = 0xB,
	//(NTDDI_VERSION >= NTDDI_WS03)
		KEYSTATEBLOB = 0xC,
}

enum {
	AT_KEYEXCHANGE = 1,
	AT_SIGNATURE   = 2,
	CRYPT_USERDATA = 1,
}

enum {
	KP_IV               = 1,
	KP_SALT             = 2,
	KP_PADDING          = 3,
	KP_MODE             = 4,
	KP_MODE_BITS        = 5,
	KP_PERMISSIONS      = 6,
	KP_ALGID            = 7,
	KP_BLOCKLEN         = 8,
	KP_KEYLEN           = 9,
	KP_SALT_EX          = 10,
	KP_P                = 11,
	KP_G                = 12,
	KP_Q                = 13,
	KP_X                = 14,
	KP_Y                = 15,
	KP_RA               = 16,
	KP_RB               = 17,
	KP_INFO             = 18,
	KP_EFFECTIVE_KEYLEN = 19,
	KP_SCHANNEL_ALG     = 20,
	KP_CLIENT_RANDOM    = 21,
	KP_SERVER_RANDOM    = 22,
	KP_RP               = 23,
	KP_PRECOMP_MD5      = 24,
	KP_PRECOMP_SHA      = 25,
	KP_CERTIFICATE      = 26,
	KP_CLEAR_KEY        = 27,
	KP_PUB_EX_LEN       = 28,
	KP_PUB_EX_VAL       = 29,
	KP_KEYVAL           = 30,
	KP_ADMIN_PIN        = 31,
	KP_KEYEXCHANGE_PIN  = 32,
	KP_SIGNATURE_PIN    = 33,
	KP_PREHASH          = 34,
	//(NTDDI_VERSION >= NTDDI_WS03)
		KP_ROUNDS = 35,
	KP_OAEP_PARAMS     = 36,
	KP_CMS_KEY_INFO    = 37,
	KP_CMS_DH_KEY_INFO = 38,
	KP_PUB_PARAMS      = 39,
	KP_VERIFY_PARAMS   = 40,
	KP_HIGHEST_VERSION = 41,
	//(NTDDI_VERSION >= NTDDI_WS03)
		KP_GET_USE_COUNT = 42,
	KP_PIN_ID        = 43,
	KP_PIN_INFO      = 44,
	PKCS5_PADDING    = 1,
	RANDOM_PADDING   = 2,
	ZERO_PADDING     = 3,
	CRYPT_MODE_CBC   = 1,
	CRYPT_MODE_ECB   = 2,
	CRYPT_MODE_OFB   = 3,
	CRYPT_MODE_CFB   = 4,
	CRYPT_MODE_CTS   = 5,
	CRYPT_ENCRYPT    = 0x0001,
	CRYPT_DECRYPT    = 0x0002,
	CRYPT_EXPORT     = 0x0004,
	CRYPT_READ       = 0x0008,
	CRYPT_WRITE      = 0x0010,
	CRYPT_MAC        = 0x0020,
	CRYPT_EXPORT_KEY = 0x0040,
	CRYPT_IMPORT_KEY = 0x0080,
//(NTDDI_VERSION >= NTDDI_WINXP)
		CRYPT_ARCHIVE = 0x0100,
	HP_ALGID         = 0x0001,
	HP_HASHVAL       = 0x0002,
	HP_HASHSIZE      = 0x0004,
	HP_HMAC_INFO     = 0x0005,
	HP_TLS1PRF_LABEL = 0x0006,
	HP_TLS1PRF_SEED  = 0x0007,
}

enum {
	CRYPT_FAILED  = FALSE,
	CRYPT_SUCCEED = TRUE,
}

//RCRYPT_SUCCEEDED(rt) ((rt) == CRYPT_SUCCEED)
//CRYPT_FAILED(rt) ((rt) == CRYPT_FAILED)

enum {
	PP_ENUMALGS            = 1,
	PP_ENUMCONTAINERS      = 2,
	PP_IMPTYPE             = 3,
	PP_NAME                = 4,
	PP_VERSION             = 5,
	PP_CONTAINER           = 6,
	PP_CHANGE_PASSWORD     = 7,
	PP_KEYSET_SEC_DESCR    = 8,
	PP_CERTCHAIN           = 9,
	PP_KEY_TYPE_SUBTYPE    = 10,
	PP_PROVTYPE            = 16,
	PP_KEYSTORAGE          = 17,
	PP_APPLI_CERT          = 18,
	PP_SYM_KEYSIZE         = 19,
	PP_SESSION_KEYSIZE     = 20,
	PP_UI_PROMPT           = 21,
	PP_ENUMALGS_EX         = 22,
	PP_ENUMMANDROOTS       = 25,
	PP_ENUMELECTROOTS      = 26,
	PP_KEYSET_TYPE         = 27,
	PP_ADMIN_PIN           = 31,
	PP_KEYEXCHANGE_PIN     = 32,
	PP_SIGNATURE_PIN       = 33,
	PP_SIG_KEYSIZE_INC     = 34,
	PP_KEYX_KEYSIZE_INC    = 35,
	PP_UNIQUE_CONTAINER    = 36,
	PP_SGC_INFO            = 37,
	PP_USE_HARDWARE_RNG    = 38,
	PP_KEYSPEC             = 39,
	PP_ENUMEX_SIGNING_PROT = 40,
	//(NTDDI_VERSION >= NTDDI_WS03)
		PP_CRYPT_COUNT_KEY_USE = 41,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		PP_USER_CERTSTORE   = 42,
		PP_SMARTCARD_READER = 43,
		PP_SMARTCARD_GUID   = 45,
		PP_ROOT_CERTSTORE   = 46,
}

enum {
	CRYPT_FIRST          = 1,
	CRYPT_NEXT           = 2,
	CRYPT_SGC_ENUM       = 4,
	CRYPT_IMPL_HARDWARE  = 1,
	CRYPT_IMPL_SOFTWARE  = 2,
	CRYPT_IMPL_MIXED     = 3,
	CRYPT_IMPL_UNKNOWN   = 4,
	CRYPT_IMPL_REMOVABLE = 8,
}

enum {
	CRYPT_SEC_DESCR = 0x00000001,
	CRYPT_PSTORE    = 0x00000002,
	CRYPT_UI_PROMPT = 0x00000004,
}

enum {
	CRYPT_FLAG_PCT1    = 0x0001,
	CRYPT_FLAG_SSL2    = 0x0002,
	CRYPT_FLAG_SSL3    = 0x0004,
	CRYPT_FLAG_TLS1    = 0x0008,
	CRYPT_FLAG_IPSEC   = 0x0010,
	CRYPT_FLAG_SIGNING = 0x0020,
	CRYPT_SGC          = 0x0001,
	CRYPT_FASTSGC      = 0x0002,
}

enum {
	PP_CLIENT_HWND         = 1,
	PP_CONTEXT_INFO        = 11,
	PP_KEYEXCHANGE_KEYSIZE = 12,
	PP_SIGNATURE_KEYSIZE   = 13,
	PP_KEYEXCHANGE_ALG     = 14,
	PP_SIGNATURE_ALG       = 15,
	PP_DELETEKEY           = 24,
	//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
		PP_PIN_PROMPT_STRING      = 44,
		PP_SECURE_KEYEXCHANGE_PIN = 47,
		PP_SECURE_SIGNATURE_PIN   = 48,
}

enum {
	PROV_RSA_FULL      = 1,
	PROV_RSA_SIG       = 2,
	PROV_DSS           = 3,
	PROV_FORTEZZA      = 4,
	PROV_MS_EXCHANGE   = 5,
	PROV_SSL           = 6,
	PROV_RSA_SCHANNEL  = 12,
	PROV_DSS_DH        = 13,
	PROV_EC_ECDSA_SIG  = 14,
	PROV_EC_ECNRA_SIG  = 15,
	PROV_EC_ECDSA_FULL = 16,
	PROV_EC_ECNRA_FULL = 17,
	PROV_DH_SCHANNEL   = 18,
	PROV_SPYRUS_LYNKS  = 20,
	PROV_RNG           = 21,
	PROV_INTEL_SEC     = 22,
	//(NTDDI_VERSION >= NTDDI_WINXP)
		PROV_REPLACE_OWF = 23,
		PROV_RSA_AES     = 24,
	//(NTDDI_VERSION <= NTDDI_WINXP)
		PROV_STT_MER  = 7,
		PROV_STT_ACQ  = 8,
		PROV_STT_BRND = 9,
		PROV_STT_ROOT = 10,
		PROV_STT_ISS  = 11,
}

const char* MS_DEF_PROV_A = "Microsoft Base Cryptographic Provider v1.0";
const wchar* MS_DEF_PROV_W = "Microsoft Base Cryptographic Provider v1.0";
version(UNICODE)
	alias MS_DEF_PROV_W MS_DEF_PROV;
else
	alias MS_DEF_PROV_A MS_DEF_PROV;

const char* MS_ENHANCED_PROV_A = "Microsoft Enhanced Cryptographic Provider v1.0";
const wchar* MS_ENHANCED_PROV_W = "Microsoft Enhanced Cryptographic Provider v1.0";
version(UNICODE)
	alias MS_ENHANCED_PROV_W MS_ENHANCED_PROV;
else
	alias MS_ENHANCED_PROV_A MS_ENHANCED_PROV;

const char* MS_STRONG_PROV_A = "Microsoft Strong Cryptographic Provider";
const wchar* MS_STRONG_PROV_W = "Microsoft Strong Cryptographic Provider";
version(UNICODE)
	alias MS_STRONG_PROV_W MS_STRONG_PROV;
else
	alias MS_STRONG_PROV_A MS_STRONG_PROV;

const char* MS_DEF_RSA_SIG_PROV_A = "Microsoft RSA Signature Cryptographic Provider";
const wchar* MS_DEF_RSA_SIG_PROV_W = "Microsoft RSA Signature Cryptographic Provider";
version(UNICODE)
	alias MS_DEF_RSA_SIG_PROV_W MS_DEF_RSA_SIG_PROV;
else
	alias MS_DEF_RSA_SIG_PROV_A MS_DEF_RSA_SIG_PROV;

const char* MS_DEF_RSA_SCHANNEL_PROV_A = "Microsoft RSA SChannel Cryptographic Provider";
const wchar* MS_DEF_RSA_SCHANNEL_PROV_W = "Microsoft RSA SChannel Cryptographic Provider";
version(UNICODE)
	alias MS_DEF_RSA_SCHANNEL_PROV_W MS_DEF_RSA_SCHANNEL_PROV;
else
	alias MS_DEF_RSA_SCHANNEL_PROV_A MS_DEF_RSA_SCHANNEL_PROV;

const char* MS_DEF_DSS_PROV_A = "Microsoft Base DSS Cryptographic Provider";
const wchar* MS_DEF_DSS_PROV_W = "Microsoft Base DSS Cryptographic Provider";
version(UNICODE)
	alias MS_DEF_DSS_PROV_W MS_DEF_DSS_PROV;
else
	alias MS_DEF_DSS_PROV_A MS_DEF_DSS_PROV;

const char* MS_DEF_DSS_DH_PROV_A = "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider";
const wchar* MS_DEF_DSS_DH_PROV_W = "Microsoft Base DSS and Diffie-Hellman Cryptographic Provider";
version(UNICODE)
	alias MS_DEF_DSS_DH_PROV_W MS_DEF_DSS_DH_PROV;
else
	alias MS_DEF_DSS_DH_PROV_A MS_DEF_DSS_DH_PROV;

const char* MS_ENH_DSS_DH_PROV_A = "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider";
const wchar* MS_ENH_DSS_DH_PROV_W = "Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider";
version(UNICODE)
	alias MS_ENH_DSS_DH_PROV_W MS_ENH_DSS_DH_PROV;
else
	alias MS_ENH_DSS_DH_PROV_A MS_ENH_DSS_DH_PROV;

const char* MS_DEF_DH_SCHANNEL_PROV_A = "Microsoft DH SChannel Cryptographic Provider";
const wchar* MS_DEF_DH_SCHANNEL_PROV_W = "Microsoft DH SChannel Cryptographic Provider";
version(UNICODE)
	alias MS_DEF_DH_SCHANNEL_PROV_W MS_DEF_DH_SCHANNEL_PROV;
else
	alias MS_DEF_DH_SCHANNEL_PROV_A MS_DEF_DH_SCHANNEL_PROV;

const char* MS_SCARD_PROV_A = "Microsoft Base Smart Card Crypto Provider";
const wchar* MS_SCARD_PROV_W = "Microsoft Base Smart Card Crypto Provider";
version(UNICODE)
	alias MS_SCARD_PROV_W MS_SCARD_PROV;
else
	alias MS_SCARD_PROV_A MS_SCARD_PROV;

//(NTDDI_VERSION >= NTDDI_WINXP)
	const char* MS_ENH_RSA_AES_PROV_A = "Microsoft Enhanced RSA and AES Cryptographic Provider";
	const wchar* MS_ENH_RSA_AES_PROV_W = "Microsoft Enhanced RSA and AES Cryptographic Provider";
	const char* MS_ENH_RSA_AES_PROV_XP_A = "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)";
	const wchar* MS_ENH_RSA_AES_PROV_XP_W = "Microsoft Enhanced RSA and AES Cryptographic Provider (Prototype)";
	version(UNICODE){
		alias MS_ENH_RSA_AES_PROV_XP_W MS_ENH_RSA_AES_PROV_XP;
		alias MS_ENH_RSA_AES_PROV_W MS_ENH_RSA_AES_PROV;
	}else{
		alias MS_ENH_RSA_AES_PROV_XP_A MS_ENH_RSA_AES_PROV_XP;
		alias MS_ENH_RSA_AES_PROV_A MS_ENH_RSA_AES_PROV;
	}

enum MAXUIDLEN = 64;

const char* EXPO_OFFLOAD_REG_VALUE = "ExpoOffload";
const char* EXPO_OFFLOAD_FUNC_NAME = "OffloadModExpo";

const char* szKEY_CRYPTOAPI_PRIVATE_KEY_OPTIONS = "Software\\Policies\\Microsoft\\Cryptography";

const char* szFORCE_KEY_PROTECTION = "ForceKeyProtection";

enum {
	dwFORCE_KEY_PROTECTION_DISABLED    = 0x0,
	dwFORCE_KEY_PROTECTION_USER_SELECT = 0x1,
	dwFORCE_KEY_PROTECTION_HIGH        = 0x2,
}

const char* szKEY_CACHE_ENABLED = "CachePrivateKeys";
const char* szKEY_CACHE_SECONDS = "PrivateKeyLifetimeSeconds";

//(NTDDI_VERSION >= NTDDI_WINXP)
	const char* szPRIV_KEY_CACHE_MAX_ITEMS = "PrivKeyCacheMaxItems";
	enum cPRIV_KEY_CACHE_MAX_ITEMS_DEFAULT = 20;

	const char* szPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS = "PrivKeyCachePurgeIntervalSeconds";
	enum cPRIV_KEY_CACHE_PURGE_INTERVAL_SECONDS_DEFAULT = 86400;

enum CUR_BLOB_VERSION = 2;

struct CMS_KEY_INFO {
	DWORD dwVersion;
	ALG_ID Algid;
	BYTE* pbOID;
	DWORD cbOID;
}
alias CMS_KEY_INFO* PCMS_KEY_INFO;

struct HMAC_INFO {
	ALG_ID HashAlgid;
	BYTE* pbInnerString;
	DWORD cbInnerString;
	BYTE* pbOuterString;
	DWORD cbOuterString;
}
alias HMAC_INFO* PHMAC_INFO;

struct SCHANNEL_ALG {
	DWORD dwUse;
	ALG_ID Algid;
	DWORD cBits;
	DWORD dwFlags;
	DWORD dwReserved;
}
alias SCHANNEL_ALG* PSCHANNEL_ALG;

enum {
	SCHANNEL_MAC_KEY    = 0x00000000,
	SCHANNEL_ENC_KEY    = 0x00000001,
	INTERNATIONAL_USAGE = 0x00000001,
}

struct PROV_ENUMALGS {
	ALG_ID aiAlgid;
	DWORD dwBitLen;
	DWORD dwNameLen;
	CHAR[20] szName;
}

struct PROV_ENUMALGS_EX{
	ALG_ID aiAlgid;
	DWORD dwDefaultLen;
	DWORD dwMinLen;
	DWORD dwMaxLen;
	DWORD dwProtocols;
	DWORD dwNameLen;
	CHAR[20] szName;
	DWORD dwLongNameLen;
	CHAR[40] szLongName;
}

struct BLOBHEADER {
	BYTE bType;
	BYTE bVersion;
	WORD reserved;
	ALG_ID aiKeyAlg;
}
alias BLOBHEADER PUBLICKEYSTRUC;

struct RSAPUBKEY {
	DWORD magic;
	DWORD bitlen;
	DWORD pubexp;
}

struct DHPUBKEY {
	DWORD magic;
	DWORD bitlen;
}
alias DHPUBKEY DSSPUBKEY;
alias DHPUBKEY KEAPUBKEY;
alias DHPUBKEY TEKPUBKEY;

struct DSSSEED {
	DWORD counter;
	BYTE[20] seed;
}

struct DHPUBKEY_VER3 {
	DWORD magic;
	DWORD bitlenP;
	DWORD bitlenQ;
	DWORD bitlenJ;
	DSSSEED DSSSeed;
}
alias DHPUBKEY_VER3 DSSPUBKEY_VER3;

struct DHPRIVKEY_VER3 {
	DWORD magic;
	DWORD bitlenP;
	DWORD bitlenQ;
	DWORD bitlenJ;
	DWORD bitlenX;
	DSSSEED DSSSeed;
}
alias DHPRIVKEY_VER3 DSSPRIVKEY_VER3;

struct KEY_TYPE_SUBTYPE {
	DWORD dwKeySpec;
	GUID Type;
	GUID Subtype;
}
alias KEY_TYPE_SUBTYPE* PKEY_TYPE_SUBTYPE;

struct CERT_FORTEZZA_DATA_PROP {
	ubyte[8] SerialNumber;
	int CertIndex;
	ubyte[36] CertLabel;
}

//(NTDDI_VERSION >= NTDDI_WS03)
	struct CRYPT_RC4_KEY_STATE {
		ubyte[16] Key;
		ubyte[256] SBox;
		ubyte i;
		ubyte j;
	}
	alias CRYPT_RC4_KEY_STATE* PCRYPT_RC4_KEY_STATE;

	struct CRYPT_DES_KEY_STATE {
		ubyte[8] Key;
		ubyte[8] IV;
		ubyte[8] Feedback;
	}
	alias CRYPT_DES_KEY_STATE* PCRYPT_DES_KEY_STATE;

	struct CRYPT_3DES_KEY_STATE {
		ubyte[24] Key;
		ubyte[8] IV;
		ubyte[8] Feedback;
	}
	alias CRYPT_3DES_KEY_STATE* PCRYPT_3DES_KEY_STATE;

//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	struct CRYPT_AES_128_KEY_STATE {
		ubyte[16] Key;
		ubyte[16] IV;
		ubyte[11][16] EncryptionState;
		ubyte[11][16] DecryptionState;
		ubyte[16] Feedback;
	}
	alias CRYPT_AES_128_KEY_STATE* PCRYPT_AES_128_KEY_STATE;

	struct CRYPT_AES_256_KEY_STATE {
		ubyte[32] Key;
		ubyte[16] IV;
		ubyte[15][16] EncryptionState;
		ubyte[15][16] DecryptionState;
		ubyte[16] Feedback;
	}
	alias CRYPT_AES_256_KEY_STATE* PCRYPT_AES_256_KEY_STATE;

struct CRYPT_INTEGER_BLOB {
	DWORD cbData;
	BYTE* pbData;
}
alias CRYPT_INTEGER_BLOB* PCRYPT_INTEGER_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_UINT_BLOB;
alias CRYPT_UINT_BLOB* PCRYPT_UINT_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_OBJID_BLOB;
alias CRYPT_OBJID_BLOB* PCRYPT_OBJID_BLOB;
alias CRYPT_INTEGER_BLOB CERT_NAME_BLOB;
alias CERT_NAME_BLOB* PCERT_NAME_BLOB;
alias CRYPT_INTEGER_BLOB CERT_RDN_VALUE_BLOB;
alias CERT_RDN_VALUE_BLOB* PCERT_RDN_VALUE_BLOB;
alias CRYPT_INTEGER_BLOB CERT_BLOB;
alias CERT_BLOB* PCERT_BLOB;
alias CRYPT_INTEGER_BLOB CRL_BLOB;
alias CRL_BLOB* PCRL_BLOB;
alias CRYPT_INTEGER_BLOB DATA_BLOB;
alias DATA_BLOB* PDATA_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_DATA_BLOB;
alias CRYPT_DATA_BLOB* PCRYPT_DATA_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_HASH_BLOB;
alias CRYPT_HASH_BLOB* PCRYPT_HASH_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_DIGEST_BLOB;
alias CRYPT_DIGEST_BLOB* PCRYPT_DIGEST_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_DER_BLOB;
alias CRYPT_DER_BLOB* PCRYPT_DER_BLOB;
alias CRYPT_INTEGER_BLOB CRYPT_ATTR_BLOB;
alias CRYPT_ATTR_BLOB* PCRYPT_ATTR_BLOB;


struct CMS_DH_KEY_INFO {
	DWORD dwVersion;
	ALG_ID Algid;
	LPSTR pszContentEncObjId;
	CRYPT_DATA_BLOB PubInfo;
	void* pReserved;
}
alias CMS_DH_KEY_INFO* PCMS_DH_KEY_INFO;

export extern(Windows) BOOL CryptAcquireContextA(HCRYPTPROV* phProv, LPCSTR szContainer, LPCSTR szProvider, DWORD dwProvType, DWORD dwFlags);
export extern(Windows) BOOL CryptAcquireContextW(HCRYPTPROV* phProv, LPCWSTR szContainer, LPCWSTR szProvider, DWORD dwProvType, DWORD dwFlags);
version(UNICODE)
	alias CryptAcquireContextW CryptAcquireContext;
else
	alias CryptAcquireContextA CryptAcquireContext;

static if (NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) BOOL CryptReleaseContext(HCRYPTPROV hProv, DWORD dwFlags);
static if (NTDDI_VERSION < NTDDI_WINXP)
	export extern(Windows) BOOL CryptReleaseContext(HCRYPTPROV hProv, ULONG_PTR dwFlags);

export extern(Windows) BOOL CryptGenKey(HCRYPTPROV hProv, ALG_ID Algid, DWORD dwFlags, HCRYPTKEY* phKey);
export extern(Windows) BOOL CryptDeriveKey(HCRYPTPROV hProv, ALG_ID Algid, HCRYPTHASH hBaseData, DWORD dwFlags, HCRYPTKEY* phKey);
export extern(Windows) BOOL CryptDestroyKey(HCRYPTKEY hKey);

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetKeyParam(HCRYPTKEY hKey, DWORD dwParam, const(BYTE)* pbData, DWORD dwFlags);
static if(NTDDI_VERSION < NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetKeyParam(HCRYPTKEY hKey, DWORD dwParam, const(BYTE)* pbData, DWORD dwFlags);

export extern(Windows) BOOL CryptGetKeyParam(HCRYPTKEY hKey, DWORD dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetHashParam(HCRYPTHASH hHash, DWORD dwParam, const(BYTE)* pbData, DWORD dwFlags);
static if(NTDDI_VERSION < NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetHashParam(HCRYPTHASH hHash, DWORD dwParam, BYTE* pbData, DWORD dwFlags);

export extern(Windows) BOOL CryptGetHashParam(HCRYPTHASH hHash, DWORD dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);

static if(NTDDI_VERSION >= NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetProvParam(HCRYPTPROV hProv, DWORD dwParam, const(BYTE)* pbData, DWORD dwFlags);
static if(NTDDI_VERSION < NTDDI_WINXP)
	export extern(Windows) BOOL CryptSetProvParam(HCRYPTPROV hProv, DWORD dwParam, BYTE* pbData, DWORD dwFlags);

export extern(Windows) BOOL CryptGetProvParam(HCRYPTPROV hProv, DWORD dwParam, BYTE* pbData, DWORD* pdwDataLen, DWORD dwFlags);
export extern(Windows) BOOL CryptGenRandom(HCRYPTPROV hProv, DWORD dwLen, BYTE* pbBuffer);
export extern(Windows) BOOL CryptGetUserKey(HCRYPTPROV hProv, DWORD dwKeySpec, HCRYPTKEY* phUserKey);
export extern(Windows) BOOL CryptExportKey(HCRYPTKEY hKey, HCRYPTKEY hExpKey, DWORD dwBlobType, DWORD dwFlags, BYTE* pbData, DWORD* pdwDataLen);
export extern(Windows) BOOL CryptImportKey(HCRYPTPROV hProv, const(BYTE)* pbData, DWORD dwDataLen, HCRYPTKEY hPubKey, DWORD dwFlags, HCRYPTKEY* phKey);
export extern(Windows) BOOL CryptEncrypt(HCRYPTKEY hKey, HCRYPTHASH hHash, BOOL Final, DWORD dwFlags, BYTE* pbData, DWORD* pdwDataLen, DWORD dwBufLen);
export extern(Windows) BOOL CryptDecrypt(HCRYPTKEY hKey, HCRYPTHASH hHash, BOOL Final, DWORD dwFlags, BYTE* pbData, DWORD* pdwDataLen);
export extern(Windows) BOOL CryptCreateHash(HCRYPTPROV hProv, ALG_ID Algid, HCRYPTKEY hKey, DWORD dwFlags, HCRYPTHASH* phHash);
export extern(Windows) BOOL CryptHashData(HCRYPTHASH hHash, const(BYTE)* pbData, DWORD dwDataLen, DWORD dwFlags);
export extern(Windows) BOOL CryptHashSessionKey(HCRYPTHASH hHash, HCRYPTKEY hKey, DWORD dwFlags);
export extern(Windows) BOOL CryptDestroyHash(HCRYPTHASH hHash);

export extern(Windows) BOOL CryptSignHashA(HCRYPTHASH hHash, DWORD dwKeySpec, LPCSTR szDescription, DWORD dwFlags, BYTE* pbSignature, DWORD* pdwSigLen);
export extern(Windows) BOOL CryptSignHashW(HCRYPTHASH hHash, DWORD dwKeySpec, LPCWSTR szDescription, DWORD dwFlags, BYTE* pbSignature, DWORD* pdwSigLen);
version(UNICODE)
	alias CryptSignHashW CryptSignHash;
else
	alias CryptSignHashA CryptSignHash;

export extern(Windows) BOOL CryptVerifySignatureA(HCRYPTHASH hHash, const(BYTE)* pbSignature, DWORD dwSigLen, HCRYPTKEY hPubKey, LPCSTR szDescription, DWORD dwFlags);
export extern(Windows) BOOL CryptVerifySignatureW(HCRYPTHASH hHash, const(BYTE)* pbSignature, DWORD dwSigLen, HCRYPTKEY hPubKey, LPCWSTR szDescription, DWORD dwFlags);
version(UNICODE)
	alias CryptVerifySignatureW CryptVerifySignature;
else
	alias CryptVerifySignatureA CryptVerifySignature;

export extern(Windows) BOOL CryptSetProviderA(LPCSTR pszProvName, DWORD dwProvType);
export extern(Windows) BOOL CryptSetProviderW(LPCWSTR pszProvName, DWORD dwProvType);
version(UNICODE)
	alias CryptSetProviderW CryptSetProvider;
else
	alias CryptSetProviderA CryptSetProvider;

export extern(Windows) BOOL CryptSetProviderExA(LPCSTR pszProvName, DWORD dwProvType, DWORD* pdwReserved, DWORD dwFlags);
export extern(Windows) BOOL CryptSetProviderExW(LPCWSTR pszProvName, DWORD dwProvType, DWORD* pdwReserved, DWORD dwFlags);
version(UNICODE)
	alias CryptSetProviderExW CryptSetProviderEx;
else
	alias CryptSetProviderExA CryptSetProviderEx;

static if(NTDDI_VERSION < _WIN32_WINNT_VISTA){
	export extern(Windows) BOOL CryptGetDefaultProviderA(DWORD dwProvType, DWORD* pdwReserved, DWORD dwFlags, LPSTR pszProvName, DWORD* pcbProvName);
	export extern(Windows) BOOL CryptGetDefaultProviderW(DWORD dwProvType, DWORD* pdwReserved, DWORD dwFlags, LPWSTR pszProvName, DWORD* pcbProvName);
	version(UNICODE)
		alias CryptGetDefaultProviderW CryptGetDefaultProvider;
	else
		alias CryptGetDefaultProviderA CryptGetDefaultProvider;
}

export extern(Windows) BOOL CryptEnumProviderTypesA(DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, DWORD* pdwProvType, LPSTR szTypeName, DWORD* pcbTypeName);
export extern(Windows) BOOL CryptEnumProviderTypesW(DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, DWORD* pdwProvType, LPWSTR szTypeName, DWORD* pcbTypeName);
version(UNICODE)
	alias CryptEnumProviderTypesW CryptEnumProviderTypes;
else
	alias CryptEnumProviderTypesA CryptEnumProviderTypes;

export extern(Windows) BOOL CryptEnumProvidersA(DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, DWORD* pdwProvType, LPSTR szProvName, DWORD* pcbProvName);
export extern(Windows) BOOL CryptEnumProvidersW(DWORD dwIndex, DWORD* pdwReserved, DWORD dwFlags, DWORD* pdwProvType, LPWSTR szProvName, DWORD* pcbProvName);
version(UNICODE)
	alias CryptEnumProvidersW CryptEnumProviders;
else
	alias CryptEnumProvidersA CryptEnumProviders;

export extern(Windows) BOOL CryptContextAddRef(HCRYPTPROV hProv, DWORD* pdwReserved, DWORD dwFlags);
export extern(Windows) BOOL CryptDuplicateKey(HCRYPTKEY hKey, DWORD* pdwReserved, DWORD dwFlags, HCRYPTKEY* phKey);
export extern(Windows) BOOL CryptDuplicateHash(HCRYPTHASH hHash, DWORD* pdwReserved, DWORD dwFlags, HCRYPTHASH* phHash);

static if(NTDDI_VERSION >= NTDDI_WS03)
	export extern(C) BOOL GetEncSChannel(BYTE** pData, DWORD* dwDecSize);


enum HCRYPTPROV_OR_NCRYPT_KEY_HANDLE : ULONG_PTR {init = (ULONG_PTR).init}
enum HCRYPTPROV_LEGACY : ULONG_PTR {init = (ULONG_PTR).init}

struct CRYPT_BIT_BLOB {
	DWORD cbData;
	BYTE* pbData;
	DWORD cUnusedBits;
}
alias CRYPT_BIT_BLOB* PCRYPT_BIT_BLOB;

struct CRYPT_ALGORITHM_IDENTIFIER {
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Parameters;
}
alias CRYPT_ALGORITHM_IDENTIFIER* PCRYPT_ALGORITHM_IDENTIFIER;

const char* szOID_RSA = "1.2.840.113549";
const char* szOID_PKCS = "1.2.840.113549.1";
const char* szOID_RSA_HASH = "1.2.840.113549.2";
const char* szOID_RSA_ENCRYPT = "1.2.840.113549.3";
const char* szOID_PKCS_1 = "1.2.840.113549.1.1";
const char* szOID_PKCS_2 = "1.2.840.113549.1.2";
const char* szOID_PKCS_3 = "1.2.840.113549.1.3";
const char* szOID_PKCS_4 = "1.2.840.113549.1.4";
const char* szOID_PKCS_5 = "1.2.840.113549.1.5";
const char* szOID_PKCS_6 = "1.2.840.113549.1.6";
const char* szOID_PKCS_7 = "1.2.840.113549.1.7";
const char* szOID_PKCS_8 = "1.2.840.113549.1.8";
const char* szOID_PKCS_9 = "1.2.840.113549.1.9";
const char* szOID_PKCS_10 = "1.2.840.113549.1.10";
const char* szOID_PKCS_12 = "1.2.840.113549.1.12";
const char* szOID_RSA_RSA = "1.2.840.113549.1.1.1";
const char* szOID_RSA_MD2RSA = "1.2.840.113549.1.1.2";
const char* szOID_RSA_MD4RSA = "1.2.840.113549.1.1.3";
const char* szOID_RSA_MD5RSA = "1.2.840.113549.1.1.4";
const char* szOID_RSA_SHA1RSA = "1.2.840.113549.1.1.5";
const char* szOID_RSA_SETOAEP_RSA = "1.2.840.113549.1.1.6";
const char* szOID_RSAES_OAEP = "1.2.840.113549.1.1.7";
const char* szOID_RSA_MGF1 = "1.2.840.113549.1.1.8";
const char* szOID_RSA_PSPECIFIED = "1.2.840.113549.1.1.9";
const char* szOID_RSA_SSA_PSS = "1.2.840.113549.1.1.10";
const char* szOID_RSA_SHA256RSA = "1.2.840.113549.1.1.11";
const char* szOID_RSA_SHA384RSA = "1.2.840.113549.1.1.12";
const char* szOID_RSA_SHA512RSA = "1.2.840.113549.1.1.13";
const char* szOID_RSA_DH = "1.2.840.113549.1.3.1";
const char* szOID_RSA_data = "1.2.840.113549.1.7.1";
const char* szOID_RSA_signedData = "1.2.840.113549.1.7.2";
const char* szOID_RSA_envelopedData = "1.2.840.113549.1.7.3";
const char* szOID_RSA_signEnvData = "1.2.840.113549.1.7.4";
const char* szOID_RSA_digestedData = "1.2.840.113549.1.7.5";
const char* szOID_RSA_hashedData = "1.2.840.113549.1.7.5";
const char* szOID_RSA_encryptedData = "1.2.840.113549.1.7.6";
const char* szOID_RSA_emailAddr = "1.2.840.113549.1.9.1";
const char* szOID_RSA_unstructName = "1.2.840.113549.1.9.2";
const char* szOID_RSA_contentType = "1.2.840.113549.1.9.3";
const char* szOID_RSA_messageDigest = "1.2.840.113549.1.9.4";
const char* szOID_RSA_signingTime = "1.2.840.113549.1.9.5";
const char* szOID_RSA_counterSign = "1.2.840.113549.1.9.6";
const char* szOID_RSA_challengePwd = "1.2.840.113549.1.9.7";
const char* szOID_RSA_unstructAddr = "1.2.840.113549.1.9.8";
const char* szOID_RSA_extCertAttrs = "1.2.840.113549.1.9.9";
const char* szOID_RSA_certExtensions = "1.2.840.113549.1.9.14";
const char* szOID_RSA_SMIMECapabilities = "1.2.840.113549.1.9.15";
const char* szOID_RSA_preferSignedData = "1.2.840.113549.1.9.15.1";
const char* szOID_TIMESTAMP_TOKEN = "1.2.840.113549.1.9.16.1.4";
const char* szOID_RFC3161_counterSign = "1.3.6.1.4.1.311.3.3.1";
const char* szOID_RSA_SMIMEalg = "1.2.840.113549.1.9.16.3";
const char* szOID_RSA_SMIMEalgESDH = "1.2.840.113549.1.9.16.3.5";
const char* szOID_RSA_SMIMEalgCMS3DESwrap = "1.2.840.113549.1.9.16.3.6";
const char* szOID_RSA_SMIMEalgCMSRC2wrap = "1.2.840.113549.1.9.16.3.7";
const char* szOID_RSA_MD2 = "1.2.840.113549.2.2";
const char* szOID_RSA_MD4 = "1.2.840.113549.2.4";
const char* szOID_RSA_MD5 = "1.2.840.113549.2.5";
const char* szOID_RSA_RC2CBC = "1.2.840.113549.3.2";
const char* szOID_RSA_RC4 = "1.2.840.113549.3.4";
const char* szOID_RSA_DES_EDE3_CBC = "1.2.840.113549.3.7";
const char* szOID_RSA_RC5_CBCPad = "1.2.840.113549.3.9";
const char* szOID_ANSI_X942 = "1.2.840.10046";
const char* szOID_ANSI_X942_DH = "1.2.840.10046.2.1";
const char* szOID_X957 = "1.2.840.10040";
const char* szOID_X957_DSA = "1.2.840.10040.4.1";
const char* szOID_X957_SHA1DSA = "1.2.840.10040.4.3";
const char* szOID_ECC_PUBLIC_KEY = "1.2.840.10045.2.1";
const char* szOID_ECC_CURVE_P256 = "1.2.840.10045.3.1.7";
const char* szOID_ECC_CURVE_P384 = "1.3.132.0.34";
const char* szOID_ECC_CURVE_P521 = "1.3.132.0.35";
const char* szOID_ECDSA_SHA1 = "1.2.840.10045.4.1";
const char* szOID_ECDSA_SPECIFIED = "1.2.840.10045.4.3";
const char* szOID_ECDSA_SHA256 = "1.2.840.10045.4.3.2";
const char* szOID_ECDSA_SHA384 = "1.2.840.10045.4.3.3";
const char* szOID_ECDSA_SHA512 = "1.2.840.10045.4.3.4";
const char* szOID_NIST_AES128_CBC = "2.16.840.1.101.3.4.1.2";
const char* szOID_NIST_AES192_CBC = "2.16.840.1.101.3.4.1.22";
const char* szOID_NIST_AES256_CBC = "2.16.840.1.101.3.4.1.42";
const char* szOID_NIST_AES128_WRAP = "2.16.840.1.101.3.4.1.5";
const char* szOID_NIST_AES192_WRAP = "2.16.840.1.101.3.4.1.25";
const char* szOID_NIST_AES256_WRAP = "2.16.840.1.101.3.4.1.45";
const char* szOID_DH_SINGLE_PASS_STDDH_SHA1_KDF = "1.3.133.16.840.63.0.2";
const char* szOID_DH_SINGLE_PASS_STDDH_SHA256_KDF = "1.3.132.1.11.1";
const char* szOID_DH_SINGLE_PASS_STDDH_SHA384_KDF = "1.3.132.1.11.2";
const char* szOID_DS = "2.5";
const char* szOID_DSALG = "2.5.8";
const char* szOID_DSALG_CRPT = "2.5.8.1";
const char* szOID_DSALG_HASH = "2.5.8.2";
const char* szOID_DSALG_SIGN = "2.5.8.3";
const char* szOID_DSALG_RSA = "2.5.8.1.1";
const char* szOID_OIW = "1.3.14";
const char* szOID_OIWSEC = "1.3.14.3.2";
const char* szOID_OIWSEC_md4RSA = "1.3.14.3.2.2";
const char* szOID_OIWSEC_md5RSA = "1.3.14.3.2.3";
const char* szOID_OIWSEC_md4RSA2 = "1.3.14.3.2.4";
const char* szOID_OIWSEC_desECB = "1.3.14.3.2.6";
const char* szOID_OIWSEC_desCBC = "1.3.14.3.2.7";
const char* szOID_OIWSEC_desOFB = "1.3.14.3.2.8";
const char* szOID_OIWSEC_desCFB = "1.3.14.3.2.9";
const char* szOID_OIWSEC_desMAC = "1.3.14.3.2.10";
const char* szOID_OIWSEC_rsaSign = "1.3.14.3.2.11";
const char* szOID_OIWSEC_dsa = "1.3.14.3.2.12";
const char* szOID_OIWSEC_shaDSA = "1.3.14.3.2.13";
const char* szOID_OIWSEC_mdc2RSA = "1.3.14.3.2.14";
const char* szOID_OIWSEC_shaRSA = "1.3.14.3.2.15";
const char* szOID_OIWSEC_dhCommMod = "1.3.14.3.2.16";
const char* szOID_OIWSEC_desEDE = "1.3.14.3.2.17";
const char* szOID_OIWSEC_sha = "1.3.14.3.2.18";
const char* szOID_OIWSEC_mdc2 = "1.3.14.3.2.19";
const char* szOID_OIWSEC_dsaComm = "1.3.14.3.2.20";
const char* szOID_OIWSEC_dsaCommSHA = "1.3.14.3.2.21";
const char* szOID_OIWSEC_rsaXchg = "1.3.14.3.2.22";
const char* szOID_OIWSEC_keyHashSeal = "1.3.14.3.2.23";
const char* szOID_OIWSEC_md2RSASign = "1.3.14.3.2.24";
const char* szOID_OIWSEC_md5RSASign = "1.3.14.3.2.25";
const char* szOID_OIWSEC_sha1 = "1.3.14.3.2.26";
const char* szOID_OIWSEC_dsaSHA1 = "1.3.14.3.2.27";
const char* szOID_OIWSEC_dsaCommSHA1 = "1.3.14.3.2.28";
const char* szOID_OIWSEC_sha1RSASign = "1.3.14.3.2.29";
const char* szOID_OIWDIR = "1.3.14.7.2";
const char* szOID_OIWDIR_CRPT = "1.3.14.7.2.1";
const char* szOID_OIWDIR_HASH = "1.3.14.7.2.2";
const char* szOID_OIWDIR_SIGN = "1.3.14.7.2.3";
const char* szOID_OIWDIR_md2 = "1.3.14.7.2.2.1";
const char* szOID_OIWDIR_md2RSA = "1.3.14.7.2.3.1";
const char* szOID_INFOSEC = "2.16.840.1.101.2.1";
const char* szOID_INFOSEC_sdnsSignature = "2.16.840.1.101.2.1.1.1";
const char* szOID_INFOSEC_mosaicSignature = "2.16.840.1.101.2.1.1.2";
const char* szOID_INFOSEC_sdnsConfidentiality = "2.16.840.1.101.2.1.1.3";
const char* szOID_INFOSEC_mosaicConfidentiality = "2.16.840.1.101.2.1.1.4";
const char* szOID_INFOSEC_sdnsIntegrity = "2.16.840.1.101.2.1.1.5";
const char* szOID_INFOSEC_mosaicIntegrity = "2.16.840.1.101.2.1.1.6";
const char* szOID_INFOSEC_sdnsTokenProtection = "2.16.840.1.101.2.1.1.7";
const char* szOID_INFOSEC_mosaicTokenProtection = "2.16.840.1.101.2.1.1.8";
const char* szOID_INFOSEC_sdnsKeyManagement = "2.16.840.1.101.2.1.1.9";
const char* szOID_INFOSEC_mosaicKeyManagement = "2.16.840.1.101.2.1.1.10";
const char* szOID_INFOSEC_sdnsKMandSig = "2.16.840.1.101.2.1.1.11";
const char* szOID_INFOSEC_mosaicKMandSig = "2.16.840.1.101.2.1.1.12";
const char* szOID_INFOSEC_SuiteASignature = "2.16.840.1.101.2.1.1.13";
const char* szOID_INFOSEC_SuiteAConfidentiality = "2.16.840.1.101.2.1.1.14";
const char* szOID_INFOSEC_SuiteAIntegrity = "2.16.840.1.101.2.1.1.15";
const char* szOID_INFOSEC_SuiteATokenProtection = "2.16.840.1.101.2.1.1.16";
const char* szOID_INFOSEC_SuiteAKeyManagement = "2.16.840.1.101.2.1.1.17";
const char* szOID_INFOSEC_SuiteAKMandSig = "2.16.840.1.101.2.1.1.18";
const char* szOID_INFOSEC_mosaicUpdatedSig = "2.16.840.1.101.2.1.1.19";
const char* szOID_INFOSEC_mosaicKMandUpdSig = "2.16.840.1.101.2.1.1.20";
const char* szOID_INFOSEC_mosaicUpdatedInteg = "2.16.840.1.101.2.1.1.21";
const char* szOID_NIST_sha256 = "2.16.840.1.101.3.4.2.1";
const char* szOID_NIST_sha384 = "2.16.840.1.101.3.4.2.2";
const char* szOID_NIST_sha512 = "2.16.840.1.101.3.4.2.3";

struct CRYPT_OBJID_TABLE {
	DWORD dwAlgId;
	LPCSTR pszObjId;
}
alias CRYPT_OBJID_TABLE* PCRYPT_OBJID_TABLE;

struct CRYPT_HASH_INFO {
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_HASH_BLOB Hash;
}
alias CRYPT_HASH_INFO* PCRYPT_HASH_INFO;

struct CERT_EXTENSION {
	LPSTR pszObjId;
	BOOL fCritical;
	CRYPT_OBJID_BLOB Value;
}
alias CERT_EXTENSION* PCERT_EXTENSION;
alias const(CERT_EXTENSION)* PCCERT_EXTENSION;

struct CRYPT_ATTRIBUTE_TYPE_VALUE{
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Value;
}
alias CRYPT_ATTRIBUTE_TYPE_VALUE* PCRYPT_ATTRIBUTE_TYPE_VALUE;

struct CRYPT_ATTRIBUTE {
	LPSTR pszObjId;
	DWORD cValue;
	PCRYPT_ATTR_BLOB rgValue;
}
alias CRYPT_ATTRIBUTE* PCRYPT_ATTRIBUTE;

struct CRYPT_ATTRIBUTES {
	DWORD cAttr;
	PCRYPT_ATTRIBUTE rgAttr;
}
alias CRYPT_ATTRIBUTES* PCRYPT_ATTRIBUTES;

struct CERT_RDN_ATTR {
	LPSTR pszObjId;
	DWORD dwValueType;
	CERT_RDN_VALUE_BLOB Value;
}
alias CERT_RDN_ATTR* PCERT_RDN_ATTR;

const char* szOID_COMMON_NAME = "2.5.4.3";
const char* szOID_SUR_NAME = "2.5.4.4";
const char* szOID_DEVICE_SERIAL_NUMBER = "2.5.4.5";

const char* szOID_COUNTRY_NAME = "2.5.4.6";
const char* szOID_LOCALITY_NAME = "2.5.4.7";
const char* szOID_STATE_OR_PROVINCE_NAME = "2.5.4.8";
const char* szOID_STREET_ADDRESS = "2.5.4.9";

const char* szOID_ORGANIZATION_NAME = "2.5.4.10";
const char* szOID_ORGANIZATIONAL_UNIT_NAME = "2.5.4.11";
const char* szOID_TITLE = "2.5.4.12";

const char* szOID_DESCRIPTION = "2.5.4.13";
const char* szOID_SEARCH_GUIDE = "2.5.4.14";
const char* szOID_BUSINESS_CATEGORY = "2.5.4.15";

const char* szOID_POSTAL_ADDRESS = "2.5.4.16";
const char* szOID_POSTAL_CODE = "2.5.4.17";
const char* szOID_POST_OFFICE_BOX = "2.5.4.18";
const char* szOID_PHYSICAL_DELIVERY_OFFICE_NAME = "2.5.4.19";

const char* szOID_TELEPHONE_NUMBER = "2.5.4.20";
const char* szOID_TELEX_NUMBER = "2.5.4.21";
const char* szOID_TELETEXT_TERMINAL_IDENTIFIER = "2.5.4.22";
const char* szOID_FACSIMILE_TELEPHONE_NUMBER = "2.5.4.23";
const char* szOID_X21_ADDRESS = "2.5.4.24";
const char* szOID_INTERNATIONAL_ISDN_NUMBER = "2.5.4.25";
const char* szOID_REGISTERED_ADDRESS = "2.5.4.26";
const char* szOID_DESTINATION_INDICATOR = "2.5.4.27";

const char* szOID_PREFERRED_DELIVERY_METHOD = "2.5.4.28";

const char* szOID_PRESENTATION_ADDRESS = "2.5.4.29";
const char* szOID_SUPPORTED_APPLICATION_CONTEXT = "2.5.4.30";

const char* szOID_MEMBER = "2.5.4.31";
const char* szOID_OWNER = "2.5.4.32";
const char* szOID_ROLE_OCCUPANT = "2.5.4.33";
const char* szOID_SEE_ALSO = "2.5.4.34";

const char* szOID_USER_PASSWORD = "2.5.4.35";
const char* szOID_USER_CERTIFICATE = "2.5.4.36";
const char* szOID_CA_CERTIFICATE = "2.5.4.37";
const char* szOID_AUTHORITY_REVOCATION_LIST = "2.5.4.38";
const char* szOID_CERTIFICATE_REVOCATION_LIST = "2.5.4.39";
const char* szOID_CROSS_CERTIFICATE_PAIR = "2.5.4.40";

const char* szOID_GIVEN_NAME = "2.5.4.42";
const char* szOID_INITIALS = "2.5.4.43";

const char* szOID_DN_QUALIFIER = "2.5.4.46";

const char* szOID_DOMAIN_COMPONENT = "0.9.2342.19200300.100.1.25";

const char* szOID_PKCS_12_FRIENDLY_NAME_ATTR = "1.2.840.113549.1.9.20";
const char* szOID_PKCS_12_LOCAL_KEY_ID = "1.2.840.113549.1.9.21";
const char* szOID_PKCS_12_KEY_PROVIDER_NAME_ATTR = "1.3.6.1.4.1.311.17.1";
const char* szOID_LOCAL_MACHINE_KEYSET = "1.3.6.1.4.1.311.17.2";
const char* szOID_PKCS_12_EXTENDED_ATTRIBUTES = "1.3.6.1.4.1.311.17.3";

const char* szOID_KEYID_RDN = "1.3.6.1.4.1.311.10.7.1";

const char* szOID_EV_RDN_LOCALE = "1.3.6.1.4.1.311.60.2.1.1";
const char* szOID_EV_RDN_STATE_OR_PROVINCE = "1.3.6.1.4.1.311.60.2.1.2";
const char* szOID_EV_RDN_COUNTRY = "1.3.6.1.4.1.311.60.2.1.3";

enum {
	CERT_RDN_ANY_TYPE         = 0,
	CERT_RDN_ENCODED_BLOB     = 1,
	CERT_RDN_OCTET_STRING     = 2,
	CERT_RDN_NUMERIC_STRING   = 3,
	CERT_RDN_PRINTABLE_STRING = 4,
	CERT_RDN_TELETEX_STRING   = 5,
	CERT_RDN_T61_STRING       = 5,
	CERT_RDN_VIDEOTEX_STRING  = 6,
	CERT_RDN_IA5_STRING       = 7,
	CERT_RDN_GRAPHIC_STRING   = 8,
	CERT_RDN_VISIBLE_STRING   = 9,
	CERT_RDN_ISO646_STRING    = 9,
	CERT_RDN_GENERAL_STRING   = 10,
	CERT_RDN_UNIVERSAL_STRING = 11,
	CERT_RDN_INT4_STRING      = 11,
	CERT_RDN_BMP_STRING       = 12,
	CERT_RDN_UNICODE_STRING   = 12,
	CERT_RDN_UTF8_STRING      = 13,
}

enum {
	CERT_RDN_TYPE_MASK                = 0x000000FF,
	CERT_RDN_FLAGS_MASK               = 0xFF000000,
	CERT_RDN_ENABLE_T61_UNICODE_FLAG  = 0x80000000,
	CERT_RDN_ENABLE_UTF8_UNICODE_FLAG = 0x20000000,
	CERT_RDN_FORCE_UTF8_UNICODE_FLAG  = 0x10000000,
	CERT_RDN_DISABLE_CHECK_TYPE_FLAG  = 0x40000000,
	CERT_RDN_DISABLE_IE4_UTF8_FLAG    = 0x01000000,
	CERT_RDN_ENABLE_PUNYCODE_FLAG     = 0x02000000,
}
//	IS_CERT_RDN_CHAR_STRING(X) 	 (((X) & CERT_RDN_TYPE_MASK) >= CERT_RDN_NUMERIC_STRING)

struct CERT_RDN {
	DWORD cRDNAttr;
	PCERT_RDN_ATTR rgRDNAttr;
}
alias CERT_RDN* PCERT_RDN;

struct CERT_NAME_INFO {
	DWORD cRDN;
	PCERT_RDN rgRDN;
}
alias CERT_NAME_INFO* PCERT_NAME_INFO;

struct CERT_NAME_VALUE {
	DWORD dwValueType;
	CERT_RDN_VALUE_BLOB Value;
}
alias CERT_NAME_VALUE* PCERT_NAME_VALUE;

struct CERT_PUBLIC_KEY_INFO {
	CRYPT_ALGORITHM_IDENTIFIER Algorithm;
	CRYPT_BIT_BLOB PublicKey;
}
alias CERT_PUBLIC_KEY_INFO* PCERT_PUBLIC_KEY_INFO;

alias szOID_RSA_RSA CERT_RSA_PUBLIC_KEY_OBJID;
alias szOID_RSA_RSA CERT_DEFAULT_OID_PUBLIC_KEY_SIGN;
alias szOID_RSA_RSA CERT_DEFAULT_OID_PUBLIC_KEY_XCHG;

struct CRYPT_PRIVATE_KEY_INFO {
	DWORD Version;
	CRYPT_ALGORITHM_IDENTIFIER Algorithm;
	CRYPT_DER_BLOB PrivateKey;
	PCRYPT_ATTRIBUTES pAttributes;
}
alias CRYPT_PRIVATE_KEY_INFO* PCRYPT_PRIVATE_KEY_INFO;

struct CRYPT_ENCRYPTED_PRIVATE_KEY_INFO {
	CRYPT_ALGORITHM_IDENTIFIER EncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedPrivateKey;
}
alias CRYPT_ENCRYPTED_PRIVATE_KEY_INFO* PCRYPT_ENCRYPTED_PRIVATE_KEY_INFO;

alias extern(Windows) BOOL function(CRYPT_ALGORITHM_IDENTIFIER Algorithm, CRYPT_DATA_BLOB EncryptedPrivateKey, BYTE* pbClearTextKey, DWORD* pcbClearTextKey, LPVOID pVoidDecryptFunc) PCRYPT_DECRYPT_PRIVATE_KEY_FUNC;
alias extern(Windows) BOOL function(CRYPT_ALGORITHM_IDENTIFIER* pAlgorithm, CRYPT_DATA_BLOB* pClearTextPrivateKey, BYTE* pbEncryptedKey, DWORD* pcbEncryptedKey, LPVOID pVoidEncryptFunc) PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC;
alias extern(Windows) BOOL function(CRYPT_PRIVATE_KEY_INFO* pPrivateKeyInfo, HCRYPTPROV* phCryptProv, LPVOID pVoidResolveFunc) PCRYPT_RESOLVE_HCRYPTPROV_FUNC;

struct CRYPT_PKCS8_IMPORT_PARAMS {
	CRYPT_DIGEST_BLOB PrivateKey;
	PCRYPT_RESOLVE_HCRYPTPROV_FUNC pResolvehCryptProvFunc;
	LPVOID pVoidResolveFunc;
	PCRYPT_DECRYPT_PRIVATE_KEY_FUNC pDecryptPrivateKeyFunc;
	LPVOID pVoidDecryptFunc;
}
alias CRYPT_PKCS8_IMPORT_PARAMS* PCRYPT_PKCS8_IMPORT_PARAMS;
alias CRYPT_PKCS8_IMPORT_PARAMS CRYPT_PRIVATE_KEY_BLOB_AND_PARAMS;
alias CRYPT_PRIVATE_KEY_BLOB_AND_PARAMS* PCRYPT_PRIVATE_KEY_BLOB_AND_PARAMS;

struct CRYPT_PKCS8_EXPORT_PARAMS {
	HCRYPTPROV hCryptProv;
	DWORD dwKeySpec;
	LPSTR pszPrivateKeyObjId;
	PCRYPT_ENCRYPT_PRIVATE_KEY_FUNC pEncryptPrivateKeyFunc;
	LPVOID pVoidEncryptFunc;
}
alias CRYPT_PKCS8_EXPORT_PARAMS* PCRYPT_PKCS8_EXPORT_PARAMS;

struct CERT_INFO {
	DWORD dwVersion;
	CRYPT_INTEGER_BLOB SerialNumber;
	CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
	CERT_NAME_BLOB Issuer;
	FILETIME NotBefore;
	FILETIME NotAfter;
	CERT_NAME_BLOB Subject;
	CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
	CRYPT_BIT_BLOB IssuerUniqueId;
	CRYPT_BIT_BLOB SubjectUniqueId;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CERT_INFO* PCERT_INFO;

enum {
	CERT_V1 = 0,
	CERT_V2 = 1,
	CERT_V3 = 2,
}

enum {
	CERT_INFO_VERSION_FLAG                 = 1,
	CERT_INFO_SERIAL_NUMBER_FLAG           = 2,
	CERT_INFO_SIGNATURE_ALGORITHM_FLAG     = 3,
	CERT_INFO_ISSUER_FLAG                  = 4,
	CERT_INFO_NOT_BEFORE_FLAG              = 5,
	CERT_INFO_NOT_AFTER_FLAG               = 6,
	CERT_INFO_SUBJECT_FLAG                 = 7,
	CERT_INFO_SUBJECT_PUBLIC_KEY_INFO_FLAG = 8,
	CERT_INFO_ISSUER_UNIQUE_ID_FLAG        = 9,
	CERT_INFO_SUBJECT_UNIQUE_ID_FLAG       = 10,
	CERT_INFO_EXTENSION_FLAG               = 11,
}

struct CRL_ENTRY {
	CRYPT_INTEGER_BLOB SerialNumber;
	FILETIME RevocationDate;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CRL_ENTRY* PCRL_ENTRY;

struct CRL_INFO {
	DWORD dwVersion;
	CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
	CERT_NAME_BLOB Issuer;
	FILETIME ThisUpdate;
	FILETIME NextUpdate;
	DWORD cCRLEntry;
	PCRL_ENTRY rgCRLEntry;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CRL_INFO* PCRL_INFO;

enum {
	CRL_V1 = 0,
	CRL_V2 = 1,
}

enum {
	CERT_BUNDLE_CERTIFICATE = 0,
	CERT_BUNDLE_CRL         = 1,
}

struct CERT_OR_CRL_BLOB {
	DWORD dwChoice;
	DWORD cbEncoded;
	BYTE* pbEncoded;
}
alias CERT_OR_CRL_BLOB* PCERT_OR_CRL_BLOB;

struct CERT_OR_CRL_BUNDLE {
	DWORD cItem;
	PCERT_OR_CRL_BLOB rgItem;
}
alias CERT_OR_CRL_BUNDLE* PCERT_OR_CRL_BUNDLE;

struct CERT_REQUEST_INFO {
	DWORD dwVersion;
	CERT_NAME_BLOB Subject;
	CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
	DWORD cAttribute;
	PCRYPT_ATTRIBUTE rgAttribute;
}
alias CERT_REQUEST_INFO* PCERT_REQUEST_INFO;

enum CERT_REQUEST_V1 = 0;

struct CERT_KEYGEN_REQUEST_INFO {
	DWORD dwVersion;
	CERT_PUBLIC_KEY_INFO SubjectPublicKeyInfo;
	LPWSTR pwszChallengeString;
}
alias CERT_KEYGEN_REQUEST_INFO* PCERT_KEYGEN_REQUEST_INFO;

enum CERT_KEYGEN_REQUEST_V1 = 0;

struct CERT_SIGNED_CONTENT_INFO {
	CRYPT_DER_BLOB ToBeSigned;
	CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
	CRYPT_BIT_BLOB Signature;
}
alias CERT_SIGNED_CONTENT_INFO* PCERT_SIGNED_CONTENT_INFO;

struct CTL_USAGE {
	DWORD cUsageIdentifier;
	LPSTR* rgpszUsageIdentifier;
}
alias CTL_USAGE* PCTL_USAGE;
alias CTL_USAGE CERT_ENHKEY_USAGE;
alias CERT_ENHKEY_USAGE* PCERT_ENHKEY_USAGE;
alias const(CTL_USAGE)* PCCTL_USAGE;
alias const(CERT_ENHKEY_USAGE)* PCCERT_ENHKEY_USAGE;

struct CTL_ENTRY {
	CRYPT_DATA_BLOB SubjectIdentifier;
	DWORD cAttribute;
	PCRYPT_ATTRIBUTE rgAttribute;
}
alias CTL_ENTRY* PCTL_ENTRY;

struct CTL_INFO {
	DWORD dwVersion;
	CTL_USAGE SubjectUsage;
	CRYPT_DATA_BLOB ListIdentifier;
	CRYPT_INTEGER_BLOB SequenceNumber;
	FILETIME ThisUpdate;
	FILETIME NextUpdate;
	CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm;
	DWORD cCTLEntry;
	PCTL_ENTRY rgCTLEntry;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CTL_INFO* PCTL_INFO;

enum CTL_V1 = 0;

struct CRYPT_TIME_STAMP_REQUEST_INFO {
	LPSTR pszTimeStampAlgorithm;
	LPSTR pszContentType;
	CRYPT_OBJID_BLOB Content;
	DWORD cAttribute;
	PCRYPT_ATTRIBUTE rgAttribute;
}
alias CRYPT_TIME_STAMP_REQUEST_INFO* PCRYPT_TIME_STAMP_REQUEST_INFO;

struct CRYPT_ENROLLMENT_NAME_VALUE_PAIR {
	LPWSTR pwszName;
	LPWSTR pwszValue;
}
alias CRYPT_ENROLLMENT_NAME_VALUE_PAIR* PCRYPT_ENROLLMENT_NAME_VALUE_PAIR;

struct CRYPT_CSP_PROVIDER {
	DWORD dwKeySpec;
	LPWSTR pwszProviderName;
	CRYPT_BIT_BLOB Signature;
}
alias CRYPT_CSP_PROVIDER* PCRYPT_CSP_PROVIDER;

enum {
	CERT_ENCODING_TYPE_MASK = 0x0000FFFF,
	CMSG_ENCODING_TYPE_MASK = 0xFFFF0000,
}
//	GET_CERT_ENCODING_TYPE(X) (X & CERT_ENCODING_TYPE_MASK)
//	GET_CMSG_ENCODING_TYPE(X) (X & CMSG_ENCODING_TYPE_MASK)

enum {
	CRYPT_ASN_ENCODING  = 0x00000001,
	CRYPT_NDR_ENCODING  = 0x00000002,
	X509_ASN_ENCODING   = 0x00000001,
	X509_NDR_ENCODING   = 0x00000002,
	PKCS_7_ASN_ENCODING = 0x00010000,
	PKCS_7_NDR_ENCODING = 0x00020000,
}

export extern(Windows) BOOL CryptFormatObject(DWORD dwCertEncodingType, DWORD dwFormatType, DWORD dwFormatStrType, void* pFormatStruct, LPCSTR lpszStructType, const(BYTE)* pbEncoded, DWORD cbEncoded, void* pbFormat, DWORD* pcbFormat);

enum {
	CRYPT_FORMAT_STR_MULTI_LINE = 0x0001,
	CRYPT_FORMAT_STR_NO_HEX     = 0x0010,
	CRYPT_FORMAT_SIMPLE         = 0x0001,
	CRYPT_FORMAT_X509           = 0x0002,
	CRYPT_FORMAT_OID            = 0x0004,
	CRYPT_FORMAT_RDN_SEMICOLON  = 0x0100,
	CRYPT_FORMAT_RDN_CRLF       = 0x0200,
	CRYPT_FORMAT_RDN_UNQUOTE    = 0x0400,
	CRYPT_FORMAT_RDN_REVERSE    = 0x0800,
	CRYPT_FORMAT_COMMA          = 0x1000,
	CRYPT_FORMAT_SEMICOLON      = CRYPT_FORMAT_RDN_SEMICOLON,
	CRYPT_FORMAT_CRLF           = CRYPT_FORMAT_RDN_CRLF,
}

alias extern(Windows) LPVOID function(size_t cbSize) PFN_CRYPT_ALLOC;
alias extern(Windows) VOID function(LPVOID pv) PFN_CRYPT_FREE;

struct CRYPT_ENCODE_PARA {
	DWORD cbSize;
	PFN_CRYPT_ALLOC pfnAlloc;
	PFN_CRYPT_FREE pfnFree;
}
alias CRYPT_ENCODE_PARA* PCRYPT_ENCODE_PARA;

export extern(Windows) BOOL CryptEncodeObjectEx(DWORD dwCertEncodingType, LPCSTR lpszStructType, const(void)* pvStructInfo, DWORD dwFlags, PCRYPT_ENCODE_PARA pEncodePara, void* pvEncoded, DWORD* pcbEncoded);
export extern(Windows) BOOL CryptEncodeObject(DWORD dwCertEncodingType, LPCSTR lpszStructType, const(void)* pvStructInfo, BYTE* pbEncoded, DWORD* pcbEncoded);

enum {
	CRYPT_ENCODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG           = 0x8,
	CRYPT_ENCODE_ALLOC_FLAG                                = 0x8000,
	CRYPT_UNICODE_NAME_ENCODE_ENABLE_T61_UNICODE_FLAG      = CERT_RDN_ENABLE_T61_UNICODE_FLAG,
	CRYPT_UNICODE_NAME_ENCODE_ENABLE_UTF8_UNICODE_FLAG     = CERT_RDN_ENABLE_UTF8_UNICODE_FLAG,
	CRYPT_UNICODE_NAME_ENCODE_FORCE_UTF8_UNICODE_FLAG      = CERT_RDN_FORCE_UTF8_UNICODE_FLAG,
	CRYPT_UNICODE_NAME_ENCODE_DISABLE_CHECK_TYPE_FLAG      = CERT_RDN_DISABLE_CHECK_TYPE_FLAG,
	CRYPT_SORTED_CTL_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x10000,
	CRYPT_ENCODE_ENABLE_PUNYCODE_FLAG                      = 0x20000,
}

struct CRYPT_DECODE_PARA {
	DWORD cbSize;
	PFN_CRYPT_ALLOC pfnAlloc;
	PFN_CRYPT_FREE pfnFree;
}
alias CRYPT_DECODE_PARA* PCRYPT_DECODE_PARA;

export extern(Windows) BOOL CryptDecodeObjectEx(DWORD dwCertEncodingType, LPCSTR lpszStructType, const(BYTE)* pbEncoded, DWORD cbEncoded, DWORD dwFlags, PCRYPT_DECODE_PARA pDecodePara, void* pvStructInfo, DWORD* pcbStructInfo);
export extern(Windows) BOOL CryptDecodeObject(DWORD dwCertEncodingType, LPCSTR lpszStructType, const(BYTE)* pbEncoded, DWORD cbEncoded, DWORD dwFlags, void* pvStructInfo, DWORD* pcbStructInfo);

enum {
	CRYPT_DECODE_NOCOPY_FLAG                        = 0x1,
	CRYPT_DECODE_TO_BE_SIGNED_FLAG                  = 0x2,
	CRYPT_DECODE_SHARE_OID_STRING_FLAG              = 0x4,
	CRYPT_DECODE_NO_SIGNATURE_BYTE_REVERSAL_FLAG    = 0x8,
	CRYPT_DECODE_ALLOC_FLAG                         = 0x8000,
	CRYPT_UNICODE_NAME_DECODE_DISABLE_IE4_UTF8_FLAG = CERT_RDN_DISABLE_IE4_UTF8_FLAG,
	CRYPT_DECODE_ENABLE_PUNYCODE_FLAG               = 0x02000000,
	CRYPT_ENCODE_DECODE_NONE                        = 0,
}

const LPCSTR X509_CERT = cast(LPCSTR)1;
const LPCSTR X509_CERT_TO_BE_SIGNED = cast(LPCSTR)2;
const LPCSTR X509_CERT_CRL_TO_BE_SIGNED = cast(LPCSTR)3;
const LPCSTR X509_CERT_REQUEST_TO_BE_SIGNED = cast(LPCSTR)4;
const LPCSTR X509_EXTENSIONS = cast(LPCSTR)5;
const LPCSTR X509_NAME_VALUE = cast(LPCSTR)6;
const LPCSTR X509_NAME = cast(LPCSTR)7;
const LPCSTR X509_PUBLIC_KEY_INFO = cast(LPCSTR)8;
const LPCSTR X509_AUTHORITY_KEY_ID = cast(LPCSTR)9;
const LPCSTR X509_KEY_ATTRIBUTES = cast(LPCSTR)10;
const LPCSTR X509_KEY_USAGE_RESTRICTION = cast(LPCSTR)11;
const LPCSTR X509_ALTERNATE_NAME = cast(LPCSTR)12;
const LPCSTR X509_BASIC_CONSTRAINTS = cast(LPCSTR)13;
const LPCSTR X509_KEY_USAGE = cast(LPCSTR)14;
const LPCSTR X509_BASIC_CONSTRAINTS2 = cast(LPCSTR)15;
const LPCSTR X509_CERT_POLICIES = cast(LPCSTR)16;
const LPCSTR PKCS_UTC_TIME = cast(LPCSTR)17;
const LPCSTR PKCS_TIME_REQUEST = cast(LPCSTR)18;
const LPCSTR RSA_CSP_PUBLICKEYBLOB = cast(LPCSTR)19;
const LPCSTR X509_UNICODE_NAME = cast(LPCSTR)20;
const LPCSTR X509_KEYGEN_REQUEST_TO_BE_SIGNED = cast(LPCSTR)21;
const LPCSTR PKCS_ATTRIBUTE = cast(LPCSTR)22;
const LPCSTR PKCS_CONTENT_INFO_SEQUENCE_OF_ANY = cast(LPCSTR)23;
const LPCSTR X509_UNICODE_NAME_VALUE = cast(LPCSTR)24;
alias X509_NAME_VALUE X509_ANY_STRING;
alias X509_UNICODE_NAME_VALUE X509_UNICODE_ANY_STRING;
const LPCSTR X509_OCTET_STRING = cast(LPCSTR)25;
const LPCSTR X509_BITS = cast(LPCSTR)26;
const LPCSTR X509_INTEGER = cast(LPCSTR)27;
const LPCSTR X509_MULTI_BYTE_INTEGER = cast(LPCSTR)28;
const LPCSTR X509_ENUMERATED = cast(LPCSTR)29;
const LPCSTR X509_CHOICE_OF_TIME = cast(LPCSTR)30;
const LPCSTR X509_AUTHORITY_KEY_ID2 = cast(LPCSTR)31;
const LPCSTR X509_AUTHORITY_INFO_ACCESS = cast(LPCSTR)32;
alias X509_AUTHORITY_INFO_ACCESS X509_SUBJECT_INFO_ACCESS;
alias X509_ENUMERATED X509_CRL_REASON_CODE;
const LPCSTR PKCS_CONTENT_INFO = cast(LPCSTR)33;
const LPCSTR X509_SEQUENCE_OF_ANY = cast(LPCSTR)34;
const LPCSTR X509_CRL_DIST_POINTS = cast(LPCSTR)35;
const LPCSTR X509_ENHANCED_KEY_USAGE = cast(LPCSTR)36;
const LPCSTR PKCS_CTL = cast(LPCSTR)37;
const LPCSTR X509_MULTI_BYTE_UINT = cast(LPCSTR)38;
alias X509_MULTI_BYTE_UINT X509_DSS_PUBLICKEY;
const LPCSTR X509_DSS_PARAMETERS = cast(LPCSTR)39;
const LPCSTR X509_DSS_SIGNATURE = cast(LPCSTR)40;
const LPCSTR PKCS_RC2_CBC_PARAMETERS = cast(LPCSTR)41;
const LPCSTR PKCS_SMIME_CAPABILITIES = cast(LPCSTR)42;
const LPCSTR X509_QC_STATEMENTS_EXT = cast(LPCSTR)42;
const LPCSTR PKCS_RSA_PRIVATE_KEY = cast(LPCSTR)43;
const LPCSTR PKCS_PRIVATE_KEY_INFO = cast(LPCSTR)44;
const LPCSTR PKCS_ENCRYPTED_PRIVATE_KEY_INFO = cast(LPCSTR)45;
const LPCSTR X509_PKIX_POLICY_QUALIFIER_USERNOTICE = cast(LPCSTR)46;
alias X509_MULTI_BYTE_UINT X509_DH_PUBLICKEY;
const LPCSTR X509_DH_PARAMETERS = cast(LPCSTR)47;
const LPCSTR PKCS_ATTRIBUTES = cast(LPCSTR)48;
const LPCSTR PKCS_SORTED_CTL = cast(LPCSTR)49;
const LPCSTR X509_ECC_SIGNATURE = cast(LPCSTR)47;
const LPCSTR X942_DH_PARAMETERS = cast(LPCSTR)50;
const LPCSTR X509_BITS_WITHOUT_TRAILING_ZEROES = cast(LPCSTR)51;
const LPCSTR X942_OTHER_INFO = cast(LPCSTR)52;
const LPCSTR X509_CERT_PAIR = cast(LPCSTR)53;
const LPCSTR X509_ISSUING_DIST_POINT = cast(LPCSTR)54;
const LPCSTR X509_NAME_CONSTRAINTS = cast(LPCSTR)55;
const LPCSTR X509_POLICY_MAPPINGS = cast(LPCSTR)56;
const LPCSTR X509_POLICY_CONSTRAINTS = cast(LPCSTR)57;
const LPCSTR X509_CROSS_CERT_DIST_POINTS = cast(LPCSTR)58;
const LPCSTR CMC_DATA = cast(LPCSTR)59;
const LPCSTR CMC_RESPONSE = cast(LPCSTR)60;
const LPCSTR CMC_STATUS = cast(LPCSTR)61;
const LPCSTR CMC_ADD_EXTENSIONS = cast(LPCSTR)62;
const LPCSTR CMC_ADD_ATTRIBUTES = cast(LPCSTR)63;
const LPCSTR X509_CERTIFICATE_TEMPLATE = cast(LPCSTR)64;
const LPCSTR OCSP_SIGNED_REQUEST = cast(LPCSTR)65;
const LPCSTR OCSP_REQUEST = cast(LPCSTR)66;
const LPCSTR OCSP_RESPONSE = cast(LPCSTR)67;
const LPCSTR OCSP_BASIC_SIGNED_RESPONSE = cast(LPCSTR)68;
const LPCSTR OCSP_BASIC_RESPONSE = cast(LPCSTR)69;
const LPCSTR X509_LOGOTYPE_EXT = cast(LPCSTR)70;
const LPCSTR X509_BIOMETRIC_EXT = cast(LPCSTR)71;
const LPCSTR CNG_RSA_PUBLIC_KEY_BLOB = cast(LPCSTR)72;
const LPCSTR X509_OBJECT_IDENTIFIER = cast(LPCSTR)73;
const LPCSTR X509_ALGORITHM_IDENTIFIER = cast(LPCSTR)74;
const LPCSTR PKCS_RSA_SSA_PSS_PARAMETERS = cast(LPCSTR)75;
const LPCSTR PKCS_RSAES_OAEP_PARAMETERS = cast(LPCSTR)76;
const LPCSTR ECC_CMS_SHARED_INFO = cast(LPCSTR)77;
const LPCSTR TIMESTAMP_REQUEST = cast(LPCSTR)78;
const LPCSTR TIMESTAMP_RESPONSE = cast(LPCSTR)79;
const LPCSTR TIMESTAMP_INFO = cast(LPCSTR)80;
const LPCSTR X509_CERT_BUNDLE = cast(LPCSTR)81;
const LPCSTR PKCS7_SIGNER_INFO = cast(LPCSTR)500;
const LPCSTR CMS_SIGNER_INFO = cast(LPCSTR)501;

const char* szOID_AUTHORITY_KEY_IDENTIFIER = "2.5.29.1";
const char* szOID_KEY_ATTRIBUTES = "2.5.29.2";
const char* szOID_CERT_POLICIES_95 = "2.5.29.3";
const char* szOID_KEY_USAGE_RESTRICTION = "2.5.29.4";
const char* szOID_SUBJECT_ALT_NAME = "2.5.29.7";
const char* szOID_ISSUER_ALT_NAME = "2.5.29.8";
const char* szOID_BASIC_CONSTRAINTS = "2.5.29.10";
const char* szOID_KEY_USAGE = "2.5.29.15";
const char* szOID_PRIVATEKEY_USAGE_PERIOD = "2.5.29.16";
const char* szOID_BASIC_CONSTRAINTS2 = "2.5.29.19";
const char* szOID_CERT_POLICIES = "2.5.29.32";
const char* szOID_ANY_CERT_POLICY = "2.5.29.32.0";
const char* szOID_INHIBIT_ANY_POLICY = "2.5.29.54";
const char* szOID_AUTHORITY_KEY_IDENTIFIER2 = "2.5.29.35";
const char* szOID_SUBJECT_KEY_IDENTIFIER = "2.5.29.14";
const char* szOID_SUBJECT_ALT_NAME2 = "2.5.29.17";
const char* szOID_ISSUER_ALT_NAME2 = "2.5.29.18";
const char* szOID_CRL_REASON_CODE = "2.5.29.21";
const char* szOID_REASON_CODE_HOLD = "2.5.29.23";
const char* szOID_CRL_DIST_POINTS = "2.5.29.31";
const char* szOID_ENHANCED_KEY_USAGE = "2.5.29.37";
const char* szOID_ANY_ENHANCED_KEY_USAGE = "2.5.29.37.0";
const char* szOID_CRL_NUMBER = "2.5.29.20";
const char* szOID_DELTA_CRL_INDICATOR = "2.5.29.27";
const char* szOID_ISSUING_DIST_POINT = "2.5.29.28";
const char* szOID_FRESHEST_CRL = "2.5.29.46";
const char* szOID_NAME_CONSTRAINTS = "2.5.29.30";
const char* szOID_POLICY_MAPPINGS = "2.5.29.33";
const char* szOID_LEGACY_POLICY_MAPPINGS = "2.5.29.5";
const char* szOID_POLICY_CONSTRAINTS = "2.5.29.36";
const char* szOID_RENEWAL_CERTIFICATE = "1.3.6.1.4.1.311.13.1";
const char* szOID_ENROLLMENT_NAME_VALUE_PAIR = "1.3.6.1.4.1.311.13.2.1";
const char* szOID_ENROLLMENT_CSP_PROVIDER = "1.3.6.1.4.1.311.13.2.2";
const char* szOID_OS_VERSION = "1.3.6.1.4.1.311.13.2.3";
const char* szOID_ENROLLMENT_AGENT = "1.3.6.1.4.1.311.20.2.1";
const char* szOID_PKIX = "1.3.6.1.5.5.7";
const char* szOID_PKIX_PE = "1.3.6.1.5.5.7.1";
const char* szOID_AUTHORITY_INFO_ACCESS = "1.3.6.1.5.5.7.1.1";
const char* szOID_SUBJECT_INFO_ACCESS = "1.3.6.1.5.5.7.1.11";
const char* szOID_BIOMETRIC_EXT = "1.3.6.1.5.5.7.1.2";
const char* szOID_QC_STATEMENTS_EXT = "1.3.6.1.5.5.7.1.3";
const char* szOID_LOGOTYPE_EXT = "1.3.6.1.5.5.7.1.12";
const char* szOID_CERT_EXTENSIONS = "1.3.6.1.4.1.311.2.1.14";
const char* szOID_NEXT_UPDATE_LOCATION = "1.3.6.1.4.1.311.10.2";
const char* szOID_REMOVE_CERTIFICATE = "1.3.6.1.4.1.311.10.8.1";
const char* szOID_CROSS_CERT_DIST_POINTS = "1.3.6.1.4.1.311.10.9.1";
const char* szOID_CTL = "1.3.6.1.4.1.311.10.1";
const char* szOID_SORTED_CTL = "1.3.6.1.4.1.311.10.1.1";
const char* szOID_SERIALIZED = "1.3.6.1.4.1.311.10.3.3.1";
const char* szOID_NT_PRINCIPAL_NAME = "1.3.6.1.4.1.311.20.2.3";
const char* szOID_PRODUCT_UPDATE = "1.3.6.1.4.1.311.31.1";
const char* szOID_ANY_APPLICATION_POLICY = "1.3.6.1.4.1.311.10.12.1";
const char* szOID_AUTO_ENROLL_CTL_USAGE = "1.3.6.1.4.1.311.20.1";
const char* szOID_ENROLL_CERTTYPE_EXTENSION = "1.3.6.1.4.1.311.20.2";
const char* szOID_CERT_MANIFOLD = "1.3.6.1.4.1.311.20.3";
const char* szOID_CERTSRV_CA_VERSION = "1.3.6.1.4.1.311.21.1";
const char* szOID_CERTSRV_PREVIOUS_CERT_HASH = "1.3.6.1.4.1.311.21.2";
const char* szOID_CRL_VIRTUAL_BASE = "1.3.6.1.4.1.311.21.3";
const char* szOID_CRL_NEXT_PUBLISH = "1.3.6.1.4.1.311.21.4";
const char* szOID_KP_CA_EXCHANGE = "1.3.6.1.4.1.311.21.5";
const char* szOID_KP_KEY_RECOVERY_AGENT = "1.3.6.1.4.1.311.21.6";
const char* szOID_CERTIFICATE_TEMPLATE = "1.3.6.1.4.1.311.21.7";
const char* szOID_ENTERPRISE_OID_ROOT = "1.3.6.1.4.1.311.21.8";
const char* szOID_RDN_DUMMY_SIGNER = "1.3.6.1.4.1.311.21.9";
const char* szOID_APPLICATION_CERT_POLICIES = "1.3.6.1.4.1.311.21.10";
const char* szOID_APPLICATION_POLICY_MAPPINGS = "1.3.6.1.4.1.311.21.11";
const char* szOID_APPLICATION_POLICY_CONSTRAINTS = "1.3.6.1.4.1.311.21.12";
const char* szOID_ARCHIVED_KEY_ATTR = "1.3.6.1.4.1.311.21.13";
const char* szOID_CRL_SELF_CDP = "1.3.6.1.4.1.311.21.14";
const char* szOID_REQUIRE_CERT_CHAIN_POLICY = "1.3.6.1.4.1.311.21.15";
const char* szOID_ARCHIVED_KEY_CERT_HASH = "1.3.6.1.4.1.311.21.16";
const char* szOID_ISSUED_CERT_HASH = "1.3.6.1.4.1.311.21.17";
const char* szOID_DS_EMAIL_REPLICATION = "1.3.6.1.4.1.311.21.19";
const char* szOID_REQUEST_CLIENT_INFO = "1.3.6.1.4.1.311.21.20";
const char* szOID_ENCRYPTED_KEY_HASH = "1.3.6.1.4.1.311.21.21";
const char* szOID_CERTSRV_CROSSCA_VERSION = "1.3.6.1.4.1.311.21.22";
const char* szOID_NTDS_REPLICATION = "1.3.6.1.4.1.311.25.1";
const char* szOID_SUBJECT_DIR_ATTRS = "2.5.29.9";
const char* szOID_PKIX_KP = "1.3.6.1.5.5.7.3";
const char* szOID_PKIX_KP_SERVER_AUTH = "1.3.6.1.5.5.7.3.1";
const char* szOID_PKIX_KP_CLIENT_AUTH = "1.3.6.1.5.5.7.3.2";
const char* szOID_PKIX_KP_CODE_SIGNING = "1.3.6.1.5.5.7.3.3";
const char* szOID_PKIX_KP_EMAIL_PROTECTION = "1.3.6.1.5.5.7.3.4";
const char* szOID_PKIX_KP_IPSEC_END_SYSTEM = "1.3.6.1.5.5.7.3.5";
const char* szOID_PKIX_KP_IPSEC_TUNNEL = "1.3.6.1.5.5.7.3.6";
const char* szOID_PKIX_KP_IPSEC_USER = "1.3.6.1.5.5.7.3.7";
const char* szOID_PKIX_KP_TIMESTAMP_SIGNING = "1.3.6.1.5.5.7.3.8";
const char* szOID_PKIX_KP_OCSP_SIGNING = "1.3.6.1.5.5.7.3.9";
const char* szOID_PKIX_OCSP_NOCHECK = "1.3.6.1.5.5.7.48.1.5";
const char* szOID_PKIX_OCSP_NONCE = "1.3.6.1.5.5.7.48.1.2";
const char* szOID_IPSEC_KP_IKE_INTERMEDIATE = "1.3.6.1.5.5.8.2.2";
const char* szOID_PKINIT_KP_KDC = "1.3.6.1.5.2.3.5";
const char* szOID_KP_CTL_USAGE_SIGNING = "1.3.6.1.4.1.311.10.3.1";
const char* szOID_KP_TIME_STAMP_SIGNING = "1.3.6.1.4.1.311.10.3.2";
const char* szOID_SERVER_GATED_CRYPTO = "1.3.6.1.4.1.311.10.3.3";
const char* szOID_SGC_NETSCAPE = "2.16.840.1.113730.4.1";
const char* szOID_KP_EFS = "1.3.6.1.4.1.311.10.3.4";
const char* szOID_EFS_RECOVERY = "1.3.6.1.4.1.311.10.3.4.1";
const char* szOID_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.5";
const char* szOID_NT5_CRYPTO = "1.3.6.1.4.1.311.10.3.6";
const char* szOID_OEM_WHQL_CRYPTO = "1.3.6.1.4.1.311.10.3.7";
const char* szOID_EMBEDDED_NT_CRYPTO = "1.3.6.1.4.1.311.10.3.8";
const char* szOID_ROOT_LIST_SIGNER = "1.3.6.1.4.1.311.10.3.9";
const char* szOID_KP_QUALIFIED_SUBORDINATION = "1.3.6.1.4.1.311.10.3.10";
const char* szOID_KP_KEY_RECOVERY = "1.3.6.1.4.1.311.10.3.11";
const char* szOID_KP_DOCUMENT_SIGNING = "1.3.6.1.4.1.311.10.3.12";
const char* szOID_KP_LIFETIME_SIGNING = "1.3.6.1.4.1.311.10.3.13";
const char* szOID_KP_MOBILE_DEVICE_SOFTWARE = "1.3.6.1.4.1.311.10.3.14";
const char* szOID_KP_SMART_DISPLAY = "1.3.6.1.4.1.311.10.3.15";
const char* szOID_KP_CSP_SIGNATURE = "1.3.6.1.4.1.311.10.3.16";
const char* szOID_DRM = "1.3.6.1.4.1.311.10.5.1";
const char* szOID_DRM_INDIVIDUALIZATION = "1.3.6.1.4.1.311.10.5.2";
const char* szOID_LICENSES = "1.3.6.1.4.1.311.10.6.1";
const char* szOID_LICENSE_SERVER = "1.3.6.1.4.1.311.10.6.2";
const char* szOID_KP_SMARTCARD_LOGON = "1.3.6.1.4.1.311.20.2.2";
const char* szOID_KP_KERNEL_MODE_CODE_SIGNING = "1.3.6.1.4.1.311.61.1.1";
const char* szOID_REVOKED_LIST_SIGNER = "1.3.6.1.4.1.311.10.3.19";
const char* szOID_YESNO_TRUST_ATTR = "1.3.6.1.4.1.311.10.4.1";
const char* szOID_PKIX_POLICY_QUALIFIER_CPS = "1.3.6.1.5.5.7.2.1";
const char* szOID_PKIX_POLICY_QUALIFIER_USERNOTICE = "1.3.6.1.5.5.7.2.2";
const char* szOID_ROOT_PROGRAM_FLAGS = "1.3.6.1.4.1.311.60.1.1";
enum {
	CERT_ROOT_PROGRAM_FLAG_ORG          = 0x80,
	CERT_ROOT_PROGRAM_FLAG_LSC          = 0x40,
	CERT_ROOT_PROGRAM_FLAG_SUBJECT_LOGO = 0x20,
	CERT_ROOT_PROGRAM_FLAG_OU           = 0x10,
	CERT_ROOT_PROGRAM_FLAG_ADDRESS      = 0x08,
}
const char* szOID_CERT_POLICIES_95_QUALIFIER1 = "2.16.840.1.113733.1.7.1.1";

struct CERT_EXTENSIONS {
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CERT_EXTENSIONS* PCERT_EXTENSIONS;

enum {
	CERT_UNICODE_RDN_ERR_INDEX_MASK    = 0x3FF,
	CERT_UNICODE_RDN_ERR_INDEX_SHIFT   = 22,
	CERT_UNICODE_ATTR_ERR_INDEX_MASK   = 0x003F,
	CERT_UNICODE_ATTR_ERR_INDEX_SHIFT  = 16,
	CERT_UNICODE_VALUE_ERR_INDEX_MASK  = 0x0000FFFF,
	CERT_UNICODE_VALUE_ERR_INDEX_SHIFT = 0,
}

//	GET_CERT_UNICODE_RDN_ERR_INDEX(X) 	 ((X >> CERT_UNICODE_RDN_ERR_INDEX_SHIFT) & CERT_UNICODE_RDN_ERR_INDEX_MASK)
//	GET_CERT_UNICODE_ATTR_ERR_INDEX(X) 	 ((X >> CERT_UNICODE_ATTR_ERR_INDEX_SHIFT) & CERT_UNICODE_ATTR_ERR_INDEX_MASK)
//	GET_CERT_UNICODE_VALUE_ERR_INDEX(X) 	 (X & CERT_UNICODE_VALUE_ERR_INDEX_MASK)

struct CERT_AUTHORITY_KEY_ID_INFO {
	CRYPT_DATA_BLOB KeyId;
	CERT_NAME_BLOB CertIssuer;
	CRYPT_INTEGER_BLOB CertSerialNumber;
}
alias CERT_AUTHORITY_KEY_ID_INFO* PCERT_AUTHORITY_KEY_ID_INFO;

struct CERT_PRIVATE_KEY_VALIDITY {
	FILETIME NotBefore;
	FILETIME NotAfter;
}
alias CERT_PRIVATE_KEY_VALIDITY* PCERT_PRIVATE_KEY_VALIDITY;

struct CERT_KEY_ATTRIBUTES_INFO {
	CRYPT_DATA_BLOB KeyId;
	CRYPT_BIT_BLOB IntendedKeyUsage;
	PCERT_PRIVATE_KEY_VALIDITY pPrivateKeyUsagePeriod;
}
alias CERT_KEY_ATTRIBUTES_INFO* PCERT_KEY_ATTRIBUTES_INFO;

enum {
	CERT_DIGITAL_SIGNATURE_KEY_USAGE = 0x80,
	CERT_NON_REPUDIATION_KEY_USAGE   = 0x40,
	CERT_KEY_ENCIPHERMENT_KEY_USAGE  = 0x20,
	CERT_DATA_ENCIPHERMENT_KEY_USAGE = 0x10,
	CERT_KEY_AGREEMENT_KEY_USAGE     = 0x08,
	CERT_KEY_CERT_SIGN_KEY_USAGE     = 0x04,
	CERT_OFFLINE_CRL_SIGN_KEY_USAGE  = 0x02,
	CERT_CRL_SIGN_KEY_USAGE          = 0x02,
	CERT_ENCIPHER_ONLY_KEY_USAGE     = 0x01,
	CERT_DECIPHER_ONLY_KEY_USAGE     = 0x80,
}

struct CERT_POLICY_ID {
	DWORD cCertPolicyElementId;
	LPSTR* rgpszCertPolicyElementId;
}
alias CERT_POLICY_ID* PCERT_POLICY_ID;

struct CERT_KEY_USAGE_RESTRICTION_INFO {
	DWORD cCertPolicyId;
	PCERT_POLICY_ID rgCertPolicyId;
	CRYPT_BIT_BLOB RestrictedKeyUsage;
}
alias CERT_KEY_USAGE_RESTRICTION_INFO* PCERT_KEY_USAGE_RESTRICTION_INFO;

struct CERT_OTHER_NAME {
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Value;
}
alias CERT_OTHER_NAME* PCERT_OTHER_NAME;

struct CERT_ALT_NAME_ENTRY {
	DWORD dwAltNameChoice;
	union {
		PCERT_OTHER_NAME pOtherName;
		LPWSTR pwszRfc822Name;
		LPWSTR pwszDNSName;
		CERT_NAME_BLOB DirectoryName;
		LPWSTR pwszURL;
		CRYPT_DATA_BLOB IPAddress;
		LPSTR pszRegisteredID;
	}
}
alias CERT_ALT_NAME_ENTRY* PCERT_ALT_NAME_ENTRY;

enum {
	CERT_ALT_NAME_OTHER_NAME     = 1,
	CERT_ALT_NAME_RFC822_NAME    = 2,
	CERT_ALT_NAME_DNS_NAME       = 3,
	CERT_ALT_NAME_X400_ADDRESS   = 4,
	CERT_ALT_NAME_DIRECTORY_NAME = 5,
	CERT_ALT_NAME_EDI_PARTY_NAME = 6,
	CERT_ALT_NAME_URL            = 7,
	CERT_ALT_NAME_IP_ADDRESS     = 8,
	CERT_ALT_NAME_REGISTERED_ID  = 9,
}

struct CERT_ALT_NAME_INFO {
	DWORD cAltEntry;
	PCERT_ALT_NAME_ENTRY rgAltEntry;
}
alias CERT_ALT_NAME_INFO* PCERT_ALT_NAME_INFO;

enum {
	CERT_ALT_NAME_ENTRY_ERR_INDEX_MASK  = 0xFF,
	CERT_ALT_NAME_ENTRY_ERR_INDEX_SHIFT = 16,
	CERT_ALT_NAME_VALUE_ERR_INDEX_MASK  = 0x0000FFFF,
	CERT_ALT_NAME_VALUE_ERR_INDEX_SHIFT = 0,
}
//	GET_CERT_ALT_NAME_ENTRY_ERR_INDEX(X) 	 ((X >> CERT_ALT_NAME_ENTRY_ERR_INDEX_SHIFT) & 	 CERT_ALT_NAME_ENTRY_ERR_INDEX_MASK)
//	GET_CERT_ALT_NAME_VALUE_ERR_INDEX(X) 	 (X & CERT_ALT_NAME_VALUE_ERR_INDEX_MASK)

struct CERT_BASIC_CONSTRAINTS_INFO {
	CRYPT_BIT_BLOB SubjectType;
	BOOL fPathLenConstraint;
	DWORD dwPathLenConstraint;
	DWORD cSubtreesConstraint;
	CERT_NAME_BLOB* rgSubtreesConstraint;
}
alias CERT_BASIC_CONSTRAINTS_INFO* PCERT_BASIC_CONSTRAINTS_INFO;

enum {
	CERT_CA_SUBJECT_FLAG         = 0x80,
	CERT_END_ENTITY_SUBJECT_FLAG = 0x40,
}

struct CERT_BASIC_CONSTRAINTS2_INFO {
	BOOL fCA;
	BOOL fPathLenConstraint;
	DWORD dwPathLenConstraint;
}
alias CERT_BASIC_CONSTRAINTS2_INFO* PCERT_BASIC_CONSTRAINTS2_INFO;

struct CERT_POLICY_QUALIFIER_INFO {
	LPSTR pszPolicyQualifierId;
	CRYPT_OBJID_BLOB Qualifier;
}
alias CERT_POLICY_QUALIFIER_INFO* PCERT_POLICY_QUALIFIER_INFO;

struct CERT_POLICY_INFO {
	LPSTR pszPolicyIdentifier;
	DWORD cPolicyQualifier;
	CERT_POLICY_QUALIFIER_INFO* rgPolicyQualifier;
}
alias CERT_POLICY_INFO* PCERT_POLICY_INFO;

struct CERT_POLICIES_INFO {
	DWORD cPolicyInfo;
	CERT_POLICY_INFO* rgPolicyInfo;
}
alias CERT_POLICIES_INFO* PCERT_POLICIES_INFO;

struct CERT_POLICY_QUALIFIER_NOTICE_REFERENCE {
	LPSTR pszOrganization;
	DWORD cNoticeNumbers;
	int* rgNoticeNumbers;
}
alias CERT_POLICY_QUALIFIER_NOTICE_REFERENCE* PCERT_POLICY_QUALIFIER_NOTICE_REFERENCE;

struct CERT_POLICY_QUALIFIER_USER_NOTICE {
	CERT_POLICY_QUALIFIER_NOTICE_REFERENCE* pNoticeReference;
	LPWSTR pszDisplayText;
}
alias CERT_POLICY_QUALIFIER_USER_NOTICE* PCERT_POLICY_QUALIFIER_USER_NOTICE;

struct CPS_URLS {
	LPWSTR pszURL;
	CRYPT_ALGORITHM_IDENTIFIER* pAlgorithm;
	CRYPT_DATA_BLOB* pDigest;
}
alias CPS_URLS* PCPS_URLS;

struct CERT_POLICY95_QUALIFIER1 {
	LPWSTR pszPracticesReference;
	LPSTR pszNoticeIdentifier;
	LPSTR pszNSINoticeIdentifier;
	DWORD cCPSURLs;
	CPS_URLS* rgCPSURLs;
}
alias CERT_POLICY95_QUALIFIER1* PCERT_POLICY95_QUALIFIER1;

struct CERT_POLICY_MAPPING {
	LPSTR pszIssuerDomainPolicy;
	LPSTR pszSubjectDomainPolicy;
}
alias CERT_POLICY_MAPPING* PCERT_POLICY_MAPPING;

struct CERT_POLICY_MAPPINGS_INFO {
	DWORD cPolicyMapping;
	PCERT_POLICY_MAPPING rgPolicyMapping;
}
alias CERT_POLICY_MAPPINGS_INFO* PCERT_POLICY_MAPPINGS_INFO;

struct CERT_POLICY_CONSTRAINTS_INFO {
	BOOL fRequireExplicitPolicy;
	DWORD dwRequireExplicitPolicySkipCerts;
	BOOL fInhibitPolicyMapping;
	DWORD dwInhibitPolicyMappingSkipCerts;
}
alias CERT_POLICY_CONSTRAINTS_INFO* PCERT_POLICY_CONSTRAINTS_INFO;

struct CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY {
	LPSTR pszObjId;
	DWORD cValue;
	PCRYPT_DER_BLOB rgValue;
}
alias CRYPT_CONTENT_INFO_SEQUENCE_OF_ANY* PCRYPT_CONTENT_INFO_SEQUENCE_OF_ANY;

struct CRYPT_CONTENT_INFO {
	LPSTR pszObjId;
	CRYPT_DER_BLOB Content;
}
alias CRYPT_CONTENT_INFO* PCRYPT_CONTENT_INFO;

struct CRYPT_SEQUENCE_OF_ANY {
	DWORD cValue;
	PCRYPT_DER_BLOB rgValue;
}
alias CRYPT_SEQUENCE_OF_ANY* PCRYPT_SEQUENCE_OF_ANY;

struct CERT_AUTHORITY_KEY_ID2_INFO {
	CRYPT_DATA_BLOB KeyId;
	CERT_ALT_NAME_INFO AuthorityCertIssuer;
	CRYPT_INTEGER_BLOB AuthorityCertSerialNumber;
}
alias CERT_AUTHORITY_KEY_ID2_INFO* PCERT_AUTHORITY_KEY_ID2_INFO;

struct CERT_ACCESS_DESCRIPTION {
	LPSTR pszAccessMethod;
	CERT_ALT_NAME_ENTRY AccessLocation;
}
alias CERT_ACCESS_DESCRIPTION* PCERT_ACCESS_DESCRIPTION;

struct CERT_AUTHORITY_INFO_ACCESS {
	DWORD cAccDescr;
	PCERT_ACCESS_DESCRIPTION rgAccDescr;
}
alias CERT_AUTHORITY_INFO_ACCESS* PCERT_AUTHORITY_INFO_ACCESS;
alias CERT_AUTHORITY_INFO_ACCESS CERT_SUBJECT_INFO_ACCESS;
alias CERT_SUBJECT_INFO_ACCESS* PCERT_SUBJECT_INFO_ACCESS;

const char* szOID_PKIX_ACC_DESCR = "1.3.6.1.5.5.7.48";
const char* szOID_PKIX_OCSP = "1.3.6.1.5.5.7.48.1";
const char* szOID_PKIX_CA_ISSUERS = "1.3.6.1.5.5.7.48.2";
const char* szOID_PKIX_TIME_STAMPING = "1.3.6.1.5.5.7.48.3";
const char* szOID_PKIX_CA_REPOSITORY = "1.3.6.1.5.5.7.48.5";

enum {
	CRL_REASON_UNSPECIFIED            = 0,
	CRL_REASON_KEY_COMPROMISE         = 1,
	CRL_REASON_CA_COMPROMISE          = 2,
	CRL_REASON_AFFILIATION_CHANGED    = 3,
	CRL_REASON_SUPERSEDED             = 4,
	CRL_REASON_CESSATION_OF_OPERATION = 5,
	CRL_REASON_CERTIFICATE_HOLD       = 6,
	CRL_REASON_REMOVE_FROM_CRL        = 8,
}

struct CRL_DIST_POINT_NAME {
	DWORD dwDistPointNameChoice;
	union {
		CERT_ALT_NAME_INFO FullName;
	}
}
alias CRL_DIST_POINT_NAME* PCRL_DIST_POINT_NAME;

enum {
	CRL_DIST_POINT_NO_NAME         = 0,
	CRL_DIST_POINT_FULL_NAME       = 1,
	CRL_DIST_POINT_ISSUER_RDN_NAME = 2,
}

struct CRL_DIST_POINT {
	CRL_DIST_POINT_NAME DistPointName;
	CRYPT_BIT_BLOB ReasonFlags;
	CERT_ALT_NAME_INFO CRLIssuer;
}
alias CRL_DIST_POINT* PCRL_DIST_POINT;

enum {
	CRL_REASON_UNUSED_FLAG                 = 0x80,
	CRL_REASON_KEY_COMPROMISE_FLAG         = 0x40,
	CRL_REASON_CA_COMPROMISE_FLAG          = 0x20,
	CRL_REASON_AFFILIATION_CHANGED_FLAG    = 0x10,
	CRL_REASON_SUPERSEDED_FLAG             = 0x08,
	CRL_REASON_CESSATION_OF_OPERATION_FLAG = 0x04,
	CRL_REASON_CERTIFICATE_HOLD_FLAG       = 0x02,
}

struct CRL_DIST_POINTS_INFO {
	DWORD cDistPoint;
	PCRL_DIST_POINT rgDistPoint;
}
alias CRL_DIST_POINTS_INFO* PCRL_DIST_POINTS_INFO;

enum {
	CRL_DIST_POINT_ERR_INDEX_MASK  = 0x7F,
	CRL_DIST_POINT_ERR_INDEX_SHIFT = 24,
}
//	GET_CRL_DIST_POINT_ERR_INDEX(X) 	 ((X >> CRL_DIST_POINT_ERR_INDEX_SHIFT) & CRL_DIST_POINT_ERR_INDEX_MASK)
enum {
	CRL_DIST_POINT_ERR_CRL_ISSUER_BIT = 0x80000000,
}
//	IS_CRL_DIST_POINT_ERR_CRL_ISSUER(X) 	 (0 != (X & CRL_DIST_POINT_ERR_CRL_ISSUER_BIT))

struct CROSS_CERT_DIST_POINTS_INFO {
	DWORD dwSyncDeltaTime;
	DWORD cDistPoint;
	PCERT_ALT_NAME_INFO rgDistPoint;
}
alias CROSS_CERT_DIST_POINTS_INFO* PCROSS_CERT_DIST_POINTS_INFO;

enum {
	CROSS_CERT_DIST_POINT_ERR_INDEX_MASK  = 0xFF,
	CROSS_CERT_DIST_POINT_ERR_INDEX_SHIFT = 24,
}
//	GET_CROSS_CERT_DIST_POINT_ERR_INDEX(X) 	 ((X >> CROSS_CERT_DIST_POINT_ERR_INDEX_SHIFT) & 	 CROSS_CERT_DIST_POINT_ERR_INDEX_MASK)

struct CERT_PAIR {
	CERT_BLOB Forward;
	CERT_BLOB Reverse;
}
alias CERT_PAIR* PCERT_PAIR;

struct CRL_ISSUING_DIST_POINT {
	CRL_DIST_POINT_NAME DistPointName;
	BOOL fOnlyContainsUserCerts;
	BOOL fOnlyContainsCACerts;
	CRYPT_BIT_BLOB OnlySomeReasonFlags;
	BOOL fIndirectCRL;
}
alias CRL_ISSUING_DIST_POINT* PCRL_ISSUING_DIST_POINT;

struct CERT_GENERAL_SUBTREE {
	CERT_ALT_NAME_ENTRY Base;
	DWORD dwMinimum;
	BOOL fMaximum;
	DWORD dwMaximum;
}
alias CERT_GENERAL_SUBTREE* PCERT_GENERAL_SUBTREE;

struct CERT_NAME_CONSTRAINTS_INFO {
	DWORD cPermittedSubtree;
	PCERT_GENERAL_SUBTREE rgPermittedSubtree;
	DWORD cExcludedSubtree;
	PCERT_GENERAL_SUBTREE rgExcludedSubtree;
}
alias CERT_NAME_CONSTRAINTS_INFO* PCERT_NAME_CONSTRAINTS_INFO;

enum {
	CERT_EXCLUDED_SUBTREE_BIT = 0x80000000,
}
//	IS_CERT_EXCLUDED_SUBTREE(X) 	 (0 != (X & CERT_EXCLUDED_SUBTREE_BIT))

enum {
	SORTED_CTL_EXT_FLAGS_OFFSET                   = 0*4,
	SORTED_CTL_EXT_COUNT_OFFSET                   = 1*4,
	SORTED_CTL_EXT_MAX_COLLISION_OFFSET           = 2*4,
	SORTED_CTL_EXT_HASH_BUCKET_OFFSET             = 3*4,
	SORTED_CTL_EXT_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x1,
}

struct CERT_DSS_PARAMETERS {
	CRYPT_UINT_BLOB p;
	CRYPT_UINT_BLOB q;
	CRYPT_UINT_BLOB g;
}
alias  CERT_DSS_PARAMETERS* PCERT_DSS_PARAMETERS;

enum {
	CERT_DSS_R_LEN                         = 20,
	CERT_DSS_S_LEN                         = 20,
	CERT_DSS_SIGNATURE_LEN                 = CERT_DSS_R_LEN + CERT_DSS_S_LEN,
	CERT_MAX_ASN_ENCODED_DSS_SIGNATURE_LEN = 2 + 2 * (2 + 20 +1),
}

struct CERT_DH_PARAMETERS {
	CRYPT_UINT_BLOB p;
	CRYPT_UINT_BLOB g;
}
alias CERT_DH_PARAMETERS* PCERT_DH_PARAMETERS;

struct CERT_ECC_SIGNATURE {
	CRYPT_UINT_BLOB r;
	CRYPT_UINT_BLOB s;
}
alias CERT_ECC_SIGNATURE* PCERT_ECC_SIGNATURE;

struct CERT_X942_DH_VALIDATION_PARAMS {
	CRYPT_BIT_BLOB seed;
	DWORD pgenCounter;
}
alias CERT_X942_DH_VALIDATION_PARAMS* PCERT_X942_DH_VALIDATION_PARAMS;

struct CERT_X942_DH_PARAMETERS {
	CRYPT_UINT_BLOB p;
	CRYPT_UINT_BLOB g;
	CRYPT_UINT_BLOB q;
	CRYPT_UINT_BLOB j;
	PCERT_X942_DH_VALIDATION_PARAMS pValidationParams;
}
alias CERT_X942_DH_PARAMETERS* PCERT_X942_DH_PARAMETERS;

enum {
	CRYPT_X942_COUNTER_BYTE_LENGTH    = 4,
	CRYPT_X942_KEY_LENGTH_BYTE_LENGTH = 4,
	CRYPT_X942_PUB_INFO_BYTE_LENGTH   = 512/8,

}
struct CRYPT_X942_OTHER_INFO {
	LPSTR pszContentEncryptionObjId;
	BYTE[CRYPT_X942_COUNTER_BYTE_LENGTH] rgbCounter;
	BYTE[CRYPT_X942_KEY_LENGTH_BYTE_LENGTH] rgbKeyLength;
	CRYPT_DATA_BLOB PubInfo;
}
alias CRYPT_X942_OTHER_INFO* PCRYPT_X942_OTHER_INFO;

enum CRYPT_ECC_CMS_SHARED_INFO_SUPPPUBINFO_BYTE_LENGTH = 4;

struct CRYPT_ECC_CMS_SHARED_INFO {
	CRYPT_ALGORITHM_IDENTIFIER Algorithm;
	CRYPT_DATA_BLOB EntityUInfo;
	BYTE[CRYPT_ECC_CMS_SHARED_INFO_SUPPPUBINFO_BYTE_LENGTH] rgbSuppPubInfo;
}
alias CRYPT_ECC_CMS_SHARED_INFO* PCRYPT_ECC_CMS_SHARED_INFO;

struct CRYPT_RC2_CBC_PARAMETERS {
	DWORD dwVersion;
	BOOL fIV;
	BYTE[8] rgbIV;
}
alias CRYPT_RC2_CBC_PARAMETERS* PCRYPT_RC2_CBC_PARAMETERS;

enum {
	CRYPT_RC2_40BIT_VERSION  = 160,
	CRYPT_RC2_56BIT_VERSION  = 52,
	CRYPT_RC2_64BIT_VERSION  = 120,
	CRYPT_RC2_128BIT_VERSION = 58,
}

struct CRYPT_SMIME_CAPABILITY {
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Parameters;
}
alias CRYPT_SMIME_CAPABILITY* PCRYPT_SMIME_CAPABILITY;

struct CRYPT_SMIME_CAPABILITIES {
	DWORD cCapability;
	PCRYPT_SMIME_CAPABILITY rgCapability;
}
alias CRYPT_SMIME_CAPABILITIES* PCRYPT_SMIME_CAPABILITIES;

struct CERT_QC_STATEMENT {
	LPSTR pszStatementId;
	CRYPT_OBJID_BLOB StatementInfo;
}
alias CERT_QC_STATEMENT* PCERT_QC_STATEMENT;

struct CERT_QC_STATEMENTS_EXT_INFO {
	DWORD cStatement;
	PCERT_QC_STATEMENT rgStatement;
}
alias CERT_QC_STATEMENTS_EXT_INFO* PCERT_QC_STATEMENTS_EXT_INFO;

const char* szOID_QC_EU_COMPLIANCE = "0.4.0.1862.1.1";
const char* szOID_QC_SSCD = "0.4.0.1862.1.4";

struct CRYPT_MASK_GEN_ALGORITHM {
	LPSTR pszObjId;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
}
alias CRYPT_MASK_GEN_ALGORITHM* PCRYPT_MASK_GEN_ALGORITHM;

struct CRYPT_RSA_SSA_PSS_PARAMETERS {
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_MASK_GEN_ALGORITHM MaskGenAlgorithm;
	DWORD dwSaltLength;
	DWORD dwTrailerField;
}
alias CRYPT_RSA_SSA_PSS_PARAMETERS* PCRYPT_RSA_SSA_PSS_PARAMETERS;

enum PKCS_RSA_SSA_PSS_TRAILER_FIELD_BC = 1;

struct CRYPT_PSOURCE_ALGORITHM {
	LPSTR pszObjId;
	CRYPT_DATA_BLOB EncodingParameters;
}
alias CRYPT_PSOURCE_ALGORITHM* PCRYPT_PSOURCE_ALGORITHM;

struct CRYPT_RSAES_OAEP_PARAMETERS {
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_MASK_GEN_ALGORITHM MaskGenAlgorithm;
	CRYPT_PSOURCE_ALGORITHM PSourceAlgorithm;
}
alias CRYPT_RSAES_OAEP_PARAMETERS* PCRYPT_RSAES_OAEP_PARAMETERS;

const char* szOID_VERISIGN_PRIVATE_6_9 = "2.16.840.1.113733.1.6.9";
const char* szOID_VERISIGN_ONSITE_JURISDICTION_HASH = "2.16.840.1.113733.1.6.11";
const char* szOID_VERISIGN_BITSTRING_6_13 = "2.16.840.1.113733.1.6.13";
const char* szOID_VERISIGN_ISS_STRONG_CRYPTO = "2.16.840.1.113733.1.8.1";
const char* szOID_NETSCAPE = "2.16.840.1.113730";
const char* szOID_NETSCAPE_CERT_EXTENSION = "2.16.840.1.113730.1";
const char* szOID_NETSCAPE_CERT_TYPE = "2.16.840.1.113730.1.1";
const char* szOID_NETSCAPE_BASE_URL = "2.16.840.1.113730.1.2";
const char* szOID_NETSCAPE_REVOCATION_URL = "2.16.840.1.113730.1.3";
const char* szOID_NETSCAPE_CA_REVOCATION_URL = "2.16.840.1.113730.1.4";
const char* szOID_NETSCAPE_CERT_RENEWAL_URL = "2.16.840.1.113730.1.7";
const char* szOID_NETSCAPE_CA_POLICY_URL = "2.16.840.1.113730.1.8";
const char* szOID_NETSCAPE_SSL_SERVER_NAME = "2.16.840.1.113730.1.12";
const char* szOID_NETSCAPE_COMMENT = "2.16.840.1.113730.1.13";
const char* szOID_NETSCAPE_DATA_TYPE = "2.16.840.1.113730.2";
const char* szOID_NETSCAPE_CERT_SEQUENCE = "2.16.840.1.113730.2.5";

enum {
	NETSCAPE_SSL_CLIENT_AUTH_CERT_TYPE = 0x80,
	NETSCAPE_SSL_SERVER_AUTH_CERT_TYPE = 0x40,
	NETSCAPE_SMIME_CERT_TYPE           = 0x20,
	NETSCAPE_SIGN_CERT_TYPE            = 0x10,
	NETSCAPE_SSL_CA_CERT_TYPE          = 0x04,
	NETSCAPE_SMIME_CA_CERT_TYPE        = 0x02,
	NETSCAPE_SIGN_CA_CERT_TYPE         = 0x01,
}

const char* szOID_CT_PKI_DATA = "1.3.6.1.5.5.7.12.2";
const char* szOID_CT_PKI_RESPONSE = "1.3.6.1.5.5.7.12.3";
const char* szOID_PKIX_NO_SIGNATURE = "1.3.6.1.5.5.7.6.2";
const char* szOID_CMC = "1.3.6.1.5.5.7.7";
const char* szOID_CMC_STATUS_INFO = "1.3.6.1.5.5.7.7.1";
const char* szOID_CMC_IDENTIFICATION = "1.3.6.1.5.5.7.7.2";
const char* szOID_CMC_IDENTITY_PROOF = "1.3.6.1.5.5.7.7.3";
const char* szOID_CMC_DATA_RETURN = "1.3.6.1.5.5.7.7.4";
const char* szOID_CMC_TRANSACTION_ID = "1.3.6.1.5.5.7.7.5";
const char* szOID_CMC_SENDER_NONCE = "1.3.6.1.5.5.7.7.6";
const char* szOID_CMC_RECIPIENT_NONCE = "1.3.6.1.5.5.7.7.7";
const char* szOID_CMC_ADD_EXTENSIONS = "1.3.6.1.5.5.7.7.8";
const char* szOID_CMC_ENCRYPTED_POP = "1.3.6.1.5.5.7.7.9";
const char* szOID_CMC_DECRYPTED_POP = "1.3.6.1.5.5.7.7.10";
const char* szOID_CMC_LRA_POP_WITNESS = "1.3.6.1.5.5.7.7.11";
const char* szOID_CMC_GET_CERT = "1.3.6.1.5.5.7.7.15";
const char* szOID_CMC_GET_CRL = "1.3.6.1.5.5.7.7.16";
const char* szOID_CMC_REVOKE_REQUEST = "1.3.6.1.5.5.7.7.17";
const char* szOID_CMC_REG_INFO = "1.3.6.1.5.5.7.7.18";
const char* szOID_CMC_RESPONSE_INFO = "1.3.6.1.5.5.7.7.19";
const char* szOID_CMC_QUERY_PENDING = "1.3.6.1.5.5.7.7.21";
const char* szOID_CMC_ID_POP_LINK_RANDOM = "1.3.6.1.5.5.7.7.22";
const char* szOID_CMC_ID_POP_LINK_WITNESS = "1.3.6.1.5.5.7.7.23";
const char* szOID_CMC_ID_CONFIRM_CERT_ACCEPTANCE = "1.3.6.1.5.5.7.7.24";
const char* szOID_CMC_ADD_ATTRIBUTES = "1.3.6.1.4.1.311.10.10.1";

struct CMC_TAGGED_ATTRIBUTE {
	DWORD dwBodyPartID;
	CRYPT_ATTRIBUTE Attribute;
}
alias CMC_TAGGED_ATTRIBUTE* PCMC_TAGGED_ATTRIBUTE;

struct CMC_TAGGED_CERT_REQUEST {
	DWORD dwBodyPartID;
	CRYPT_DER_BLOB SignedCertRequest;
}
alias CMC_TAGGED_CERT_REQUEST* PCMC_TAGGED_CERT_REQUEST;

struct CMC_TAGGED_REQUEST {
	DWORD dwTaggedRequestChoice;
	union {
		PCMC_TAGGED_CERT_REQUEST pTaggedCertRequest;
	}
}
alias CMC_TAGGED_REQUEST* PCMC_TAGGED_REQUEST;

enum CMC_TAGGED_CERT_REQUEST_CHOICE = 1;

struct CMC_TAGGED_CONTENT_INFO {
	DWORD dwBodyPartID;
	CRYPT_DER_BLOB EncodedContentInfo;
}
alias CMC_TAGGED_CONTENT_INFO* PCMC_TAGGED_CONTENT_INFO;

struct CMC_TAGGED_OTHER_MSG {
	DWORD dwBodyPartID;
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Value;
}
alias CMC_TAGGED_OTHER_MSG* PCMC_TAGGED_OTHER_MSG;

struct CMC_DATA_INFO {
	DWORD cTaggedAttribute;
	PCMC_TAGGED_ATTRIBUTE rgTaggedAttribute;
	DWORD cTaggedRequest;
	PCMC_TAGGED_REQUEST rgTaggedRequest;
	DWORD cTaggedContentInfo;
	PCMC_TAGGED_CONTENT_INFO rgTaggedContentInfo;
	DWORD cTaggedOtherMsg;
	PCMC_TAGGED_OTHER_MSG rgTaggedOtherMsg;
}
alias CMC_DATA_INFO* PCMC_DATA_INFO;

struct CMC_RESPONSE_INFO {
	DWORD cTaggedAttribute;
	PCMC_TAGGED_ATTRIBUTE rgTaggedAttribute;
	DWORD cTaggedContentInfo;
	PCMC_TAGGED_CONTENT_INFO rgTaggedContentInfo;
	DWORD cTaggedOtherMsg;
	PCMC_TAGGED_OTHER_MSG rgTaggedOtherMsg;
}
alias CMC_RESPONSE_INFO* PCMC_RESPONSE_INFO;

struct CMC_PEND_INFO {
	CRYPT_DATA_BLOB PendToken;
	FILETIME PendTime;
}
alias CMC_PEND_INFO* PCMC_PEND_INFO;

struct CMC_STATUS_INFO {
	DWORD dwStatus;
	DWORD cBodyList;
	DWORD* rgdwBodyList;
	LPWSTR pwszStatusString;
	DWORD dwOtherInfoChoice;
	union {
		DWORD dwFailInfo;
		PCMC_PEND_INFO pPendInfo;
	}
}
alias CMC_STATUS_INFO* PCMC_STATUS_INFO;

enum {
	CMC_OTHER_INFO_NO_CHOICE   = 0,
	CMC_OTHER_INFO_FAIL_CHOICE = 1,
	CMC_OTHER_INFO_PEND_CHOICE = 2,
}

enum {
	CMC_STATUS_SUCCESS          = 0,
	CMC_STATUS_FAILED           = 2,
	CMC_STATUS_PENDING          = 3,
	CMC_STATUS_NO_SUPPORT       = 4,
	CMC_STATUS_CONFIRM_REQUIRED = 5,
	CMC_FAIL_BAD_ALG            = 0,
	CMC_FAIL_BAD_MESSAGE_CHECK  = 1,
	CMC_FAIL_BAD_REQUEST        = 2,
	CMC_FAIL_BAD_TIME           = 3,
	CMC_FAIL_BAD_CERT_ID        = 4,
	CMC_FAIL_UNSUPORTED_EXT     = 5,
	CMC_FAIL_MUST_ARCHIVE_KEYS  = 6,
	CMC_FAIL_BAD_IDENTITY       = 7,
	CMC_FAIL_POP_REQUIRED       = 8,
	CMC_FAIL_POP_FAILED         = 9,
	CMC_FAIL_NO_KEY_REUSE       = 10,
	CMC_FAIL_INTERNAL_CA_ERROR  = 11,
	CMC_FAIL_TRY_LATER          = 12,
}

struct CMC_ADD_EXTENSIONS_INFO {
	DWORD dwCmcDataReference;
	DWORD cCertReference;
	DWORD* rgdwCertReference;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias CMC_ADD_EXTENSIONS_INFO* PCMC_ADD_EXTENSIONS_INFO;

struct CMC_ADD_ATTRIBUTES_INFO {
	DWORD dwCmcDataReference;
	DWORD cCertReference;
	DWORD* rgdwCertReference;
	DWORD cAttribute;
	PCRYPT_ATTRIBUTE rgAttribute;
}
alias CMC_ADD_ATTRIBUTES_INFO* PCMC_ADD_ATTRIBUTES_INFO;

struct CERT_TEMPLATE_EXT {
	LPSTR pszObjId;
	DWORD dwMajorVersion;
	BOOL fMinorVersion;
	DWORD dwMinorVersion;
}
alias CERT_TEMPLATE_EXT* PCERT_TEMPLATE_EXT;

struct CERT_HASHED_URL {
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_HASH_BLOB Hash;
	LPWSTR pwszUrl;
}
alias CERT_HASHED_URL* PCERT_HASHED_URL;

struct CERT_LOGOTYPE_DETAILS {
	LPWSTR pwszMimeType;
	DWORD cHashedUrl;
	PCERT_HASHED_URL rgHashedUrl;
}
alias CERT_LOGOTYPE_DETAILS* PCERT_LOGOTYPE_DETAILS;

struct CERT_LOGOTYPE_REFERENCE {
	DWORD cHashedUrl;
	PCERT_HASHED_URL rgHashedUrl;
}
alias CERT_LOGOTYPE_REFERENCE* PCERT_LOGOTYPE_REFERENCE;

struct CERT_LOGOTYPE_IMAGE_INFO {
	DWORD dwLogotypeImageInfoChoice;
	DWORD dwFileSize;
	DWORD dwXSize;
	DWORD dwYSize;
	DWORD dwLogotypeImageResolutionChoice;
	union {
		DWORD dwNumBits;
		DWORD dwTableSize;
	}
	LPWSTR pwszLanguage;
}
alias CERT_LOGOTYPE_IMAGE_INFO* PCERT_LOGOTYPE_IMAGE_INFO;

enum {
	CERT_LOGOTYPE_GRAY_SCALE_IMAGE_INFO_CHOICE       = 1,
	CERT_LOGOTYPE_COLOR_IMAGE_INFO_CHOICE            = 2,
	CERT_LOGOTYPE_NO_IMAGE_RESOLUTION_CHOICE         = 0,
	CERT_LOGOTYPE_BITS_IMAGE_RESOLUTION_CHOICE       = 1,
	CERT_LOGOTYPE_TABLE_SIZE_IMAGE_RESOLUTION_CHOICE = 2,
}

struct CERT_LOGOTYPE_IMAGE {
	CERT_LOGOTYPE_DETAILS LogotypeDetails;
	PCERT_LOGOTYPE_IMAGE_INFO pLogotypeImageInfo;
}
alias CERT_LOGOTYPE_IMAGE* PCERT_LOGOTYPE_IMAGE;

struct CERT_LOGOTYPE_AUDIO_INFO {
	DWORD dwFileSize;
	DWORD dwPlayTime;
	DWORD dwChannels;
	DWORD dwSampleRate;
	LPWSTR pwszLanguage;
}
alias CERT_LOGOTYPE_AUDIO_INFO* PCERT_LOGOTYPE_AUDIO_INFO;

struct CERT_LOGOTYPE_AUDIO {
	CERT_LOGOTYPE_DETAILS LogotypeDetails;
	PCERT_LOGOTYPE_AUDIO_INFO pLogotypeAudioInfo;
}
alias CERT_LOGOTYPE_AUDIO* PCERT_LOGOTYPE_AUDIO;

struct CERT_LOGOTYPE_DATA {
	DWORD cLogotypeImage;
	PCERT_LOGOTYPE_IMAGE rgLogotypeImage;
	DWORD cLogotypeAudio;
	PCERT_LOGOTYPE_AUDIO rgLogotypeAudio;
}
alias CERT_LOGOTYPE_DATA* PCERT_LOGOTYPE_DATA;

struct CERT_LOGOTYPE_INFO {
	DWORD dwLogotypeInfoChoice;
	union {
		PCERT_LOGOTYPE_DATA pLogotypeDirectInfo;
		PCERT_LOGOTYPE_REFERENCE pLogotypeIndirectInfo;
	}
}
alias CERT_LOGOTYPE_INFO* PCERT_LOGOTYPE_INFO;

enum {
	CERT_LOGOTYPE_DIRECT_INFO_CHOICE   = 1,
	CERT_LOGOTYPE_INDIRECT_INFO_CHOICE = 2,
}

struct CERT_OTHER_LOGOTYPE_INFO {
	LPSTR pszObjId;
	CERT_LOGOTYPE_INFO LogotypeInfo;
}
alias CERT_OTHER_LOGOTYPE_INFO* PCERT_OTHER_LOGOTYPE_INFO;

const char* szOID_LOYALTY_OTHER_LOGOTYPE = "1.3.6.1.5.5.7.20.1";
const char* szOID_BACKGROUND_OTHER_LOGOTYPE = "1.3.6.1.5.5.7.20.2";

struct CERT_LOGOTYPE_EXT_INFO {
	DWORD cCommunityLogo;
	PCERT_LOGOTYPE_INFO rgCommunityLogo;
	PCERT_LOGOTYPE_INFO pIssuerLogo;
	PCERT_LOGOTYPE_INFO pSubjectLogo;
	DWORD cOtherLogo;
	PCERT_OTHER_LOGOTYPE_INFO rgOtherLogo;
}
alias CERT_LOGOTYPE_EXT_INFO* PCERT_LOGOTYPE_EXT_INFO;

struct CERT_BIOMETRIC_DATA {
	DWORD dwTypeOfBiometricDataChoice;
	union {
		DWORD dwPredefined;
		LPSTR pszObjId;
	}
	CERT_HASHED_URL HashedUrl;
}
alias CERT_BIOMETRIC_DATA* PCERT_BIOMETRIC_DATA;

enum {
	CERT_BIOMETRIC_PREDEFINED_DATA_CHOICE = 1,
	CERT_BIOMETRIC_OID_DATA_CHOICE        = 2,
	CERT_BIOMETRIC_PICTURE_TYPE           = 0,
	CERT_BIOMETRIC_SIGNATURE_TYPE         = 1,
}

struct CERT_BIOMETRIC_EXT_INFO {
	DWORD cBiometricData;
	PCERT_BIOMETRIC_DATA rgBiometricData;
}
alias CERT_BIOMETRIC_EXT_INFO* PCERT_BIOMETRIC_EXT_INFO;

struct OCSP_SIGNATURE_INFO {
	CRYPT_ALGORITHM_IDENTIFIER SignatureAlgorithm;
	CRYPT_BIT_BLOB Signature;
	DWORD cCertEncoded;
	PCERT_BLOB rgCertEncoded;
}
alias OCSP_SIGNATURE_INFO* POCSP_SIGNATURE_INFO;

struct OCSP_SIGNED_REQUEST_INFO {
	CRYPT_DER_BLOB ToBeSigned;
	POCSP_SIGNATURE_INFO pOptionalSignatureInfo;
}
alias OCSP_SIGNED_REQUEST_INFO* POCSP_SIGNED_REQUEST_INFO;

struct OCSP_CERT_ID {
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_HASH_BLOB IssuerNameHash;
	CRYPT_HASH_BLOB IssuerKeyHash;
	CRYPT_INTEGER_BLOB SerialNumber;
}
alias OCSP_CERT_ID* POCSP_CERT_ID;

struct OCSP_REQUEST_ENTRY {
	OCSP_CERT_ID CertId;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias OCSP_REQUEST_ENTRY* POCSP_REQUEST_ENTRY;

struct OCSP_REQUEST_INFO {
	DWORD dwVersion;
	PCERT_ALT_NAME_ENTRY pRequestorName;
	DWORD cRequestEntry;
	POCSP_REQUEST_ENTRY rgRequestEntry;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias OCSP_REQUEST_INFO* POCSP_REQUEST_INFO;

enum OCSP_REQUEST_V1 = 0;

struct OCSP_RESPONSE_INFO {
	DWORD dwStatus;
	LPSTR pszObjId;
	CRYPT_OBJID_BLOB Value;
}
alias OCSP_RESPONSE_INFO* POCSP_RESPONSE_INFO;

enum {
	OCSP_SUCCESSFUL_RESPONSE        = 0,
	OCSP_MALFORMED_REQUEST_RESPONSE = 1,
	OCSP_INTERNAL_ERROR_RESPONSE    = 2,
	OCSP_TRY_LATER_RESPONSE         = 3,
	OCSP_SIG_REQUIRED_RESPONSE      = 5,
	OCSP_UNAUTHORIZED_RESPONSE      = 6,
}

const char* szOID_PKIX_OCSP_BASIC_SIGNED_RESPONSE = "1.3.6.1.5.5.7.48.1.1";

struct OCSP_BASIC_SIGNED_RESPONSE_INFO {
	CRYPT_DER_BLOB ToBeSigned;
	OCSP_SIGNATURE_INFO SignatureInfo;
}
alias OCSP_BASIC_SIGNED_RESPONSE_INFO* POCSP_BASIC_SIGNED_RESPONSE_INFO;

struct OCSP_BASIC_REVOKED_INFO {
	FILETIME RevocationDate;
	DWORD dwCrlReasonCode;
}
alias OCSP_BASIC_REVOKED_INFO* POCSP_BASIC_REVOKED_INFO;

struct OCSP_BASIC_RESPONSE_ENTRY {
	OCSP_CERT_ID CertId;
	DWORD dwCertStatus;
	union {
		POCSP_BASIC_REVOKED_INFO pRevokedInfo;
	}
	FILETIME ThisUpdate;
	FILETIME NextUpdate;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias OCSP_BASIC_RESPONSE_ENTRY* POCSP_BASIC_RESPONSE_ENTRY;

enum {
	OCSP_BASIC_GOOD_CERT_STATUS    = 0,
	OCSP_BASIC_REVOKED_CERT_STATUS = 1,
	OCSP_BASIC_UNKNOWN_CERT_STATUS = 2,
}

struct OCSP_BASIC_RESPONSE_INFO {
	DWORD dwVersion;
	DWORD dwResponderIdChoice;
	union {
		CERT_NAME_BLOB ByNameResponderId;
		CRYPT_HASH_BLOB ByKeyResponderId;
	}
	FILETIME ProducedAt;
	DWORD cResponseEntry;
	POCSP_BASIC_RESPONSE_ENTRY rgResponseEntry;
	DWORD cExtension;
	PCERT_EXTENSION rgExtension;
}
alias OCSP_BASIC_RESPONSE_INFO* POCSP_BASIC_RESPONSE_INFO;

enum {
	OCSP_BASIC_RESPONSE_V1          = 0,
	OCSP_BASIC_BY_NAME_RESPONDER_ID = 1,
	OCSP_BASIC_BY_KEY_RESPONDER_ID  = 2,
}

enum HCRYPTOIDFUNCSET : void* {init = (void*).init}
enum HCRYPTOIDFUNCADDR : void* {init = (void*).init}

const char* CRYPT_OID_ENCODE_OBJECT_FUNC = "CryptDllEncodeObject";
const char* CRYPT_OID_DECODE_OBJECT_FUNC = "CryptDllDecodeObject";
const char* CRYPT_OID_ENCODE_OBJECT_EX_FUNC = "CryptDllEncodeObjectEx";
const char* CRYPT_OID_DECODE_OBJECT_EX_FUNC = "CryptDllDecodeObjectEx";
const char* CRYPT_OID_CREATE_COM_OBJECT_FUNC = "CryptDllCreateCOMObject";
const char* CRYPT_OID_VERIFY_REVOCATION_FUNC = "CertDllVerifyRevocation";
const char* CRYPT_OID_VERIFY_CTL_USAGE_FUNC = "CertDllVerifyCTLUsage";
const char* CRYPT_OID_FORMAT_OBJECT_FUNC = "CryptDllFormatObject";
const char* CRYPT_OID_FIND_OID_INFO_FUNC = "CryptDllFindOIDInfo";
const char* CRYPT_OID_FIND_LOCALIZED_NAME_FUNC = "CryptDllFindLocalizedName";

const char* CRYPT_OID_REGPATH = "Software\\Microsoft\\Cryptography\\OID";
const char* CRYPT_OID_REG_ENCODING_TYPE_PREFIX = "EncodingType = ";
const wchar* CRYPT_OID_REG_DLL_VALUE_NAME = "Dll";
const wchar* CRYPT_OID_REG_FUNC_NAME_VALUE_NAME = "FuncName";
const char* CRYPT_OID_REG_FUNC_NAME_VALUE_NAME_A = "FuncName";

const wchar* CRYPT_OID_REG_FLAGS_VALUE_NAME = "CryptFlags";

const char* CRYPT_DEFAULT_OID = "DEFAULT";

struct CRYPT_OID_FUNC_ENTRY {
	LPCSTR pszOID;
	void* pvFuncAddr;
}
alias CRYPT_OID_FUNC_ENTRY* PCRYPT_OID_FUNC_ENTRY;

enum CRYPT_INSTALL_OID_FUNC_BEFORE_FLAG = 1;

export extern(Windows) BOOL CryptInstallOIDFunctionAddress(HMODULE hModule, DWORD dwEncodingType, LPCSTR pszFuncName, DWORD cFuncEntry, const(CRYPT_OID_FUNC_ENTRY)* rgFuncEntry, DWORD dwFlags);
export extern(Windows) HCRYPTOIDFUNCSET CryptInitOIDFunctionSet(LPCSTR pszFuncName, DWORD dwFlags);
export extern(Windows) BOOL CryptGetOIDFunctionAddress(HCRYPTOIDFUNCSET hFuncSet, DWORD dwEncodingType, LPCSTR pszOID, DWORD dwFlags, void** ppvFuncAddr, HCRYPTOIDFUNCADDR* phFuncAddr);

enum CRYPT_GET_INSTALLED_OID_FUNC_FLAG = 0x1;

export extern(Windows) BOOL CryptGetDefaultOIDDllList(HCRYPTOIDFUNCSET hFuncSet, DWORD dwEncodingType, WCHAR* pwszDllList, DWORD* pcchDllList);
export extern(Windows) BOOL CryptGetDefaultOIDFunctionAddress(HCRYPTOIDFUNCSET hFuncSet, DWORD dwEncodingType, LPCWSTR pwszDll, DWORD dwFlags, void** ppvFuncAddr, HCRYPTOIDFUNCADDR* phFuncAddr);
export extern(Windows) BOOL CryptFreeOIDFunctionAddress(HCRYPTOIDFUNCADDR hFuncAddr, DWORD dwFlags);
export extern(Windows) BOOL CryptRegisterOIDFunction(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID, LPCWSTR pwszDll, LPCSTR pszOverrideFuncName);
export extern(Windows) BOOL CryptUnregisterOIDFunction(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID);
export extern(Windows) BOOL CryptRegisterDefaultOIDFunction(DWORD dwEncodingType, LPCSTR pszFuncName, DWORD dwIndex, LPCWSTR pwszDll);

enum {
	CRYPT_REGISTER_FIRST_INDEX = 0,
	CRYPT_REGISTER_LAST_INDEX  = 0xFFFFFFFF,
}

export extern(Windows) BOOL CryptUnregisterDefaultOIDFunction(DWORD dwEncodingType, LPCSTR pszFuncName, LPCWSTR pwszDll);
export extern(Windows) BOOL CryptSetOIDFunctionValue(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID, LPCWSTR pwszValueName, DWORD dwValueType, const(BYTE)* pbValueData, DWORD cbValueData);
export extern(Windows) BOOL CryptGetOIDFunctionValue(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID, LPCWSTR pwszValueName, DWORD* pdwValueType, BYTE* pbValueData, DWORD* pcbValueData);

alias extern(Windows) BOOL function(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID, DWORD cValue, const(DWORD)* rgdwValueType, LPCWSTR* rgpwszValueName, const(BYTE)** rgpbValueData, const(DWORD)* rgcbValueData, void* pvArg) PFN_CRYPT_ENUM_OID_FUNC;

export extern(Windows) BOOL CryptEnumOIDFunction(DWORD dwEncodingType, LPCSTR pszFuncName, LPCSTR pszOID, DWORD dwFlags, void* pvArg, PFN_CRYPT_ENUM_OID_FUNC pfnEnumOIDFunc);

enum {
	CRYPT_MATCH_ANY_ENCODING_TYPE = 0xFFFFFFFF,
	CALG_OID_INFO_CNG_ONLY        = 0xFFFFFFFF,
	CALG_OID_INFO_PARAMETERS      = 0xFFFFFFFE,
}

//	IS_SPECIAL_OID_INFO_ALGID(Algid) (Algid >= CALG_OID_INFO_PARAMETERS)

const wchar* CRYPT_OID_INFO_HASH_PARAMETERS_ALGORITHM = "CryptOIDInfoHashParameters";
const wchar* CRYPT_OID_INFO_ECC_PARAMETERS_ALGORITHM = "CryptOIDInfoECCParameters";
const wchar* CRYPT_OID_INFO_MGF1_PARAMETERS_ALGORITHM = "CryptOIDInfoMgf1Parameters";
const wchar* CRYPT_OID_INFO_NO_SIGN_ALGORITHM = "CryptOIDInfoNoSign";
const wchar* CRYPT_OID_INFO_OAEP_PARAMETERS_ALGORITHM = "CryptOIDInfoOAEPParameters";
const wchar* CRYPT_OID_INFO_ECC_WRAP_PARAMETERS_ALGORITHM = "CryptOIDInfoECCWrapParameters";

struct CRYPT_OID_INFO {
	DWORD cbSize;
	LPCSTR pszOID;
	LPCWSTR pwszName;
	DWORD dwGroupId;
	union {
		DWORD dwValue;
		ALG_ID Algid;
		DWORD dwLength;
	}
	CRYPT_DATA_BLOB ExtraInfo;
	//CRYPT_OID_INFO_HAS_EXTRA_FIELDS
		LPCWSTR pwszCNGAlgid;
		LPCWSTR pwszCNGExtraAlgid;
}
alias CRYPT_OID_INFO* PCRYPT_OID_INFO;
alias const(CRYPT_OID_INFO) CCRYPT_OID_INFO;
alias CCRYPT_OID_INFO* PCCRYPT_OID_INFO;

enum {
	CRYPT_HASH_ALG_OID_GROUP_ID              = 1,
	CRYPT_ENCRYPT_ALG_OID_GROUP_ID           = 2,
	CRYPT_PUBKEY_ALG_OID_GROUP_ID            = 3,
	CRYPT_SIGN_ALG_OID_GROUP_ID              = 4,
	CRYPT_RDN_ATTR_OID_GROUP_ID              = 5,
	CRYPT_EXT_OR_ATTR_OID_GROUP_ID           = 6,
	CRYPT_ENHKEY_USAGE_OID_GROUP_ID          = 7,
	CRYPT_POLICY_OID_GROUP_ID                = 8,
	CRYPT_TEMPLATE_OID_GROUP_ID              = 9,
	CRYPT_KDF_OID_GROUP_ID                   = 10,
	CRYPT_LAST_OID_GROUP_ID                  = 10,
	CRYPT_FIRST_ALG_OID_GROUP_ID             = CRYPT_HASH_ALG_OID_GROUP_ID,
	CRYPT_LAST_ALG_OID_GROUP_ID              = CRYPT_SIGN_ALG_OID_GROUP_ID,
	CRYPT_OID_INHIBIT_SIGNATURE_FORMAT_FLAG  = 0x00000001,
	CRYPT_OID_USE_PUBKEY_PARA_FOR_PKCS7_FLAG = 0x00000002,
	CRYPT_OID_NO_NULL_ALGORITHM_PARA_FLAG    = 0x00000004,
	CRYPT_OID_PUBKEY_SIGN_ONLY_FLAG          = 0x80000000,
	CRYPT_OID_PUBKEY_ENCRYPT_ONLY_FLAG       = 0x40000000,
}

export extern(Windows) PCCRYPT_OID_INFO CryptFindOIDInfo(DWORD dwKeyType, void* pvKey, DWORD dwGroupId);

enum {
	CRYPT_OID_INFO_OID_KEY                 = 1,
	CRYPT_OID_INFO_NAME_KEY                = 2,
	CRYPT_OID_INFO_ALGID_KEY               = 3,
	CRYPT_OID_INFO_SIGN_KEY                = 4,
	CRYPT_OID_INFO_CNG_ALGID_KEY           = 5,
	CRYPT_OID_INFO_CNG_SIGN_KEY            = 6,
	CRYPT_OID_INFO_OID_KEY_FLAGS_MASK      = 0xFFFF0000,
	CRYPT_OID_INFO_PUBKEY_SIGN_KEY_FLAG    = 0x80000000,
	CRYPT_OID_INFO_PUBKEY_ENCRYPT_KEY_FLAG = 0x40000000,
	CRYPT_OID_DISABLE_SEARCH_DS_FLAG       = 0x80000000,
	CRYPT_OID_PREFER_CNG_ALGID_FLAG        = 0x40000000,
	CRYPT_OID_INFO_OID_GROUP_BIT_LEN_MASK  = 0x0FFF0000,
	CRYPT_OID_INFO_OID_GROUP_BIT_LEN_SHIFT = 16,
}

export extern(Windows) BOOL CryptRegisterOIDInfo(PCCRYPT_OID_INFO pInfo, DWORD dwFlags);

enum CRYPT_INSTALL_OID_INFO_BEFORE_FLAG = 1;

export extern(Windows) BOOL CryptUnregisterOIDInfo(PCCRYPT_OID_INFO pInfo);

alias extern(Windows) BOOL function(PCCRYPT_OID_INFO pInfo, void* pvArg) PFN_CRYPT_ENUM_OID_INFO;

export extern(Windows) BOOL CryptEnumOIDInfo(DWORD dwGroupId, DWORD dwFlags, void* pvArg, PFN_CRYPT_ENUM_OID_INFO pfnEnumOIDInfo);
export extern(Windows) LPCWSTR CryptFindLocalizedName(LPCWSTR pwszCryptName);

enum CRYPT_LOCALIZED_NAME_ENCODING_TYPE = 0;
const char* CRYPT_LOCALIZED_NAME_OID = "LocalizedNames";

enum HCRYPTMSG : void* {init = (void*).init}

const char* szOID_PKCS_7_DATA = "1.2.840.113549.1.7.1";
const char* szOID_PKCS_7_SIGNED = "1.2.840.113549.1.7.2";
const char* szOID_PKCS_7_ENVELOPED = "1.2.840.113549.1.7.3";
const char* szOID_PKCS_7_SIGNEDANDENVELOPED = "1.2.840.113549.1.7.4";
const char* szOID_PKCS_7_DIGESTED = "1.2.840.113549.1.7.5";
const char* szOID_PKCS_7_ENCRYPTED = "1.2.840.113549.1.7.6";
const char* szOID_PKCS_9_CONTENT_TYPE = "1.2.840.113549.1.9.3";
const char* szOID_PKCS_9_MESSAGE_DIGEST = "1.2.840.113549.1.9.4";

enum {
	CMSG_DATA                      = 1,
	CMSG_SIGNED                    = 2,
	CMSG_ENVELOPED                 = 3,
	CMSG_SIGNED_AND_ENVELOPED      = 4,
	CMSG_HASHED                    = 5,
	CMSG_ENCRYPTED                 = 6,
	CMSG_ALL_FLAGS                 = ~0U,
	CMSG_DATA_FLAG                 = 1 << CMSG_DATA,
	CMSG_SIGNED_FLAG               = 1 << CMSG_SIGNED,
	CMSG_ENVELOPED_FLAG            = 1 << CMSG_ENVELOPED,
	CMSG_SIGNED_AND_ENVELOPED_FLAG = 1 << CMSG_SIGNED_AND_ENVELOPED,
	CMSG_HASHED_FLAG               = 1 << CMSG_HASHED,
	CMSG_ENCRYPTED_FLAG            = 1 << CMSG_ENCRYPTED,
}

struct CERT_ISSUER_SERIAL_NUMBER {
	CERT_NAME_BLOB Issuer;
	CRYPT_INTEGER_BLOB SerialNumber;
}
alias CERT_ISSUER_SERIAL_NUMBER* PCERT_ISSUER_SERIAL_NUMBER;

struct CERT_ID {
	DWORD dwIdChoice;
	union {
		CERT_ISSUER_SERIAL_NUMBER IssuerSerialNumber;
		CRYPT_HASH_BLOB KeyId;
		CRYPT_HASH_BLOB HashId;
	}
}
alias CERT_ID* PCERT_ID;

enum {
	CERT_ID_ISSUER_SERIAL_NUMBER = 1,
	CERT_ID_KEY_IDENTIFIER       = 2,
	CERT_ID_SHA1_HASH            = 3,
}

struct CMSG_SIGNER_ENCODE_INFO {
	DWORD cbSize;
	PCERT_INFO pCertInfo;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	void* pvHashAuxInfo;
	DWORD cAuthAttr;
	PCRYPT_ATTRIBUTE rgAuthAttr;
	DWORD cUnauthAttr;
	PCRYPT_ATTRIBUTE rgUnauthAttr;
	//CMSG_SIGNER_ENCODE_INFO_HAS_CMS_FIELDS
		CERT_ID SignerId;
		CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
		void* pvHashEncryptionAuxInfo;
}
alias CMSG_SIGNER_ENCODE_INFO* PCMSG_SIGNER_ENCODE_INFO;

struct CMSG_SIGNED_ENCODE_INFO {
	DWORD cbSize;
	DWORD cSigners;
	PCMSG_SIGNER_ENCODE_INFO rgSigners;
	DWORD cCertEncoded;
	PCERT_BLOB rgCertEncoded;
	DWORD cCrlEncoded;
	PCRL_BLOB rgCrlEncoded;
	//CMSG_SIGNED_ENCODE_INFO_HAS_CMS_FIELDS
		DWORD cAttrCertEncoded;
		PCERT_BLOB rgAttrCertEncoded;
}
alias CMSG_SIGNED_ENCODE_INFO* PCMSG_SIGNED_ENCODE_INFO;

struct CMSG_ENVELOPED_ENCODE_INFO {
	DWORD cbSize;
	HCRYPTPROV_LEGACY hCryptProv;
	CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
	void* pvEncryptionAuxInfo;
	DWORD cRecipients;
	PCERT_INFO* rgpRecipients;
	//CMSG_ENVELOPED_ENCODE_INFO_HAS_CMS_FIELDS
		PCMSG_RECIPIENT_ENCODE_INFO rgCmsRecipients;
		DWORD cCertEncoded;
		PCERT_BLOB rgCertEncoded;
		DWORD cCrlEncoded;
		PCRL_BLOB rgCrlEncoded;
		DWORD cAttrCertEncoded;
		PCERT_BLOB rgAttrCertEncoded;
		DWORD cUnprotectedAttr;
		PCRYPT_ATTRIBUTE rgUnprotectedAttr;
}
alias CMSG_ENVELOPED_ENCODE_INFO* PCMSG_ENVELOPED_ENCODE_INFO;

struct CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO {
 DWORD cbSize;
 CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
 void* pvKeyEncryptionAuxInfo;
 HCRYPTPROV_LEGACY hCryptProv;
 CRYPT_BIT_BLOB RecipientPublicKey;
 CERT_ID RecipientId;
}
alias CMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO* PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO;

struct CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO {
	DWORD cbSize;
	CRYPT_BIT_BLOB RecipientPublicKey;
	CERT_ID RecipientId;
	FILETIME Date;
	PCRYPT_ATTRIBUTE_TYPE_VALUE pOtherAttr;
}
alias CMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO* PCMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO;

struct CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO {
	DWORD cbSize;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	void* pvKeyEncryptionAuxInfo;
	CRYPT_ALGORITHM_IDENTIFIER KeyWrapAlgorithm;
	void* pvKeyWrapAuxInfo;
	HCRYPTPROV_LEGACY hCryptProv;
	DWORD dwKeySpec;
	DWORD dwKeyChoice;
	union {
		PCRYPT_ALGORITHM_IDENTIFIER pEphemeralAlgorithm;
		PCERT_ID pSenderId;
	}
	CRYPT_DATA_BLOB UserKeyingMaterial;
	DWORD cRecipientEncryptedKeys;
	PCMSG_RECIPIENT_ENCRYPTED_KEY_ENCODE_INFO* rgpRecipientEncryptedKeys;
}
alias CMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO* PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO;

enum {
	CMSG_KEY_AGREE_EPHEMERAL_KEY_CHOICE = 1,
	CMSG_KEY_AGREE_STATIC_KEY_CHOICE    = 2,
}

struct CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO {
	DWORD cbSize;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	void* pvKeyEncryptionAuxInfo;
	HCRYPTPROV hCryptProv;
	DWORD dwKeyChoice;
	union {
		HCRYPTKEY hKeyEncryptionKey;
		void* pvKeyEncryptionKey;
	}
	CRYPT_DATA_BLOB KeyId;
	FILETIME Date;
	PCRYPT_ATTRIBUTE_TYPE_VALUE pOtherAttr;
}
alias CMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO* PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO;

enum CMSG_MAIL_LIST_HANDLE_KEY_CHOICE = 1;

struct CMSG_RECIPIENT_ENCODE_INFO {
	DWORD dwRecipientChoice;
	union {
		PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO pKeyTrans;
		PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO pKeyAgree;
		PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO pMailList;
	}
}
alias CMSG_RECIPIENT_ENCODE_INFO* PCMSG_RECIPIENT_ENCODE_INFO;

enum {
	CMSG_KEY_TRANS_RECIPIENT = 1,
	CMSG_KEY_AGREE_RECIPIENT = 2,
	CMSG_MAIL_LIST_RECIPIENT = 3,
}

struct CMSG_RC2_AUX_INFO {
	DWORD cbSize;
	DWORD dwBitLen;
}
alias CMSG_RC2_AUX_INFO* PCMSG_RC2_AUX_INFO;

struct CMSG_SP3_COMPATIBLE_AUX_INFO {
	DWORD cbSize;
	DWORD dwFlags;
}
alias CMSG_SP3_COMPATIBLE_AUX_INFO* PCMSG_SP3_COMPATIBLE_AUX_INFO;

enum CMSG_SP3_COMPATIBLE_ENCRYPT_FLAG = 0x80000000;

struct CMSG_RC4_AUX_INFO {
	DWORD cbSize;
	DWORD dwBitLen;
}
alias CMSG_RC4_AUX_INFO* PCMSG_RC4_AUX_INFO;

enum CMSG_RC4_NO_SALT_FLAG = 0x40000000;

struct CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO {
	DWORD cbSize;
	CMSG_SIGNED_ENCODE_INFO SignedInfo;
	CMSG_ENVELOPED_ENCODE_INFO EnvelopedInfo;
}
alias CMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO* PCMSG_SIGNED_AND_ENVELOPED_ENCODE_INFO;

struct CMSG_HASHED_ENCODE_INFO {
	DWORD cbSize;
	HCRYPTPROV_LEGACY hCryptProv;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	void* pvHashAuxInfo;
}
alias CMSG_HASHED_ENCODE_INFO* PCMSG_HASHED_ENCODE_INFO;

struct CMSG_ENCRYPTED_ENCODE_INFO {
	DWORD cbSize;
	CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
	void* pvEncryptionAuxInfo;
}
alias CMSG_ENCRYPTED_ENCODE_INFO* PCMSG_ENCRYPTED_ENCODE_INFO;

alias extern(Windows) BOOL function(const(void)* pvArg, BYTE* pbData, DWORD cbData, BOOL fFinal) PFN_CMSG_STREAM_OUTPUT;

enum CMSG_INDEFINITE_LENGTH = 0xFFFFFFFF;

struct CMSG_STREAM_INFO {
	DWORD cbContent;
	PFN_CMSG_STREAM_OUTPUT pfnStreamOutput;
	void* pvArg;
}
alias CMSG_STREAM_INFO* PCMSG_STREAM_INFO;

enum {
	CMSG_BARE_CONTENT_FLAG             = 0x00000001,
	CMSG_LENGTH_ONLY_FLAG              = 0x00000002,
	CMSG_DETACHED_FLAG                 = 0x00000004,
	CMSG_AUTHENTICATED_ATTRIBUTES_FLAG = 0x00000008,
	CMSG_CONTENTS_OCTETS_FLAG          = 0x00000010,
	CMSG_MAX_LENGTH_FLAG               = 0x00000020,
	CMSG_CMS_ENCAPSULATED_CONTENT_FLAG = 0x00000040,
	CMSG_CRYPT_RELEASE_CONTEXT_FLAG    = 0x00008000,
}

export extern(Windows) HCRYPTMSG CryptMsgOpenToEncode(DWORD dwMsgEncodingType, DWORD dwFlags, DWORD dwMsgType, void* pvMsgEncodeInfo, LPSTR pszInnerContentObjID, PCMSG_STREAM_INFO pStreamInfo);
export extern(Windows) DWORD CryptMsgCalculateEncodedLength(DWORD dwMsgEncodingType, DWORD dwFlags, DWORD dwMsgType, void* pvMsgEncodeInfo, LPSTR pszInnerContentObjID, DWORD cbData);
export extern(Windows) HCRYPTMSG CryptMsgOpenToDecode(DWORD dwMsgEncodingType, DWORD dwFlags, DWORD dwMsgType, HCRYPTPROV_LEGACY hCryptProv, PCERT_INFO pRecipientInfo, PCMSG_STREAM_INFO pStreamInfo);
export extern(Windows) HCRYPTMSG CryptMsgDuplicate(HCRYPTMSG hCryptMsg);
export extern(Windows) BOOL CryptMsgClose(HCRYPTMSG hCryptMsg);
export extern(Windows) BOOL CryptMsgUpdate(HCRYPTMSG hCryptMsg, const(BYTE)* pbData, DWORD cbData, BOOL fFinal);
export extern(Windows) BOOL CryptMsgGetParam(HCRYPTMSG hCryptMsg, DWORD dwParamType, DWORD dwIndex, void* pvData, DWORD* pcbData);

enum {
	CMSG_TYPE_PARAM                              = 1,
	CMSG_CONTENT_PARAM                           = 2,
	CMSG_BARE_CONTENT_PARAM                      = 3,
	CMSG_INNER_CONTENT_TYPE_PARAM                = 4,
	CMSG_SIGNER_COUNT_PARAM                      = 5,
	CMSG_SIGNER_INFO_PARAM                       = 6,
	CMSG_SIGNER_CERT_INFO_PARAM                  = 7,
	CMSG_SIGNER_HASH_ALGORITHM_PARAM             = 8,
	CMSG_SIGNER_AUTH_ATTR_PARAM                  = 9,
	CMSG_SIGNER_UNAUTH_ATTR_PARAM                = 10,
	CMSG_CERT_COUNT_PARAM                        = 11,
	CMSG_CERT_PARAM                              = 12,
	CMSG_CRL_COUNT_PARAM                         = 13,
	CMSG_CRL_PARAM                               = 14,
	CMSG_ENVELOPE_ALGORITHM_PARAM                = 15,
	CMSG_RECIPIENT_COUNT_PARAM                   = 17,
	CMSG_RECIPIENT_INDEX_PARAM                   = 18,
	CMSG_RECIPIENT_INFO_PARAM                    = 19,
	CMSG_HASH_ALGORITHM_PARAM                    = 20,
	CMSG_HASH_DATA_PARAM                         = 21,
	CMSG_COMPUTED_HASH_PARAM                     = 22,
	CMSG_ENCRYPT_PARAM                           = 26,
	CMSG_ENCRYPTED_DIGEST                        = 27,
	CMSG_ENCODED_SIGNER                          = 28,
	CMSG_ENCODED_MESSAGE                         = 29,
	CMSG_VERSION_PARAM                           = 30,
	CMSG_ATTR_CERT_COUNT_PARAM                   = 31,
	CMSG_ATTR_CERT_PARAM                         = 32,
	CMSG_CMS_RECIPIENT_COUNT_PARAM               = 33,
	CMSG_CMS_RECIPIENT_INDEX_PARAM               = 34,
	CMSG_CMS_RECIPIENT_ENCRYPTED_KEY_INDEX_PARAM = 35,
	CMSG_CMS_RECIPIENT_INFO_PARAM                = 36,
	CMSG_UNPROTECTED_ATTR_PARAM                  = 37,
	CMSG_SIGNER_CERT_ID_PARAM                    = 38,
	CMSG_CMS_SIGNER_INFO_PARAM                   = 39,
}

struct CMSG_SIGNER_INFO {
	DWORD dwVersion;
	CERT_NAME_BLOB Issuer;
	CRYPT_INTEGER_BLOB SerialNumber;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedHash;
	CRYPT_ATTRIBUTES AuthAttrs;
	CRYPT_ATTRIBUTES UnauthAttrs;
}
alias CMSG_SIGNER_INFO* PCMSG_SIGNER_INFO;

struct CMSG_CMS_SIGNER_INFO {
	DWORD dwVersion;
	CERT_ID SignerId;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedHash;
	CRYPT_ATTRIBUTES AuthAttrs;
	CRYPT_ATTRIBUTES UnauthAttrs;
}
alias CMSG_CMS_SIGNER_INFO* PCMSG_CMS_SIGNER_INFO;

alias CRYPT_ATTRIBUTES CMSG_ATTR;
alias CRYPT_ATTRIBUTES* PCMSG_ATTR;

enum {
	CMSG_SIGNED_DATA_V1                  = 1,
	CMSG_SIGNED_DATA_V3                  = 3,
	CMSG_SIGNED_DATA_PKCS_1_5_VERSION    = CMSG_SIGNED_DATA_V1,
	CMSG_SIGNED_DATA_CMS_VERSION         = CMSG_SIGNED_DATA_V3,
	CMSG_SIGNER_INFO_V1                  = 1,
	CMSG_SIGNER_INFO_V3                  = 3,
	CMSG_SIGNER_INFO_PKCS_1_5_VERSION    = CMSG_SIGNER_INFO_V1,
	CMSG_SIGNER_INFO_CMS_VERSION         = CMSG_SIGNER_INFO_V3,
	CMSG_HASHED_DATA_V0                  = 0,
	CMSG_HASHED_DATA_V2                  = 2,
	CMSG_HASHED_DATA_PKCS_1_5_VERSION    = CMSG_HASHED_DATA_V0,
	CMSG_HASHED_DATA_CMS_VERSION         = CMSG_HASHED_DATA_V2,
	CMSG_ENVELOPED_DATA_V0               = 0,
	CMSG_ENVELOPED_DATA_V2               = 2,
	CMSG_ENVELOPED_DATA_PKCS_1_5_VERSION = CMSG_ENVELOPED_DATA_V0,
	CMSG_ENVELOPED_DATA_CMS_VERSION      = CMSG_ENVELOPED_DATA_V2,
}

struct CMSG_KEY_TRANS_RECIPIENT_INFO {
	DWORD dwVersion;
	CERT_ID RecipientId;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedKey;
}
alias CMSG_KEY_TRANS_RECIPIENT_INFO* PCMSG_KEY_TRANS_RECIPIENT_INFO;

struct CMSG_RECIPIENT_ENCRYPTED_KEY_INFO {
	CERT_ID RecipientId;
	CRYPT_DATA_BLOB EncryptedKey;
	FILETIME Date;
	PCRYPT_ATTRIBUTE_TYPE_VALUE pOtherAttr;
}
alias CMSG_RECIPIENT_ENCRYPTED_KEY_INFO* PCMSG_RECIPIENT_ENCRYPTED_KEY_INFO;

struct CMSG_KEY_AGREE_RECIPIENT_INFO{
	DWORD dwVersion;
	DWORD dwOriginatorChoice;
	union {
		CERT_ID OriginatorCertId;
		CERT_PUBLIC_KEY_INFO OriginatorPublicKeyInfo;
	}
	CRYPT_DATA_BLOB UserKeyingMaterial;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	DWORD cRecipientEncryptedKeys;
	PCMSG_RECIPIENT_ENCRYPTED_KEY_INFO* rgpRecipientEncryptedKeys;
}
alias CMSG_KEY_AGREE_RECIPIENT_INFO* PCMSG_KEY_AGREE_RECIPIENT_INFO;

enum {
	CMSG_KEY_AGREE_ORIGINATOR_CERT       = 1,
	CMSG_KEY_AGREE_ORIGINATOR_PUBLIC_KEY = 2,
}

struct CMSG_MAIL_LIST_RECIPIENT_INFO {
	DWORD dwVersion;
	CRYPT_DATA_BLOB KeyId;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedKey;
	FILETIME Date;
	PCRYPT_ATTRIBUTE_TYPE_VALUE pOtherAttr;
}
alias CMSG_MAIL_LIST_RECIPIENT_INFO* PCMSG_MAIL_LIST_RECIPIENT_INFO;

struct CMSG_CMS_RECIPIENT_INFO {
	DWORD dwRecipientChoice;
	union {
		PCMSG_KEY_TRANS_RECIPIENT_INFO pKeyTrans;
		PCMSG_KEY_AGREE_RECIPIENT_INFO pKeyAgree;
		PCMSG_MAIL_LIST_RECIPIENT_INFO pMailList;
	}
}
alias CMSG_CMS_RECIPIENT_INFO* PCMSG_CMS_RECIPIENT_INFO;

enum {
	CMSG_ENVELOPED_RECIPIENT_V0     = 0,
	CMSG_ENVELOPED_RECIPIENT_V2     = 2,
	CMSG_ENVELOPED_RECIPIENT_V3     = 3,
	CMSG_ENVELOPED_RECIPIENT_V4     = 4,
	CMSG_KEY_TRANS_PKCS_1_5_VERSION = CMSG_ENVELOPED_RECIPIENT_V0,
	CMSG_KEY_TRANS_CMS_VERSION      = CMSG_ENVELOPED_RECIPIENT_V2,
	CMSG_KEY_AGREE_VERSION          = CMSG_ENVELOPED_RECIPIENT_V3,
	CMSG_MAIL_LIST_VERSION          = CMSG_ENVELOPED_RECIPIENT_V4,
}

export extern(Windows) BOOL CryptMsgControl(HCRYPTMSG hCryptMsg, DWORD dwFlags, DWORD dwCtrlType, void* pvCtrlPara);

enum {
	CMSG_CTRL_VERIFY_SIGNATURE       = 1,
	CMSG_CTRL_DECRYPT                = 2,
	CMSG_CTRL_VERIFY_HASH            = 5,
	CMSG_CTRL_ADD_SIGNER             = 6,
	CMSG_CTRL_DEL_SIGNER             = 7,
	CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR = 8,
	CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR = 9,
	CMSG_CTRL_ADD_CERT               = 10,
	CMSG_CTRL_DEL_CERT               = 11,
	CMSG_CTRL_ADD_CRL                = 12,
	CMSG_CTRL_DEL_CRL                = 13,
	CMSG_CTRL_ADD_ATTR_CERT          = 14,
	CMSG_CTRL_DEL_ATTR_CERT          = 15,
	CMSG_CTRL_KEY_TRANS_DECRYPT      = 16,
	CMSG_CTRL_KEY_AGREE_DECRYPT      = 17,
	CMSG_CTRL_MAIL_LIST_DECRYPT      = 18,
	CMSG_CTRL_VERIFY_SIGNATURE_EX    = 19,
	CMSG_CTRL_ADD_CMS_SIGNER_INFO    = 20,
}

struct CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA {
	DWORD cbSize;
	HCRYPTPROV_LEGACY hCryptProv;
	DWORD dwSignerIndex;
	DWORD dwSignerType;
	void* pvSigner;
}
alias CMSG_CTRL_VERIFY_SIGNATURE_EX_PARA* PCMSG_CTRL_VERIFY_SIGNATURE_EX_PARA;

enum {
	CMSG_VERIFY_SIGNER_PUBKEY = 1,
	CMSG_VERIFY_SIGNER_CERT   = 2,
	CMSG_VERIFY_SIGNER_CHAIN  = 3,
	CMSG_VERIFY_SIGNER_NULL   = 4,
}

struct CMSG_CTRL_DECRYPT_PARA {
	DWORD cbSize;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
	DWORD dwRecipientIndex;
}
alias CMSG_CTRL_DECRYPT_PARA* PCMSG_CTRL_DECRYPT_PARA;

struct CMSG_CTRL_KEY_TRANS_DECRYPT_PARA {
	DWORD cbSize;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
	PCMSG_KEY_TRANS_RECIPIENT_INFO pKeyTrans;
	DWORD dwRecipientIndex;
}
alias CMSG_CTRL_KEY_TRANS_DECRYPT_PARA* PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA;

struct CMSG_CTRL_KEY_AGREE_DECRYPT_PARA {
	DWORD cbSize;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
	PCMSG_KEY_AGREE_RECIPIENT_INFO pKeyAgree;
	DWORD dwRecipientIndex;
	DWORD dwRecipientEncryptedKeyIndex;
	CRYPT_BIT_BLOB OriginatorPublicKey;
}
alias CMSG_CTRL_KEY_AGREE_DECRYPT_PARA* PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA;

struct CMSG_CTRL_MAIL_LIST_DECRYPT_PARA {
	DWORD cbSize;
	HCRYPTPROV hCryptProv;
	PCMSG_MAIL_LIST_RECIPIENT_INFO pMailList;
	DWORD dwRecipientIndex;
	DWORD dwKeyChoice;
	union {
		HCRYPTKEY hKeyEncryptionKey;
		void* pvKeyEncryptionKey;
	}
}
alias CMSG_CTRL_MAIL_LIST_DECRYPT_PARA* PCMSG_CTRL_MAIL_LIST_DECRYPT_PARA;

struct CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA {
	DWORD cbSize;
	DWORD dwSignerIndex;
	CRYPT_DATA_BLOB blob;
}
alias CMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA* PCMSG_CTRL_ADD_SIGNER_UNAUTH_ATTR_PARA;

struct CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA {
	DWORD cbSize;
	DWORD dwSignerIndex;
	DWORD dwUnauthAttrIndex;
}
alias CMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA* PCMSG_CTRL_DEL_SIGNER_UNAUTH_ATTR_PARA;

export extern(Windows){
	BOOL CryptMsgVerifyCountersignatureEncoded(HCRYPTPROV_LEGACY hCryptProv, DWORD dwEncodingType, PBYTE pbSignerInfo, DWORD cbSignerInfo, PBYTE pbSignerInfoCountersignature, DWORD cbSignerInfoCountersignature, PCERT_INFO pciCountersigner);
	BOOL CryptMsgVerifyCountersignatureEncodedEx(HCRYPTPROV_LEGACY hCryptProv, DWORD dwEncodingType, PBYTE pbSignerInfo, DWORD cbSignerInfo, PBYTE pbSignerInfoCountersignature, DWORD cbSignerInfoCountersignature, DWORD dwSignerType, void* pvSigner, DWORD dwFlags, void* pvReserved);
	BOOL CryptMsgCountersign(HCRYPTMSG hCryptMsg, DWORD dwIndex, DWORD cCountersigners, PCMSG_SIGNER_ENCODE_INFO rgCountersigners);
	BOOL CryptMsgCountersignEncoded(DWORD dwEncodingType, PBYTE pbSignerInfo, DWORD cbSignerInfo, DWORD cCountersigners, PCMSG_SIGNER_ENCODE_INFO rgCountersigners, PBYTE pbCountersignature, PDWORD pcbCountersignature);
}

alias extern(Windows) void* function(size_t cb) PFN_CMSG_ALLOC;
alias extern(Windows) void function(void* pv) PFN_CMSG_FREE;

const char* CMSG_OID_GEN_ENCRYPT_KEY_FUNC = "CryptMsgDllGenEncryptKey";
alias extern(Windows) BOOL function(HCRYPTPROV* phCryptProv, PCRYPT_ALGORITHM_IDENTIFIER paiEncrypt, PVOID pvEncryptAuxInfo, PCERT_PUBLIC_KEY_INFO pPublicKeyInfo, PFN_CMSG_ALLOC pfnAlloc, HCRYPTKEY* phEncryptKey, PBYTE* ppbEncryptParameters, PDWORD pcbEncryptParameters) PFN_CMSG_GEN_ENCRYPT_KEY;
const char* CMSG_OID_EXPORT_ENCRYPT_KEY_FUNC = "CryptMsgDllExportEncryptKey";
alias extern(Windows) BOOL function(HCRYPTPROV hCryptProv, HCRYPTKEY hEncryptKey, PCERT_PUBLIC_KEY_INFO pPublicKeyInfo, PBYTE pbData, PDWORD pcbData) PFN_CMSG_EXPORT_ENCRYPT_KEY;
const char* CMSG_OID_IMPORT_ENCRYPT_KEY_FUNC = "CryptMsgDllImportEncryptKey";
alias extern(Windows) BOOL function(HCRYPTPROV hCryptProv, DWORD dwKeySpec, PCRYPT_ALGORITHM_IDENTIFIER paiEncrypt, PCRYPT_ALGORITHM_IDENTIFIER paiPubKey, PBYTE pbEncodedKey, DWORD cbEncodedKey, HCRYPTKEY* phEncryptKey) PFN_CMSG_IMPORT_ENCRYPT_KEY;

const LPCSTR CMSG_DEFAULT_INSTALLABLE_FUNC_OID = cast(LPCSTR)1;

struct CMSG_CONTENT_ENCRYPT_INFO {
	DWORD cbSize;
	HCRYPTPROV_LEGACY hCryptProv;
	CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
	void* pvEncryptionAuxInfo;
	DWORD cRecipients;
	PCMSG_RECIPIENT_ENCODE_INFO rgCmsRecipients;
	PFN_CMSG_ALLOC pfnAlloc;
	PFN_CMSG_FREE pfnFree;
	DWORD dwEncryptFlags;
	union {
		HCRYPTKEY hContentEncryptKey;
		BCRYPT_KEY_HANDLE hCNGContentEncryptKey;
	}
	DWORD dwFlags;
	BOOL fCNG;
	BYTE* pbCNGContentEncryptKeyObject;
	BYTE* pbContentEncryptKey;
	DWORD cbContentEncryptKey;
}
alias CMSG_CONTENT_ENCRYPT_INFO* PCMSG_CONTENT_ENCRYPT_INFO;

enum {
	CMSG_CONTENT_ENCRYPT_PAD_ENCODED_LEN_FLAG = 0x00000001,
	CMSG_CONTENT_ENCRYPT_FREE_PARA_FLAG       = 0x00000001,
	CMSG_CONTENT_ENCRYPT_FREE_OBJID_FLAG      = 0x00000002,
	CMSG_CONTENT_ENCRYPT_RELEASE_CONTEXT_FLAG = 0x00008000,
}

const char* CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllGenContentEncryptKey";
alias CMSG_OID_GEN_CONTENT_ENCRYPT_KEY_FUNC CMSG_OID_CAPI1_GEN_CONTENT_ENCRYPT_KEY_FUNC;
alias extern(Windows) BOOL function(PCMSG_CONTENT_ENCRYPT_INFO pContentEncryptInfo, DWORD dwFlags, void* pvReserved) PFN_CMSG_GEN_CONTENT_ENCRYPT_KEY;
const char* CMSG_OID_CNG_GEN_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllCNGGenContentEncryptKey";

struct CMSG_KEY_TRANS_ENCRYPT_INFO {
	DWORD cbSize;
	DWORD dwRecipientIndex;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedKey;
	DWORD dwFlags;
}
alias CMSG_KEY_TRANS_ENCRYPT_INFO* PCMSG_KEY_TRANS_ENCRYPT_INFO;

enum {
	CMSG_KEY_TRANS_ENCRYPT_FREE_PARA_FLAG  = 0x00000001,
	CMSG_KEY_TRANS_ENCRYPT_FREE_OBJID_FLAG = 0x00000002,
}

const char* CMSG_OID_EXPORT_KEY_TRANS_FUNC = "CryptMsgDllExportKeyTrans";
alias CMSG_OID_EXPORT_KEY_TRANS_FUNC CMSG_OID_CAPI1_EXPORT_KEY_TRANS_FUNC;
alias extern(Windows) BOOL function(PCMSG_CONTENT_ENCRYPT_INFO pContentEncryptInfo, PCMSG_KEY_TRANS_RECIPIENT_ENCODE_INFO pKeyTransEncodeInfo, PCMSG_KEY_TRANS_ENCRYPT_INFO pKeyTransEncryptInfo, DWORD dwFlags, void* pvReserved) PFN_CMSG_EXPORT_KEY_TRANS;
const char* CMSG_OID_CNG_EXPORT_KEY_TRANS_FUNC = "CryptMsgDllCNGExportKeyTrans";

struct CMSG_KEY_AGREE_KEY_ENCRYPT_INFO {
	DWORD cbSize;
	CRYPT_DATA_BLOB EncryptedKey;
}
alias CMSG_KEY_AGREE_KEY_ENCRYPT_INFO* PCMSG_KEY_AGREE_KEY_ENCRYPT_INFO;

struct CMSG_KEY_AGREE_ENCRYPT_INFO {
	DWORD cbSize;
	DWORD dwRecipientIndex;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	CRYPT_DATA_BLOB UserKeyingMaterial;
	DWORD dwOriginatorChoice;
	union {
		CERT_ID OriginatorCertId;
		CERT_PUBLIC_KEY_INFO OriginatorPublicKeyInfo;
	}
	DWORD cKeyAgreeKeyEncryptInfo;
	PCMSG_KEY_AGREE_KEY_ENCRYPT_INFO* rgpKeyAgreeKeyEncryptInfo;
	DWORD dwFlags;
}
alias CMSG_KEY_AGREE_ENCRYPT_INFO* PCMSG_KEY_AGREE_ENCRYPT_INFO;

enum {
	CMSG_KEY_AGREE_ENCRYPT_FREE_PARA_FLAG        = 0x00000001,
	CMSG_KEY_AGREE_ENCRYPT_FREE_MATERIAL_FLAG    = 0x00000002,
	CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_ALG_FLAG  = 0x00000004,
	CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_PARA_FLAG = 0x00000008,
	CMSG_KEY_AGREE_ENCRYPT_FREE_PUBKEY_BITS_FLAG = 0x00000010,
	CMSG_KEY_AGREE_ENCRYPT_FREE_OBJID_FLAG       = 0x00000020,
}

const char* CMSG_OID_EXPORT_KEY_AGREE_FUNC = "CryptMsgDllExportKeyAgree";
alias CMSG_OID_EXPORT_KEY_AGREE_FUNC CMSG_OID_CAPI1_EXPORT_KEY_AGREE_FUNC;
alias extern(Windows) BOOL function(PCMSG_CONTENT_ENCRYPT_INFO pContentEncryptInfo, PCMSG_KEY_AGREE_RECIPIENT_ENCODE_INFO pKeyAgreeEncodeInfo, PCMSG_KEY_AGREE_ENCRYPT_INFO pKeyAgreeEncryptInfo, DWORD dwFlags, void* pvReserved) PFN_CMSG_EXPORT_KEY_AGREE;
const char* CMSG_OID_CNG_EXPORT_KEY_AGREE_FUNC = "CryptMsgDllCNGExportKeyAgree";

struct CMSG_MAIL_LIST_ENCRYPT_INFO {
	DWORD cbSize;
	DWORD dwRecipientIndex;
	CRYPT_ALGORITHM_IDENTIFIER KeyEncryptionAlgorithm;
	CRYPT_DATA_BLOB EncryptedKey;
	DWORD dwFlags;
}
alias CMSG_MAIL_LIST_ENCRYPT_INFO* PCMSG_MAIL_LIST_ENCRYPT_INFO;

enum {
	CMSG_MAIL_LIST_ENCRYPT_FREE_PARA_FLAG  = 0x00000001,
	CMSG_MAIL_LIST_ENCRYPT_FREE_OBJID_FLAG = 0x00000002,
}

const char* CMSG_OID_EXPORT_MAIL_LIST_FUNC = "CryptMsgDllExportMailList";
alias CMSG_OID_EXPORT_MAIL_LIST_FUNC CMSG_OID_CAPI1_EXPORT_MAIL_LIST_FUNC;
alias extern(Windows) BOOL function(PCMSG_CONTENT_ENCRYPT_INFO pContentEncryptInfo, PCMSG_MAIL_LIST_RECIPIENT_ENCODE_INFO pMailListEncodeInfo, PCMSG_MAIL_LIST_ENCRYPT_INFO pMailListEncryptInfo, DWORD dwFlags, void* pvReserved) PFN_CMSG_EXPORT_MAIL_LIST;

const char* CMSG_OID_IMPORT_KEY_TRANS_FUNC = "CryptMsgDllImportKeyTrans";
alias CMSG_OID_IMPORT_KEY_TRANS_FUNC CMSG_OID_CAPI1_IMPORT_KEY_TRANS_FUNC;
alias extern(Windows) BOOL function(PCRYPT_ALGORITHM_IDENTIFIER pContentEncryptionAlgorithm, PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA pKeyTransDecryptPara, DWORD dwFlags, void* pvReserved, HCRYPTKEY* phContentEncryptKey) PFN_CMSG_IMPORT_KEY_TRANS;

const char* CMSG_OID_IMPORT_KEY_AGREE_FUNC = "CryptMsgDllImportKeyAgree";
alias CMSG_OID_IMPORT_KEY_AGREE_FUNC CMSG_OID_CAPI1_IMPORT_KEY_AGREE_FUNC;
alias extern(Windows) BOOL function(PCRYPT_ALGORITHM_IDENTIFIER pContentEncryptionAlgorithm, PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA pKeyAgreeDecryptPara, DWORD dwFlags, void* pvReserved, HCRYPTKEY* phContentEncryptKey) PFN_CMSG_IMPORT_KEY_AGREE;

const char* CMSG_OID_IMPORT_MAIL_LIST_FUNC = "CryptMsgDllImportMailList";
alias CMSG_OID_IMPORT_MAIL_LIST_FUNC CMSG_OID_CAPI1_IMPORT_MAIL_LIST_FUNC;
alias extern(Windows) BOOL function(PCRYPT_ALGORITHM_IDENTIFIER pContentEncryptionAlgorithm, PCMSG_CTRL_MAIL_LIST_DECRYPT_PARA pMailListDecryptPara, DWORD dwFlags, void* pvReserved, HCRYPTKEY* phContentEncryptKey) PFN_CMSG_IMPORT_MAIL_LIST;

struct CMSG_CNG_CONTENT_DECRYPT_INFO {
	DWORD cbSize;
	CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
	PFN_CMSG_ALLOC pfnAlloc;
	PFN_CMSG_FREE pfnFree;
	NCRYPT_KEY_HANDLE hNCryptKey;
	BYTE* pbContentEncryptKey;
	DWORD cbContentEncryptKey;
	BCRYPT_KEY_HANDLE hCNGContentEncryptKey;
	BYTE* pbCNGContentEncryptKeyObject;
}
alias CMSG_CNG_CONTENT_DECRYPT_INFO* PCMSG_CNG_CONTENT_DECRYPT_INFO;

const char* CMSG_OID_CNG_IMPORT_KEY_TRANS_FUNC = "CryptMsgDllCNGImportKeyTrans";
alias extern(Windows) BOOL function(PCMSG_CNG_CONTENT_DECRYPT_INFO pCNGContentDecryptInfo, PCMSG_CTRL_KEY_TRANS_DECRYPT_PARA pKeyTransDecryptPara, DWORD dwFlags, void* pvReserved) PFN_CMSG_CNG_IMPORT_KEY_TRANS;

const char* CMSG_OID_CNG_IMPORT_KEY_AGREE_FUNC = "CryptMsgDllCNGImportKeyAgree";
alias extern(Windows) BOOL function(PCMSG_CNG_CONTENT_DECRYPT_INFO pCNGContentDecryptInfo, PCMSG_CTRL_KEY_AGREE_DECRYPT_PARA pKeyAgreeDecryptPara, DWORD dwFlags, void* pvReserved) PFN_CMSG_CNG_IMPORT_KEY_AGREE;

const char* CMSG_OID_CNG_IMPORT_CONTENT_ENCRYPT_KEY_FUNC = "CryptMsgDllCNGImportContentEncryptKey";
alias extern(Windows) BOOL function(PCMSG_CNG_CONTENT_DECRYPT_INFO pCNGContentDecryptInfo, DWORD dwFlags, void* pvReserved) PFN_CMSG_CNG_IMPORT_CONTENT_ENCRYPT_KEY;

enum HCERTSTORE : void* {init = (void*).init}

struct CERT_CONTEXT {
	DWORD dwCertEncodingType;
	BYTE* pbCertEncoded;
	DWORD cbCertEncoded;
	PCERT_INFO pCertInfo;
	HCERTSTORE hCertStore;
}
alias CERT_CONTEXT* PCERT_CONTEXT;
alias const(CERT_CONTEXT)* PCCERT_CONTEXT;

struct CRL_CONTEXT {
	DWORD dwCertEncodingType;
	BYTE* pbCrlEncoded;
	DWORD cbCrlEncoded;
	PCRL_INFO pCrlInfo;
	HCERTSTORE hCertStore;
}
alias CRL_CONTEXT* PCRL_CONTEXT;
alias const(CRL_CONTEXT)* PCCRL_CONTEXT;

struct CTL_CONTEXT {
	DWORD dwMsgAndCertEncodingType;
	BYTE* pbCtlEncoded;
	DWORD cbCtlEncoded;
	PCTL_INFO pCtlInfo;
	HCERTSTORE hCertStore;
	HCRYPTMSG hCryptMsg;
	BYTE* pbCtlContent;
	DWORD cbCtlContent;
}
alias CTL_CONTEXT* PCTL_CONTEXT;
alias const(CTL_CONTEXT)* PCCTL_CONTEXT;

enum {
	CERT_KEY_PROV_HANDLE_PROP_ID                    = 1,
	CERT_KEY_PROV_INFO_PROP_ID                      = 2,
	CERT_SHA1_HASH_PROP_ID                          = 3,
	CERT_MD5_HASH_PROP_ID                           = 4,
	CERT_HASH_PROP_ID                               = CERT_SHA1_HASH_PROP_ID,
	CERT_KEY_CONTEXT_PROP_ID                        = 5,
	CERT_KEY_SPEC_PROP_ID                           = 6,
	CERT_IE30_RESERVED_PROP_ID                      = 7,
	CERT_PUBKEY_HASH_RESERVED_PROP_ID               = 8,
	CERT_ENHKEY_USAGE_PROP_ID                       = 9,
	CERT_CTL_USAGE_PROP_ID                          = CERT_ENHKEY_USAGE_PROP_ID,
	CERT_NEXT_UPDATE_LOCATION_PROP_ID               = 10,
	CERT_FRIENDLY_NAME_PROP_ID                      = 11,
	CERT_PVK_FILE_PROP_ID                           = 12,
	CERT_DESCRIPTION_PROP_ID                        = 13,
	CERT_ACCESS_STATE_PROP_ID                       = 14,
	CERT_SIGNATURE_HASH_PROP_ID                     = 15,
	CERT_SMART_CARD_DATA_PROP_ID                    = 16,
	CERT_EFS_PROP_ID                                = 17,
	CERT_FORTEZZA_DATA_PROP_ID                      = 18,
	CERT_ARCHIVED_PROP_ID                           = 19,
	CERT_KEY_IDENTIFIER_PROP_ID                     = 20,
	CERT_AUTO_ENROLL_PROP_ID                        = 21,
	CERT_PUBKEY_ALG_PARA_PROP_ID                    = 22,
	CERT_CROSS_CERT_DIST_POINTS_PROP_ID             = 23,
	CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID         = 24,
	CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID        = 25,
	CERT_ENROLLMENT_PROP_ID                         = 26,
	CERT_DATE_STAMP_PROP_ID                         = 27,
	CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID      = 28,
	CERT_SUBJECT_NAME_MD5_HASH_PROP_ID              = 29,
	CERT_EXTENDED_ERROR_INFO_PROP_ID                = 30,
	CERT_RENEWAL_PROP_ID                            = 64,
	CERT_ARCHIVED_KEY_HASH_PROP_ID                  = 65,
	CERT_AUTO_ENROLL_RETRY_PROP_ID                  = 66,
	CERT_AIA_URL_RETRIEVED_PROP_ID                  = 67,
	CERT_AUTHORITY_INFO_ACCESS_PROP_ID              = 68,
	CERT_BACKED_UP_PROP_ID                          = 69,
	CERT_OCSP_RESPONSE_PROP_ID                      = 70,
	CERT_REQUEST_ORIGINATOR_PROP_ID                 = 71,
	CERT_SOURCE_LOCATION_PROP_ID                    = 72,
	CERT_SOURCE_URL_PROP_ID                         = 73,
	CERT_NEW_KEY_PROP_ID                            = 74,
	CERT_OCSP_CACHE_PREFIX_PROP_ID                  = 75,
	CERT_SMART_CARD_ROOT_INFO_PROP_ID               = 76,
	CERT_NO_AUTO_EXPIRE_CHECK_PROP_ID               = 77,
	CERT_NCRYPT_KEY_HANDLE_PROP_ID                  = 78,
	CERT_HCRYPTPROV_OR_NCRYPT_KEY_HANDLE_PROP_ID    = 79,
	CERT_SUBJECT_INFO_ACCESS_PROP_ID                = 80,
	CERT_CA_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID      = 81,
	CERT_CA_DISABLE_CRL_PROP_ID                     = 82,
	CERT_ROOT_PROGRAM_CERT_POLICIES_PROP_ID         = 83,
	CERT_ROOT_PROGRAM_NAME_CONSTRAINTS_PROP_ID      = 84,
	CERT_SUBJECT_OCSP_AUTHORITY_INFO_ACCESS_PROP_ID = 85,
	CERT_SUBJECT_DISABLE_CRL_PROP_ID                = 86,
	CERT_CEP_PROP_ID                                = 87,
	CERT_SIGN_HASH_CNG_ALG_PROP_ID                  = 89,
	CERT_SCARD_PIN_ID_PROP_ID                       = 90,
	CERT_SCARD_PIN_INFO_PROP_ID                     = 91,
	CERT_FIRST_RESERVED_PROP_ID                     = 92,
	CERT_LAST_RESERVED_PROP_ID                      = 0x00007FFF,
	CERT_FIRST_USER_PROP_ID                         = 0x00008000,
	CERT_LAST_USER_PROP_ID                          = 0x0000FFFF,
}

//	IS_CERT_HASH_PROP_ID(X) (CERT_SHA1_HASH_PROP_ID == (X) || 	 CERT_MD5_HASH_PROP_ID == (X) || 	 CERT_SIGNATURE_HASH_PROP_ID == (X))
//	IS_PUBKEY_HASH_PROP_ID(X) (CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID == (X) || 	 CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID == (X))
//	IS_CHAIN_HASH_PROP_ID(X) (CERT_ISSUER_PUBLIC_KEY_MD5_HASH_PROP_ID == (X) || 	 CERT_SUBJECT_PUBLIC_KEY_MD5_HASH_PROP_ID == (X) || 	 CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID == (X) || 	 CERT_SUBJECT_NAME_MD5_HASH_PROP_ID == (X))

const char* szOID_CERT_PROP_ID_PREFIX = "1.3.6.1.4.1.311.10.11.";

//	_szPROP_ID(PropId) #PropId
//	szOID_CERT_PROP_ID(PropId) szOID_CERT_PROP_ID_PREFIX _szPROP_ID(PropId)

//	__CRYPT32WTEXT(quote) L##quote
//	_CRYPT32WTEXT(quote) __CRYPT32WTEXT(quote)
//	wszOID_CERT_PROP_ID(PropId) 	 _CRYPT32WTEXT(szOID_CERT_PROP_ID_PREFIX) _CRYPT32WTEXT(_szPROP_ID(PropId))

const char* szOID_CERT_KEY_IDENTIFIER_PROP_ID = "1.3.6.1.4.1.311.10.11.20";
const char* szOID_CERT_ISSUER_SERIAL_NUMBER_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.28";
const char* szOID_CERT_SUBJECT_NAME_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.29";
const char* szOID_CERT_MD5_HASH_PROP_ID = "1.3.6.1.4.1.311.10.11.4";

enum {
	CERT_ACCESS_STATE_WRITE_PERSIST_FLAG   = 0x1,
	CERT_ACCESS_STATE_SYSTEM_STORE_FLAG    = 0x2,
	CERT_ACCESS_STATE_LM_SYSTEM_STORE_FLAG = 0x4,
	CERT_ACCESS_STATE_GP_SYSTEM_STORE_FLAG = 0x8,
}

struct CRYPT_KEY_PROV_PARAM {
	DWORD dwParam;
	BYTE* pbData;
	DWORD cbData;
	DWORD dwFlags;
}
alias CRYPT_KEY_PROV_PARAM* PCRYPT_KEY_PROV_PARAM;

struct CRYPT_KEY_PROV_INFO {
	LPWSTR pwszContainerName;
	LPWSTR pwszProvName;
	DWORD dwProvType;
	DWORD dwFlags;
	DWORD cProvParam;
	PCRYPT_KEY_PROV_PARAM rgProvParam;
	DWORD dwKeySpec;
}
alias CRYPT_KEY_PROV_INFO* PCRYPT_KEY_PROV_INFO;

enum {
	CERT_SET_KEY_PROV_HANDLE_PROP_ID = 0x00000001,
	CERT_SET_KEY_CONTEXT_PROP_ID     = 0x00000001,
	CERT_NCRYPT_KEY_SPEC             = 0xFFFFFFFF,
}

struct CERT_KEY_CONTEXT {
	DWORD cbSize;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
}
alias CERT_KEY_CONTEXT* PCERT_KEY_CONTEXT;

struct ROOT_INFO_LUID {
	DWORD LowPart;
	LONG HighPart;
}
alias ROOT_INFO_LUID* PROOT_INFO_LUID;

struct CRYPT_SMART_CARD_ROOT_INFO {
	BYTE[16] rgbCardID;
	ROOT_INFO_LUID luid;
}
alias CRYPT_SMART_CARD_ROOT_INFO* PCRYPT_SMART_CARD_ROOT_INFO;

const LPCSTR CERT_STORE_PROV_MSG = cast(LPCSTR)1;
const LPCSTR CERT_STORE_PROV_MEMORY = cast(LPCSTR)2;
const LPCSTR CERT_STORE_PROV_FILE = cast(LPCSTR)3;
const LPCSTR CERT_STORE_PROV_REG = cast(LPCSTR)4;
const LPCSTR CERT_STORE_PROV_PKCS7 = cast(LPCSTR)5;
const LPCSTR CERT_STORE_PROV_SERIALIZED = cast(LPCSTR)6;
const LPCSTR CERT_STORE_PROV_FILENAME_A = cast(LPCSTR)7;
const LPCSTR CERT_STORE_PROV_FILENAME_W = cast(LPCSTR)8;
alias CERT_STORE_PROV_FILENAME_W CERT_STORE_PROV_FILENAME;
const LPCSTR CERT_STORE_PROV_SYSTEM_A = cast(LPCSTR)9;
const LPCSTR CERT_STORE_PROV_SYSTEM_W = cast(LPCSTR)10;
alias CERT_STORE_PROV_SYSTEM_W CERT_STORE_PROV_SYSTEM;
const LPCSTR CERT_STORE_PROV_COLLECTION = cast(LPCSTR)11;
const LPCSTR CERT_STORE_PROV_SYSTEM_REGISTRY_A = cast(LPCSTR)12;
const LPCSTR CERT_STORE_PROV_SYSTEM_REGISTRY_W = cast(LPCSTR)13;
alias CERT_STORE_PROV_SYSTEM_REGISTRY_W CERT_STORE_PROV_SYSTEM_REGISTRY;
const LPCSTR CERT_STORE_PROV_PHYSICAL_W = cast(LPCSTR)14;
alias CERT_STORE_PROV_PHYSICAL_W CERT_STORE_PROV_PHYSICAL;
const LPCSTR CERT_STORE_PROV_SMART_CARD_W = cast(LPCSTR)15;
alias CERT_STORE_PROV_SMART_CARD_W CERT_STORE_PROV_SMART_CARD;
const LPCSTR CERT_STORE_PROV_LDAP_W = cast(LPCSTR)16;
alias CERT_STORE_PROV_LDAP_W CERT_STORE_PROV_LDAP;
const LPCSTR CERT_STORE_PROV_PKCS12 = cast(LPCSTR)17;

const char* sz_CERT_STORE_PROV_MEMORY = "Memory";
const char* sz_CERT_STORE_PROV_FILENAME_W = "File";
alias sz_CERT_STORE_PROV_FILENAME_W sz_CERT_STORE_PROV_FILENAME;
const char* sz_CERT_STORE_PROV_SYSTEM_W = "System";
alias sz_CERT_STORE_PROV_SYSTEM_W sz_CERT_STORE_PROV_SYSTEM;
const char* sz_CERT_STORE_PROV_PKCS7 = "PKCS7";
const char* sz_CERT_STORE_PROV_PKCS12 = "PKCS12";
const char* sz_CERT_STORE_PROV_SERIALIZED = "Serialized";
const char* sz_CERT_STORE_PROV_COLLECTION = "Collection";
const char* sz_CERT_STORE_PROV_SYSTEM_REGISTRY_W = "SystemRegistry";
alias sz_CERT_STORE_PROV_SYSTEM_REGISTRY_W sz_CERT_STORE_PROV_SYSTEM_REGISTRY;
const char* sz_CERT_STORE_PROV_PHYSICAL_W = "Physical";
alias sz_CERT_STORE_PROV_PHYSICAL_W sz_CERT_STORE_PROV_PHYSICAL;
const char* sz_CERT_STORE_PROV_SMART_CARD_W = "SmartCard";
alias sz_CERT_STORE_PROV_SMART_CARD_W sz_CERT_STORE_PROV_SMART_CARD;
const char* sz_CERT_STORE_PROV_LDAP_W = "Ldap";
alias sz_CERT_STORE_PROV_LDAP_W sz_CERT_STORE_PROV_LDAP;

enum {
	CERT_STORE_SIGNATURE_FLAG                   = 0x00000001,
	CERT_STORE_TIME_VALIDITY_FLAG               = 0x00000002,
	CERT_STORE_REVOCATION_FLAG                  = 0x00000004,
	CERT_STORE_NO_CRL_FLAG                      = 0x00010000,
	CERT_STORE_NO_ISSUER_FLAG                   = 0x00020000,
	CERT_STORE_BASE_CRL_FLAG                    = 0x00000100,
	CERT_STORE_DELTA_CRL_FLAG                   = 0x00000200,
	CERT_STORE_NO_CRYPT_RELEASE_FLAG            = 0x00000001,
	CERT_STORE_SET_LOCALIZED_NAME_FLAG          = 0x00000002,
	CERT_STORE_DEFER_CLOSE_UNTIL_LAST_FREE_FLAG = 0x00000004,
	CERT_STORE_DELETE_FLAG                      = 0x00000010,
	CERT_STORE_UNSAFE_PHYSICAL_FLAG             = 0x00000020,
	CERT_STORE_SHARE_STORE_FLAG                 = 0x00000040,
	CERT_STORE_SHARE_CONTEXT_FLAG               = 0x00000080,
	CERT_STORE_MANIFOLD_FLAG                    = 0x00000100,
	CERT_STORE_ENUM_ARCHIVED_FLAG               = 0x00000200,
	CERT_STORE_UPDATE_KEYID_FLAG                = 0x00000400,
	CERT_STORE_BACKUP_RESTORE_FLAG              = 0x00000800,
	CERT_STORE_READONLY_FLAG                    = 0x00008000,
	CERT_STORE_OPEN_EXISTING_FLAG               = 0x00004000,
	CERT_STORE_CREATE_NEW_FLAG                  = 0x00002000,
	CERT_STORE_MAXIMUM_ALLOWED_FLAG             = 0x00001000,
	CERT_SYSTEM_STORE_MASK                      = 0xFFFF0000,
	CERT_SYSTEM_STORE_RELOCATE_FLAG             = 0x80000000,
}

struct CERT_SYSTEM_STORE_RELOCATE_PARA {
	union {
		HKEY hKeyBase;
		void* pvBase;
	}
	union {
		void* pvSystemStore;
		LPCSTR pszSystemStore;
		LPCWSTR pwszSystemStore;
	}
}
alias CERT_SYSTEM_STORE_RELOCATE_PARA* PCERT_SYSTEM_STORE_RELOCATE_PARA;

enum {
	CERT_SYSTEM_STORE_UNPROTECTED_FLAG              = 0x40000000,
	CERT_SYSTEM_STORE_LOCATION_MASK                 = 0x00FF0000,
	CERT_SYSTEM_STORE_LOCATION_SHIFT                = 16,
	CERT_SYSTEM_STORE_CURRENT_USER_ID               = 1,
	CERT_SYSTEM_STORE_LOCAL_MACHINE_ID              = 2,
	CERT_SYSTEM_STORE_CURRENT_SERVICE_ID            = 4,
	CERT_SYSTEM_STORE_SERVICES_ID                   = 5,
	CERT_SYSTEM_STORE_USERS_ID                      = 6,
	CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY_ID  = 7,
	CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY_ID = 8,
	CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE_ID   = 9,
	CERT_SYSTEM_STORE_CURRENT_USER                  = CERT_SYSTEM_STORE_CURRENT_USER_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_LOCAL_MACHINE                 = CERT_SYSTEM_STORE_LOCAL_MACHINE_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_CURRENT_SERVICE               = CERT_SYSTEM_STORE_CURRENT_SERVICE_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_SERVICES                      = CERT_SYSTEM_STORE_SERVICES_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_USERS                         = CERT_SYSTEM_STORE_USERS_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY     = CERT_SYSTEM_STORE_CURRENT_USER_GROUP_POLICY_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY    = CERT_SYSTEM_STORE_LOCAL_MACHINE_GROUP_POLICY_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
	CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE      = CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE_ID << CERT_SYSTEM_STORE_LOCATION_SHIFT,
}

const wchar* CERT_GROUP_POLICY_SYSTEM_STORE_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates";
const wchar* CERT_EFSBLOB_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates\\EFS";
const wchar* CERT_EFSBLOB_VALUE_NAME = "EFSBlob";
const wchar* CERT_PROT_ROOT_FLAGS_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates\\Root\\ProtectedRoots";
const wchar* CERT_PROT_ROOT_FLAGS_VALUE_NAME = "Flags";;

enum {
	CERT_PROT_ROOT_DISABLE_CURRENT_USER_FLAG                = 0x1,
	CERT_PROT_ROOT_INHIBIT_ADD_AT_INIT_FLAG                 = 0x2,
	CERT_PROT_ROOT_INHIBIT_PURGE_LM_FLAG                    = 0x4,
	CERT_PROT_ROOT_DISABLE_LM_AUTH_FLAG                     = 0x8,
	CERT_PROT_ROOT_ONLY_LM_GPT_FLAG                         = 0x8,
	CERT_PROT_ROOT_DISABLE_NT_AUTH_REQUIRED_FLAG            = 0x10,
	CERT_PROT_ROOT_DISABLE_NOT_DEFINED_NAME_CONSTRAINT_FLAG = 0x20,
	CERT_PROT_ROOT_DISABLE_PEER_TRUST                       = 0x10000,
}

const wchar* CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME = "PeerUsages";
const char* CERT_PROT_ROOT_PEER_USAGES_VALUE_NAME_A = "PeerUsages";

const char* CERT_PROT_ROOT_PEER_USAGES_DEFAULT_A = "1.3.6.1.5.5.7.3.2\01.3.6.1.5.5.7.3.4\01.3.6.1.4.1.311.10.3.4\0";
const wchar* CERT_TRUST_PUB_SAFER_GROUP_POLICY_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates\\TrustedPublisher\\Safer";
const wchar* CERT_LOCAL_MACHINE_SYSTEM_STORE_REGPATH = "Software\\Microsoft\\SystemCertificates";
const wchar* CERT_TRUST_PUB_SAFER_LOCAL_MACHINE_REGPATH = "Software\\Microsoft\\SystemCertificates\\TrustedPublisher\\Safer";
const wchar* CERT_TRUST_PUB_AUTHENTICODE_FLAGS_VALUE_NAME = "AuthenticodeFlags";

enum {
	CERT_TRUST_PUB_ALLOW_TRUST_MASK             = 0x00000003,
	CERT_TRUST_PUB_ALLOW_END_USER_TRUST         = 0x00000000,
	CERT_TRUST_PUB_ALLOW_MACHINE_ADMIN_TRUST    = 0x00000001,
	CERT_TRUST_PUB_ALLOW_ENTERPRISE_ADMIN_TRUST = 0x00000002,
	CERT_TRUST_PUB_CHECK_PUBLISHER_REV_FLAG     = 0x00000100,
	CERT_TRUST_PUB_CHECK_TIMESTAMP_REV_FLAG     = 0x00000200,
}

const wchar* CERT_OCM_SUBCOMPONENTS_LOCAL_MACHINE_REGPATH = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Setup\\OC Manager\\Subcomponents";
const wchar* CERT_OCM_SUBCOMPONENTS_ROOT_AUTO_UPDATE_VALUE_NAME = "RootAutoUpdate";
const wchar* CERT_DISABLE_ROOT_AUTO_UPDATE_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates\\AuthRoot";
const wchar* CERT_DISABLE_ROOT_AUTO_UPDATE_VALUE_NAME = "DisableRootAutoUpdate";
const wchar* CERT_AUTH_ROOT_AUTO_UPDATE_LOCAL_MACHINE_REGPATH = "Software\\Microsoft\\SystemCertificates\\AuthRoot\\AutoUpdate";
const wchar* CERT_AUTH_ROOT_AUTO_UPDATE_ROOT_DIR_URL_VALUE_NAME = "RootDirUrl";
const wchar* CERT_AUTH_ROOT_AUTO_UPDATE_SYNC_DELTA_TIME_VALUE_NAME = "SyncDeltaTime";
const wchar* CERT_AUTH_ROOT_AUTO_UPDATE_FLAGS_VALUE_NAME = "Flags";

enum {
	CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_UNTRUSTED_ROOT_LOGGING_FLAG = 0x1,
	CERT_AUTH_ROOT_AUTO_UPDATE_DISABLE_PARTIAL_CHAIN_LOGGING_FLAG  = 0x2,
}

const wchar* CERT_AUTH_ROOT_CTL_FILENAME = "authroot.stl";
const char* CERT_AUTH_ROOT_CTL_FILENAME_A = "authroot.stl";
const wchar* CERT_AUTH_ROOT_CAB_FILENAME = "authrootstl.cab";
const wchar* CERT_AUTH_ROOT_SEQ_FILENAME = "authrootseq.txt";
const wchar* CERT_AUTH_ROOT_CERT_EXT = ".crt";

enum {
	CERT_REGISTRY_STORE_REMOTE_FLAG     = 0x10000,
	CERT_REGISTRY_STORE_SERIALIZED_FLAG = 0x20000,
	CERT_REGISTRY_STORE_CLIENT_GPT_FLAG = 0x80000000,
	CERT_REGISTRY_STORE_LM_GPT_FLAG     = 0x01000000,
}

struct CERT_REGISTRY_STORE_CLIENT_GPT_PARA {
	HKEY hKeyBase;
	LPWSTR pwszRegPath;
}
alias CERT_REGISTRY_STORE_CLIENT_GPT_PARA* PCERT_REGISTRY_STORE_CLIENT_GPT_PARA;

enum CERT_REGISTRY_STORE_ROAMING_FLAG = 0x40000;

struct CERT_REGISTRY_STORE_ROAMING_PARA {
	HKEY hKey;
	LPWSTR pwszStoreDirectory;
}
alias CERT_REGISTRY_STORE_ROAMING_PARA* PCERT_REGISTRY_STORE_ROAMING_PARA;

enum CERT_REGISTRY_STORE_MY_IE_DIRTY_FLAG = 0x80000;
const wchar* CERT_IE_DIRTY_FLAGS_REGPATH = "Software\\Microsoft\\Cryptography\\IEDirtyFlags";

enum {
	CERT_FILE_STORE_COMMIT_ENABLE_FLAG  = 0x10000,
	CERT_LDAP_STORE_SIGN_FLAG           = 0x10000,
	CERT_LDAP_STORE_AREC_EXCLUSIVE_FLAG = 0x20000,
	CERT_LDAP_STORE_OPENED_FLAG         = 0x40000,
}

struct CERT_LDAP_STORE_OPENED_PARA {
	void* pvLdapSessionHandle;
	LPCWSTR pwszLdapUrl;
}
alias CERT_LDAP_STORE_OPENED_PARA* PCERT_LDAP_STORE_OPENED_PARA;

enum CERT_LDAP_STORE_UNBIND_FLAG = 0x80000;

export extern(Windows) HCERTSTORE CertOpenStore(LPCSTR lpszStoreProvider, DWORD dwEncodingType, HCRYPTPROV_LEGACY hCryptProv, DWORD dwFlags, const(void)* pvPara);

enum HCERTSTOREPROV : void* {init = (void*).init}

const char* CRYPT_OID_OPEN_STORE_PROV_FUNC = "CertDllOpenStoreProv";

struct CERT_STORE_PROV_INFO {
	DWORD cbSize;
	DWORD cStoreProvFunc;
	void** rgpvStoreProvFunc;
	HCERTSTOREPROV hStoreProv;
	DWORD dwStoreProvFlags;
	HCRYPTOIDFUNCADDR hStoreProvFuncAddr2;
}
alias CERT_STORE_PROV_INFO* PCERT_STORE_PROV_INFO;

alias extern(Windows) BOOL function(LPCSTR lpszStoreProvider, DWORD dwEncodingType, HCRYPTPROV_LEGACY hCryptProv, DWORD dwFlags, const(void)* pvPara, HCERTSTORE hCertStore, PCERT_STORE_PROV_INFO pStoreProvInfo) PFN_CERT_DLL_OPEN_STORE_PROV_FUNC;

enum {
	CERT_STORE_PROV_EXTERNAL_FLAG          = 0x1,
	CERT_STORE_PROV_DELETED_FLAG           = 0x2,
	CERT_STORE_PROV_NO_PERSIST_FLAG        = 0x4,
	CERT_STORE_PROV_SYSTEM_STORE_FLAG      = 0x8,
	CERT_STORE_PROV_LM_SYSTEM_STORE_FLAG   = 0x10,
	CERT_STORE_PROV_GP_SYSTEM_STORE_FLAG   = 0x20,
	CERT_STORE_PROV_CLOSE_FUNC             = 0,
	CERT_STORE_PROV_READ_CERT_FUNC         = 1,
	CERT_STORE_PROV_WRITE_CERT_FUNC        = 2,
	CERT_STORE_PROV_DELETE_CERT_FUNC       = 3,
	CERT_STORE_PROV_SET_CERT_PROPERTY_FUNC = 4,
	CERT_STORE_PROV_READ_CRL_FUNC          = 5,
	CERT_STORE_PROV_WRITE_CRL_FUNC         = 6,
	CERT_STORE_PROV_DELETE_CRL_FUNC        = 7,
	CERT_STORE_PROV_SET_CRL_PROPERTY_FUNC  = 8,
	CERT_STORE_PROV_READ_CTL_FUNC          = 9,
	CERT_STORE_PROV_WRITE_CTL_FUNC         = 10,
	CERT_STORE_PROV_DELETE_CTL_FUNC        = 11,
	CERT_STORE_PROV_SET_CTL_PROPERTY_FUNC  = 12,
	CERT_STORE_PROV_CONTROL_FUNC           = 13,
	CERT_STORE_PROV_FIND_CERT_FUNC         = 14,
	CERT_STORE_PROV_FREE_FIND_CERT_FUNC    = 15,
	CERT_STORE_PROV_GET_CERT_PROPERTY_FUNC = 16,
	CERT_STORE_PROV_FIND_CRL_FUNC          = 17,
	CERT_STORE_PROV_FREE_FIND_CRL_FUNC     = 18,
	CERT_STORE_PROV_GET_CRL_PROPERTY_FUNC  = 19,
	CERT_STORE_PROV_FIND_CTL_FUNC          = 20,
	CERT_STORE_PROV_FREE_FIND_CTL_FUNC     = 21,
	CERT_STORE_PROV_GET_CTL_PROPERTY_FUNC  = 22,
}

alias extern(Windows) void function(HCERTSTOREPROV hStoreProv, DWORD dwFlags) PFN_CERT_STORE_PROV_CLOSE;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pStoreCertContext, DWORD dwFlags, PCCERT_CONTEXT* ppProvCertContext) PFN_CERT_STORE_PROV_READ_CERT;

enum CERT_STORE_PROV_WRITE_ADD_FLAG = 0x1;

alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pCertContext, DWORD dwFlags) PFN_CERT_STORE_PROV_WRITE_CERT;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pCertContext, DWORD dwFlags) PFN_CERT_STORE_PROV_DELETE_CERT;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pCertContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData) PFN_CERT_STORE_PROV_SET_CERT_PROPERTY;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pStoreCrlContext, DWORD dwFlags, PCCRL_CONTEXT* ppProvCrlContext) PFN_CERT_STORE_PROV_READ_CRL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pCrlContext, DWORD dwFlags) PFN_CERT_STORE_PROV_WRITE_CRL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pCrlContext, DWORD dwFlags) PFN_CERT_STORE_PROV_DELETE_CRL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pCrlContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData) PFN_CERT_STORE_PROV_SET_CRL_PROPERTY;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pStoreCtlContext, DWORD dwFlags, PCCTL_CONTEXT* ppProvCtlContext) PFN_CERT_STORE_PROV_READ_CTL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pCtlContext, DWORD dwFlags) PFN_CERT_STORE_PROV_WRITE_CTL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pCtlContext, DWORD dwFlags) PFN_CERT_STORE_PROV_DELETE_CTL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pCtlContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData) PFN_CERT_STORE_PROV_SET_CTL_PROPERTY;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, DWORD dwFlags, DWORD dwCtrlType, void* pvCtrlPara) PFN_CERT_STORE_PROV_CONTROL;

struct CERT_STORE_PROV_FIND_INFO {
	DWORD cbSize;
	DWORD dwMsgAndCertEncodingType;
	DWORD dwFindFlags;
	DWORD dwFindType;
	const(void)* pvFindPara;
}
alias CERT_STORE_PROV_FIND_INFO* PCERT_STORE_PROV_FIND_INFO;
alias const(CERT_STORE_PROV_FIND_INFO) CCERT_STORE_PROV_FIND_INFO;
alias CCERT_STORE_PROV_FIND_INFO* PCCERT_STORE_PROV_FIND_INFO;

alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_STORE_PROV_FIND_INFO pFindInfo, PCCERT_CONTEXT pPrevCertContext, DWORD dwFlags, void** ppvStoreProvFindInfo, PCCERT_CONTEXT* ppProvCertContext) PFN_CERT_STORE_PROV_FIND_CERT;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pCertContext, void* pvStoreProvFindInfo, DWORD dwFlags) PFN_CERT_STORE_PROV_FREE_FIND_CERT;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_CONTEXT pCertContext, DWORD dwPropId, DWORD dwFlags, void* pvData, DWORD* pcbData) PFN_CERT_STORE_PROV_GET_CERT_PROPERTY;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_STORE_PROV_FIND_INFO pFindInfo, PCCRL_CONTEXT pPrevCrlContext, DWORD dwFlags, void** ppvStoreProvFindInfo, PCCRL_CONTEXT* ppProvCrlContext) PFN_CERT_STORE_PROV_FIND_CRL ;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pCrlContext, void* pvStoreProvFindInfo, DWORD dwFlags) PFN_CERT_STORE_PROV_FREE_FIND_CRL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCRL_CONTEXT pCrlContext, DWORD dwPropId, DWORD dwFlags, void* pvData, DWORD* pcbData) PFN_CERT_STORE_PROV_GET_CRL_PROPERTY;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCERT_STORE_PROV_FIND_INFO pFindInfo, PCCTL_CONTEXT pPrevCtlContext, DWORD dwFlags, void** ppvStoreProvFindInfo, PCCTL_CONTEXT* ppProvCtlContext) PFN_CERT_STORE_PROV_FIND_CTL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pCtlContext, void* pvStoreProvFindInfo, DWORD dwFlags) PFN_CERT_STORE_PROV_FREE_FIND_CTL;
alias extern(Windows) BOOL function(HCERTSTOREPROV hStoreProv, PCCTL_CONTEXT pCtlContext, DWORD dwPropId, DWORD dwFlags, void* pvData, DWORD* pcbData) PFN_CERT_STORE_PROV_GET_CTL_PROPERTY;

export extern(Windows) HCERTSTORE CertDuplicateStore(HCERTSTORE hCertStore);

enum {
	CERT_STORE_SAVE_AS_STORE      = 1,
	CERT_STORE_SAVE_AS_PKCS7      = 2,
	CERT_STORE_SAVE_AS_PKCS12     = 3,
	CERT_STORE_SAVE_TO_FILE       = 1,
	CERT_STORE_SAVE_TO_MEMORY     = 2,
	CERT_STORE_SAVE_TO_FILENAME_A = 3,
	CERT_STORE_SAVE_TO_FILENAME_W = 4,
	CERT_STORE_SAVE_TO_FILENAME   = CERT_STORE_SAVE_TO_FILENAME_W,
}

export extern(Windows) BOOL CertSaveStore(HCERTSTORE hCertStore, DWORD dwEncodingType, DWORD dwSaveAs, DWORD dwSaveTo, void* pvSaveToPara, DWORD dwFlags);

enum {
	CERT_CLOSE_STORE_FORCE_FLAG = 0x00000001,
	CERT_CLOSE_STORE_CHECK_FLAG = 0x00000002,
}

export extern(Windows) BOOL CertCloseStore(HCERTSTORE hCertStore, DWORD dwFlags);
export extern(Windows) PCCERT_CONTEXT CertGetSubjectCertificateFromStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, PCERT_INFO pCertId);
export extern(Windows) PCCERT_CONTEXT CertEnumCertificatesInStore(HCERTSTORE hCertStore, PCCERT_CONTEXT pPrevCertContext);
export extern(Windows) PCCERT_CONTEXT CertFindCertificateInStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, DWORD dwFindFlags, DWORD dwFindType, const(void)* pvFindPara, PCCERT_CONTEXT pPrevCertContext);

enum {
	CERT_COMPARE_MASK                     = 0xFFFF,
	CERT_COMPARE_SHIFT                    = 16,
	CERT_COMPARE_ANY                      = 0,
	CERT_COMPARE_SHA1_HASH                = 1,
	CERT_COMPARE_NAME                     = 2,
	CERT_COMPARE_ATTR                     = 3,
	CERT_COMPARE_MD5_HASH                 = 4,
	CERT_COMPARE_PROPERTY                 = 5,
	CERT_COMPARE_PUBLIC_KEY               = 6,
	CERT_COMPARE_HASH                     = CERT_COMPARE_SHA1_HASH,
	CERT_COMPARE_NAME_STR_A               = 7,
	CERT_COMPARE_NAME_STR_W               = 8,
	CERT_COMPARE_KEY_SPEC                 = 9,
	CERT_COMPARE_ENHKEY_USAGE             = 10,
	CERT_COMPARE_CTL_USAGE                = CERT_COMPARE_ENHKEY_USAGE,
	CERT_COMPARE_SUBJECT_CERT             = 11,
	CERT_COMPARE_ISSUER_OF                = 12,
	CERT_COMPARE_EXISTING                 = 13,
	CERT_COMPARE_SIGNATURE_HASH           = 14,
	CERT_COMPARE_KEY_IDENTIFIER           = 15,
	CERT_COMPARE_CERT_ID                  = 16,
	CERT_COMPARE_CROSS_CERT_DIST_POINTS   = 17,
	CERT_COMPARE_PUBKEY_MD5_HASH          = 18,
	CERT_COMPARE_SUBJECT_INFO_ACCESS      = 19,
	CERT_FIND_ANY                         = CERT_COMPARE_ANY << CERT_COMPARE_SHIFT,
	CERT_FIND_SHA1_HASH                   = CERT_COMPARE_SHA1_HASH << CERT_COMPARE_SHIFT,
	CERT_FIND_MD5_HASH                    = CERT_COMPARE_MD5_HASH << CERT_COMPARE_SHIFT,
	CERT_FIND_SIGNATURE_HASH              = CERT_COMPARE_SIGNATURE_HASH << CERT_COMPARE_SHIFT,
	CERT_FIND_KEY_IDENTIFIER              = CERT_COMPARE_KEY_IDENTIFIER << CERT_COMPARE_SHIFT,
	CERT_FIND_HASH                        = CERT_FIND_SHA1_HASH,
	CERT_FIND_PROPERTY                    = CERT_COMPARE_PROPERTY << CERT_COMPARE_SHIFT,
	CERT_FIND_PUBLIC_KEY                  = CERT_COMPARE_PUBLIC_KEY << CERT_COMPARE_SHIFT,
	CERT_FIND_SUBJECT_NAME                = CERT_COMPARE_NAME << CERT_COMPARE_SHIFT | CERT_INFO_SUBJECT_FLAG,
	CERT_FIND_SUBJECT_ATTR                = CERT_COMPARE_ATTR << CERT_COMPARE_SHIFT | CERT_INFO_SUBJECT_FLAG,
	CERT_FIND_ISSUER_NAME                 = CERT_COMPARE_NAME << CERT_COMPARE_SHIFT | CERT_INFO_ISSUER_FLAG,
	CERT_FIND_ISSUER_ATTR                 = CERT_COMPARE_ATTR << CERT_COMPARE_SHIFT | CERT_INFO_ISSUER_FLAG,
	CERT_FIND_SUBJECT_STR_A               = CERT_COMPARE_NAME_STR_A << CERT_COMPARE_SHIFT | CERT_INFO_SUBJECT_FLAG,
	CERT_FIND_SUBJECT_STR_W               = CERT_COMPARE_NAME_STR_W << CERT_COMPARE_SHIFT | CERT_INFO_SUBJECT_FLAG,
	CERT_FIND_SUBJECT_STR                 = CERT_FIND_SUBJECT_STR_W,
	CERT_FIND_ISSUER_STR_A                = CERT_COMPARE_NAME_STR_A << CERT_COMPARE_SHIFT | CERT_INFO_ISSUER_FLAG,
	CERT_FIND_ISSUER_STR_W                = CERT_COMPARE_NAME_STR_W << CERT_COMPARE_SHIFT | CERT_INFO_ISSUER_FLAG,
	CERT_FIND_ISSUER_STR                  = CERT_FIND_ISSUER_STR_W,
	CERT_FIND_KEY_SPEC                    = CERT_COMPARE_KEY_SPEC << CERT_COMPARE_SHIFT,
	CERT_FIND_ENHKEY_USAGE                = CERT_COMPARE_ENHKEY_USAGE << CERT_COMPARE_SHIFT,
	CERT_FIND_CTL_USAGE                   = CERT_FIND_ENHKEY_USAGE,
	CERT_FIND_SUBJECT_CERT                = CERT_COMPARE_SUBJECT_CERT << CERT_COMPARE_SHIFT,
	CERT_FIND_ISSUER_OF                   = CERT_COMPARE_ISSUER_OF << CERT_COMPARE_SHIFT,
	CERT_FIND_EXISTING                    = CERT_COMPARE_EXISTING << CERT_COMPARE_SHIFT,
	CERT_FIND_CERT_ID                     = CERT_COMPARE_CERT_ID << CERT_COMPARE_SHIFT,
	CERT_FIND_CROSS_CERT_DIST_POINTS      = (CERT_COMPARE_CROSS_CERT_DIST_POINTS << CERT_COMPARE_SHIFT),
	CERT_FIND_PUBKEY_MD5_HASH             = (CERT_COMPARE_PUBKEY_MD5_HASH << CERT_COMPARE_SHIFT),
	CERT_FIND_SUBJECT_INFO_ACCESS         = (CERT_COMPARE_SUBJECT_INFO_ACCESS << CERT_COMPARE_SHIFT),
	CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG  = 0x1,
	CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG  = 0x2,
	CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG = 0x4,
	CERT_FIND_NO_ENHKEY_USAGE_FLAG        = 0x8,
	CERT_FIND_OR_ENHKEY_USAGE_FLAG        = 0x10,
	CERT_FIND_VALID_ENHKEY_USAGE_FLAG     = 0x20,
	CERT_FIND_OPTIONAL_CTL_USAGE_FLAG     = CERT_FIND_OPTIONAL_ENHKEY_USAGE_FLAG,
	CERT_FIND_EXT_ONLY_CTL_USAGE_FLAG     = CERT_FIND_EXT_ONLY_ENHKEY_USAGE_FLAG,
	CERT_FIND_PROP_ONLY_CTL_USAGE_FLAG    = CERT_FIND_PROP_ONLY_ENHKEY_USAGE_FLAG,
	CERT_FIND_NO_CTL_USAGE_FLAG           = CERT_FIND_NO_ENHKEY_USAGE_FLAG,
	CERT_FIND_OR_CTL_USAGE_FLAG           = CERT_FIND_OR_ENHKEY_USAGE_FLAG,
	CERT_FIND_VALID_CTL_USAGE_FLAG        = CERT_FIND_VALID_ENHKEY_USAGE_FLAG,
}

export extern(Windows) PCCERT_CONTEXT CertGetIssuerCertificateFromStore(HCERTSTORE hCertStore, PCCERT_CONTEXT pSubjectContext, PCCERT_CONTEXT pPrevIssuerContext, DWORD* pdwFlags);
export extern(Windows) BOOL CertVerifySubjectCertificateContext(PCCERT_CONTEXT pSubject, PCCERT_CONTEXT pIssuer, DWORD* pdwFlags);
export extern(Windows) PCCERT_CONTEXT CertDuplicateCertificateContext(PCCERT_CONTEXT pCertContext);
export extern(Windows) PCCERT_CONTEXT CertCreateCertificateContext(DWORD dwCertEncodingType, const(BYTE)* pbCertEncoded, DWORD cbCertEncoded);
export extern(Windows) BOOL CertFreeCertificateContext(PCCERT_CONTEXT pCertContext);
export extern(Windows) BOOL CertSetCertificateContextProperty(PCCERT_CONTEXT pCertContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData);

enum {
	CERT_SET_PROPERTY_IGNORE_PERSIST_ERROR_FLAG = 0x80000000,
	CERT_SET_PROPERTY_INHIBIT_PERSIST_FLAG      = 0x40000000,
}

export extern(Windows) BOOL CertGetCertificateContextProperty(PCCERT_CONTEXT pCertContext, DWORD dwPropId, void* pvData, DWORD* pcbData);
export extern(Windows) DWORD CertEnumCertificateContextProperties(PCCERT_CONTEXT pCertContext, DWORD dwPropId);

export extern(Windows) BOOL CertCreateCTLEntryFromCertificateContextProperties(PCCERT_CONTEXT pCertContext, DWORD cOptAttr, PCRYPT_ATTRIBUTE rgOptAttr, DWORD dwFlags, void* pvReserved, PCTL_ENTRY pCtlEntry, DWORD* pcbCtlEntry);
enum CTL_ENTRY_FROM_PROP_CHAIN_FLAG = 0x1;

export extern(Windows) BOOL CertSetCertificateContextPropertiesFromCTLEntry(PCCERT_CONTEXT pCertContext, PCTL_ENTRY pCtlEntry, DWORD dwFlags);
export extern(Windows) PCCRL_CONTEXT CertGetCRLFromStore(HCERTSTORE hCertStore, PCCERT_CONTEXT pIssuerContext, PCCRL_CONTEXT pPrevCrlContext, DWORD* pdwFlags);
export extern(Windows) PCCRL_CONTEXT CertEnumCRLsInStore(HCERTSTORE hCertStore, PCCRL_CONTEXT pPrevCrlContext);
export extern(Windows) PCCRL_CONTEXT CertFindCRLInStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, DWORD dwFindFlags, DWORD dwFindType, const(void)* pvFindPara, PCCRL_CONTEXT pPrevCrlContext);

enum {
	CRL_FIND_ANY                      = 0,
	CRL_FIND_ISSUED_BY                = 1,
	CRL_FIND_EXISTING                 = 2,
	CRL_FIND_ISSUED_FOR               = 3,
	CRL_FIND_ISSUED_BY_AKI_FLAG       = 0x1,
	CRL_FIND_ISSUED_BY_SIGNATURE_FLAG = 0x2,
	CRL_FIND_ISSUED_BY_DELTA_FLAG     = 0x4,
	CRL_FIND_ISSUED_BY_BASE_FLAG      = 0x8,
}

struct CRL_FIND_ISSUED_FOR_PARA {
	PCCERT_CONTEXT pSubjectCert;
	PCCERT_CONTEXT pIssuerCert;
}
alias CRL_FIND_ISSUED_FOR_PARA* PCRL_FIND_ISSUED_FOR_PARA;

export extern(Windows) PCCRL_CONTEXT CertDuplicateCRLContext(PCCRL_CONTEXT pCrlContext);

export extern(Windows) PCCRL_CONTEXT CertCreateCRLContext(DWORD dwCertEncodingType, const(BYTE)* pbCrlEncoded, DWORD cbCrlEncoded);
export extern(Windows) BOOL CertFreeCRLContext(PCCRL_CONTEXT pCrlContext);
export extern(Windows) BOOL CertSetCRLContextProperty(PCCRL_CONTEXT pCrlContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData);
export extern(Windows) BOOL CertGetCRLContextProperty(PCCRL_CONTEXT pCrlContext, DWORD dwPropId, void* pvData, DWORD* pcbData);
export extern(Windows) DWORD CertEnumCRLContextProperties(PCCRL_CONTEXT pCrlContext, DWORD dwPropId);
export extern(Windows) BOOL CertFindCertificateInCRL(PCCERT_CONTEXT pCert, PCCRL_CONTEXT pCrlContext, DWORD dwFlags, void* pvReserved, PCRL_ENTRY* ppCrlEntry);
export extern(Windows) BOOL CertIsValidCRLForCertificate(PCCERT_CONTEXT pCert, PCCRL_CONTEXT pCrl, DWORD dwFlags, void* pvReserved);

enum {
	CERT_STORE_ADD_NEW                                 = 1,
	CERT_STORE_ADD_USE_EXISTING                        = 2,
	CERT_STORE_ADD_REPLACE_EXISTING                    = 3,
	CERT_STORE_ADD_ALWAYS                              = 4,
	CERT_STORE_ADD_REPLACE_EXISTING_INHERIT_PROPERTIES = 5,
	CERT_STORE_ADD_NEWER                               = 6,
	CERT_STORE_ADD_NEWER_INHERIT_PROPERTIES            = 7,
}

export extern(Windows) BOOL CertAddEncodedCertificateToStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, const(BYTE)* pbCertEncoded, DWORD cbCertEncoded, DWORD dwAddDisposition, PCCERT_CONTEXT* ppCertContext);
export extern(Windows) BOOL CertAddCertificateContextToStore(HCERTSTORE hCertStore, PCCERT_CONTEXT pCertContext, DWORD dwAddDisposition, PCCERT_CONTEXT* ppStoreContext);

enum {
	CERT_STORE_CERTIFICATE_CONTEXT      = 1,
	CERT_STORE_CRL_CONTEXT              = 2,
	CERT_STORE_CTL_CONTEXT              = 3,
	CERT_STORE_ALL_CONTEXT_FLAG         = ~0U,
	CERT_STORE_CERTIFICATE_CONTEXT_FLAG = (1 << CERT_STORE_CERTIFICATE_CONTEXT),
	CERT_STORE_CRL_CONTEXT_FLAG         = (1 << CERT_STORE_CRL_CONTEXT),
	CERT_STORE_CTL_CONTEXT_FLAG         = (1 << CERT_STORE_CTL_CONTEXT),
}

export extern(Windows) BOOL CertAddSerializedElementToStore(HCERTSTORE hCertStore, const(BYTE)* pbElement, DWORD cbElement, DWORD dwAddDisposition, DWORD dwFlags, DWORD dwContextTypeFlags, DWORD* pdwContextType, const(void)** ppvContext);
export extern(Windows) BOOL CertDeleteCertificateFromStore(PCCERT_CONTEXT pCertContext);
export extern(Windows) BOOL CertAddEncodedCRLToStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, const(BYTE)* pbCrlEncoded, DWORD cbCrlEncoded, DWORD dwAddDisposition, PCCRL_CONTEXT* ppCrlContext);
export extern(Windows) BOOL CertAddCRLContextToStore(HCERTSTORE hCertStore, PCCRL_CONTEXT pCrlContext, DWORD dwAddDisposition, PCCRL_CONTEXT* ppStoreContext);
export extern(Windows) BOOL CertDeleteCRLFromStore(PCCRL_CONTEXT pCrlContext);
export extern(Windows) BOOL CertSerializeCertificateStoreElement(PCCERT_CONTEXT pCertContext, DWORD dwFlags, BYTE* pbElement, DWORD* pcbElement);
export extern(Windows) BOOL CertSerializeCRLStoreElement(PCCRL_CONTEXT pCrlContext, DWORD dwFlags, BYTE* pbElement, DWORD* pcbElement);
export extern(Windows) PCCTL_CONTEXT CertDuplicateCTLContext(PCCTL_CONTEXT pCtlContext);
export extern(Windows) PCCTL_CONTEXT CertCreateCTLContext(DWORD dwMsgAndCertEncodingType, const(BYTE)* pbCtlEncoded, DWORD cbCtlEncoded);
export extern(Windows) BOOL CertFreeCTLContext(PCCTL_CONTEXT pCtlContext);
export extern(Windows) BOOL CertSetCTLContextProperty(PCCTL_CONTEXT pCtlContext, DWORD dwPropId, DWORD dwFlags, const(void)* pvData);
export extern(Windows) BOOL CertGetCTLContextProperty(PCCTL_CONTEXT pCtlContext, DWORD dwPropId, void* pvData, DWORD* pcbData);
export extern(Windows) DWORD CertEnumCTLContextProperties(PCCTL_CONTEXT pCtlContext, DWORD dwPropId);
export extern(Windows) PCCTL_CONTEXT CertEnumCTLsInStore(HCERTSTORE hCertStore, PCCTL_CONTEXT pPrevCtlContext);
export extern(Windows) PCTL_ENTRY CertFindSubjectInCTL(DWORD dwEncodingType, DWORD dwSubjectType, void* pvSubject, PCCTL_CONTEXT pCtlContext, DWORD dwFlags);

enum {
	CTL_ANY_SUBJECT_TYPE  = 1,
	CTL_CERT_SUBJECT_TYPE = 2,
}

struct CTL_ANY_SUBJECT_INFO {
	CRYPT_ALGORITHM_IDENTIFIER SubjectAlgorithm;
	CRYPT_DATA_BLOB SubjectIdentifier;
}
alias CTL_ANY_SUBJECT_INFO* PCTL_ANY_SUBJECT_INFO;

export extern(Windows) PCCTL_CONTEXT CertFindCTLInStore(HCERTSTORE hCertStore, DWORD dwMsgAndCertEncodingType, DWORD dwFindFlags, DWORD dwFindType, const(void)* pvFindPara, PCCTL_CONTEXT pPrevCtlContext);

enum {
	CTL_FIND_ANY       = 0,
	CTL_FIND_SHA1_HASH = 1,
	CTL_FIND_MD5_HASH  = 2,
	CTL_FIND_USAGE     = 3,
	CTL_FIND_SUBJECT   = 4,
	CTL_FIND_EXISTING  = 5,
}

struct CTL_FIND_USAGE_PARA {
	DWORD cbSize;
	CTL_USAGE SubjectUsage;
	CRYPT_DATA_BLOB ListIdentifier;
	PCERT_INFO pSigner;
}
alias CTL_FIND_USAGE_PARA* PCTL_FIND_USAGE_PARA;

enum {
	CTL_FIND_NO_LIST_ID_CBDATA = 0xFFFFFFFF,
	CTL_FIND_NO_SIGNER_PTR     = (PCERT_INFO) -1,
}

enum CTL_FIND_SAME_USAGE_FLAG = 0x1;

struct CTL_FIND_SUBJECT_PARA {
	DWORD cbSize;
	PCTL_FIND_USAGE_PARA pUsagePara;
	DWORD dwSubjectType;
	void* pvSubject;
}
alias CTL_FIND_SUBJECT_PARA* PCTL_FIND_SUBJECT_PARA;

export extern(Windows) BOOL CertAddEncodedCTLToStore(HCERTSTORE hCertStore, DWORD dwMsgAndCertEncodingType, const(BYTE)* pbCtlEncoded, DWORD cbCtlEncoded, DWORD dwAddDisposition, PCCTL_CONTEXT* ppCtlContext);
export extern(Windows) BOOL CertAddCTLContextToStore(HCERTSTORE hCertStore, PCCTL_CONTEXT pCtlContext, DWORD dwAddDisposition, PCCTL_CONTEXT* ppStoreContext);
export extern(Windows) BOOL CertSerializeCTLStoreElement(PCCTL_CONTEXT pCtlContext, DWORD dwFlags, BYTE* pbElement, DWORD* pcbElement);
export extern(Windows) BOOL CertDeleteCTLFromStore(PCCTL_CONTEXT pCtlContext);
export extern(Windows) BOOL CertAddCertificateLinkToStore(HCERTSTORE hCertStore, PCCERT_CONTEXT pCertContext, DWORD dwAddDisposition, PCCERT_CONTEXT* ppStoreContext);
export extern(Windows) BOOL CertAddCRLLinkToStore(HCERTSTORE hCertStore, PCCRL_CONTEXT pCrlContext, DWORD dwAddDisposition, PCCRL_CONTEXT* ppStoreContext);
export extern(Windows) BOOL CertAddCTLLinkToStore(HCERTSTORE hCertStore, PCCTL_CONTEXT pCtlContext, DWORD dwAddDisposition, PCCTL_CONTEXT* ppStoreContext);
export extern(Windows) BOOL CertAddStoreToCollection(HCERTSTORE hCollectionStore, HCERTSTORE hSiblingStore, DWORD dwUpdateFlags, DWORD dwPriority);
export extern(Windows) void CertRemoveStoreFromCollection(HCERTSTORE hCollectionStore, HCERTSTORE hSiblingStore);
export extern(Windows) BOOL CertControlStore(HCERTSTORE hCertStore, DWORD dwFlags, DWORD dwCtrlType, void* pvCtrlPara);

enum {
	CERT_STORE_CTRL_RESYNC                        = 1,
	CERT_STORE_CTRL_NOTIFY_CHANGE                 = 2,
	CERT_STORE_CTRL_COMMIT                        = 3,
	CERT_STORE_CTRL_AUTO_RESYNC                   = 4,
	CERT_STORE_CTRL_CANCEL_NOTIFY                 = 5,
	CERT_STORE_CTRL_INHIBIT_DUPLICATE_HANDLE_FLAG = 0x1,
	CERT_STORE_CTRL_COMMIT_FORCE_FLAG             = 0x1,
	CERT_STORE_CTRL_COMMIT_CLEAR_FLAG             = 0x2,
	CERT_STORE_LOCALIZED_NAME_PROP_ID             = 0x1000,
}

export extern(Windows) BOOL CertSetStoreProperty(HCERTSTORE hCertStore, DWORD dwPropId, DWORD dwFlags, const(void)* pvData);
export extern(Windows) BOOL CertGetStoreProperty(HCERTSTORE hCertStore, DWORD dwPropId, void* pvData, DWORD* pcbData);

alias extern(Windows) BOOL function(DWORD cbTotalEncoded, DWORD cbRemainEncoded, DWORD cEntry, void* pvSort) PFN_CERT_CREATE_CONTEXT_SORT_FUNC;

struct CERT_CREATE_CONTEXT_PARA {
	DWORD cbSize;
	PFN_CRYPT_FREE pfnFree;
	void* pvFree;
	PFN_CERT_CREATE_CONTEXT_SORT_FUNC pfnSort;
	void* pvSort;
}
alias CERT_CREATE_CONTEXT_PARA* PCERT_CREATE_CONTEXT_PARA;

export extern(Windows) const(void)* CertCreateContext(DWORD dwContextType, DWORD dwEncodingType, const(BYTE)* pbEncoded, DWORD cbEncoded, DWORD dwFlags, PCERT_CREATE_CONTEXT_PARA pCreatePara);

enum {
	CERT_CREATE_CONTEXT_NOCOPY_FLAG       = 0x1,
	CERT_CREATE_CONTEXT_SORTED_FLAG       = 0x2,
	CERT_CREATE_CONTEXT_NO_HCRYPTMSG_FLAG = 0x4,
	CERT_CREATE_CONTEXT_NO_ENTRY_FLAG     = 0x8,
}

struct CERT_SYSTEM_STORE_INFO {
	DWORD cbSize;
}
alias CERT_SYSTEM_STORE_INFO* PCERT_SYSTEM_STORE_INFO;

struct CERT_PHYSICAL_STORE_INFO {
	DWORD cbSize;
	LPSTR pszOpenStoreProvider;
	DWORD dwOpenEncodingType;
	DWORD dwOpenFlags;
	CRYPT_DATA_BLOB OpenParameters;
	DWORD dwFlags;
	DWORD dwPriority;
}
alias CERT_PHYSICAL_STORE_INFO* PCERT_PHYSICAL_STORE_INFO;

enum {
	CERT_PHYSICAL_STORE_ADD_ENABLE_FLAG                  = 0x1,
	CERT_PHYSICAL_STORE_OPEN_DISABLE_FLAG                = 0x2,
	CERT_PHYSICAL_STORE_REMOTE_OPEN_DISABLE_FLAG         = 0x4,
	CERT_PHYSICAL_STORE_INSERT_COMPUTER_NAME_ENABLE_FLAG = 0x8,
}

export extern(Windows) BOOL CertRegisterSystemStore(const(void)* pvSystemStore, DWORD dwFlags, PCERT_SYSTEM_STORE_INFO pStoreInfo, void* pvReserved);
export extern(Windows) BOOL CertRegisterPhysicalStore(const(void)* pvSystemStore, DWORD dwFlags, LPCWSTR pwszStoreName, PCERT_PHYSICAL_STORE_INFO pStoreInfo, void* pvReserved);
export extern(Windows) BOOL CertUnregisterSystemStore(const(void)* pvSystemStore,DWORD dwFlags);
export extern(Windows) BOOL CertUnregisterPhysicalStore(const(void)* pvSystemStore, DWORD dwFlags, LPCWSTR pwszStoreName);

alias extern(Windows) BOOL function(LPCWSTR pwszStoreLocation, DWORD dwFlags, void* pvReserved, void* pvArg) PFN_CERT_ENUM_SYSTEM_STORE_LOCATION;
alias extern(Windows) BOOL function(const(void)* pvSystemStore, DWORD dwFlags, PCERT_SYSTEM_STORE_INFO pStoreInfo, void* pvReserved, void* pvArg) PFN_CERT_ENUM_SYSTEM_STORE;
alias extern(Windows) BOOL function(const(void)* pvSystemStore, DWORD dwFlags, LPCWSTR pwszStoreName, PCERT_PHYSICAL_STORE_INFO pStoreInfo, void* pvReserved, void* pvArg) PFN_CERT_ENUM_PHYSICAL_STORE;

enum CERT_PHYSICAL_STORE_PREDEFINED_ENUM_FLAG = 0x1;

const wchar* CERT_PHYSICAL_STORE_DEFAULT_NAME = ".Default";
const wchar* CERT_PHYSICAL_STORE_GROUP_POLICY_NAME = ".GroupPolicy";
const wchar* CERT_PHYSICAL_STORE_LOCAL_MACHINE_NAME = ".LocalMachine";
const wchar* CERT_PHYSICAL_STORE_DS_USER_CERTIFICATE_NAME = ".UserCertificate";
const wchar* CERT_PHYSICAL_STORE_LOCAL_MACHINE_GROUP_POLICY_NAME = ".LocalMachineGroupPolicy";
const wchar* CERT_PHYSICAL_STORE_ENTERPRISE_NAME = ".Enterprise";
const wchar* CERT_PHYSICAL_STORE_AUTH_ROOT_NAME = ".AuthRoot";
const wchar* CERT_PHYSICAL_STORE_SMART_CARD_NAME = ".SmartCard";

export extern(Windows) BOOL CertEnumSystemStoreLocation(DWORD dwFlags, void* pvArg, PFN_CERT_ENUM_SYSTEM_STORE_LOCATION pfnEnum);
export extern(Windows) BOOL CertEnumSystemStore(DWORD dwFlags, void* pvSystemStoreLocationPara, void* pvArg, PFN_CERT_ENUM_SYSTEM_STORE pfnEnum);
export extern(Windows) BOOL CertEnumPhysicalStore(const(void)* pvSystemStore, DWORD dwFlags, void* pvArg, PFN_CERT_ENUM_PHYSICAL_STORE pfnEnum);

const char* CRYPT_OID_OPEN_SYSTEM_STORE_PROV_FUNC = "CertDllOpenSystemStoreProv";
const char* CRYPT_OID_REGISTER_SYSTEM_STORE_FUNC = "CertDllRegisterSystemStore";
const char* CRYPT_OID_UNREGISTER_SYSTEM_STORE_FUNC = "CertDllUnregisterSystemStore";
const char* CRYPT_OID_ENUM_SYSTEM_STORE_FUNC = "CertDllEnumSystemStore";
const char* CRYPT_OID_REGISTER_PHYSICAL_STORE_FUNC = "CertDllRegisterPhysicalStore";
const char* CRYPT_OID_UNREGISTER_PHYSICAL_STORE_FUNC = "CertDllUnregisterPhysicalStore";
const char* CRYPT_OID_ENUM_PHYSICAL_STORE_FUNC = "CertDllEnumPhysicalStore";

const wchar* CRYPT_OID_SYSTEM_STORE_LOCATION_VALUE_NAME = "SystemStoreLocation";

export extern(Windows) BOOL CertGetEnhancedKeyUsage(PCCERT_CONTEXT pCertContext, DWORD dwFlags, PCERT_ENHKEY_USAGE pUsage, DWORD* pcbUsage);
export extern(Windows) BOOL CertSetEnhancedKeyUsage(PCCERT_CONTEXT pCertContext, PCERT_ENHKEY_USAGE pUsage);
export extern(Windows) BOOL CertAddEnhancedKeyUsageIdentifier(PCCERT_CONTEXT pCertContext, LPCSTR pszUsageIdentifier);
export extern(Windows) BOOL CertRemoveEnhancedKeyUsageIdentifier(PCCERT_CONTEXT pCertContext, LPCSTR pszUsageIdentifier);
export extern(Windows) BOOL CertGetValidUsages(DWORD cCerts, PCCERT_CONTEXT* rghCerts, int* cNumOIDs, LPSTR* rghOIDs, DWORD* pcbOIDs);
export extern(Windows) BOOL CryptMsgGetAndVerifySigner(HCRYPTMSG hCryptMsg, DWORD cSignerStore, HCERTSTORE* rghSignerStore, DWORD dwFlags, PCCERT_CONTEXT* ppSigner, DWORD* pdwSignerIndex);

enum {
	CMSG_TRUSTED_SIGNER_FLAG   = 0x1,
	CMSG_SIGNER_ONLY_FLAG      = 0x2,
	CMSG_USE_SIGNER_INDEX_FLAG = 0x4,
}

export extern(Windows) BOOL CryptMsgSignCTL( DWORD dwMsgEncodingType, BYTE* pbCtlContent, DWORD cbCtlContent, PCMSG_SIGNED_ENCODE_INFO pSignInfo, DWORD dwFlags, BYTE* pbEncoded, DWORD* pcbEncoded);

enum CMSG_CMS_ENCAPSULATED_CTL_FLAG = 0x00008000;

export extern(Windows) BOOL CryptMsgEncodeAndSignCTL(DWORD dwMsgEncodingType, PCTL_INFO pCtlInfo, PCMSG_SIGNED_ENCODE_INFO pSignInfo, DWORD dwFlags, BYTE* pbEncoded, DWORD* pcbEncoded);

enum {
	CMSG_ENCODE_SORTED_CTL_FLAG                = 0x1,
	CMSG_ENCODE_HASHED_SUBJECT_IDENTIFIER_FLAG = 0x2,
}

export extern(Windows) BOOL CertFindSubjectInSortedCTL(PCRYPT_DATA_BLOB pSubjectIdentifier, PCCTL_CONTEXT pCtlContext, DWORD dwFlags, void* pvReserved, PCRYPT_DER_BLOB pEncodedAttributes);
export extern(Windows) BOOL CertEnumSubjectInSortedCTL(PCCTL_CONTEXT pCtlContext, void** ppvNextSubject, PCRYPT_DER_BLOB pSubjectIdentifier, PCRYPT_DER_BLOB pEncodedAttributes);

struct CTL_VERIFY_USAGE_PARA {
	DWORD cbSize;
	CRYPT_DATA_BLOB ListIdentifier;
	DWORD cCtlStore;
	HCERTSTORE* rghCtlStore;
	DWORD cSignerStore;
	HCERTSTORE* rghSignerStore;
}
alias CTL_VERIFY_USAGE_PARA* PCTL_VERIFY_USAGE_PARA;

struct CTL_VERIFY_USAGE_STATUS {
	DWORD cbSize;
	DWORD dwError;
	DWORD dwFlags;
	PCCTL_CONTEXT* ppCtl;
	DWORD dwCtlEntryIndex;
	PCCERT_CONTEXT* ppSigner;
	DWORD dwSignerIndex;
}
alias CTL_VERIFY_USAGE_STATUS* PCTL_VERIFY_USAGE_STATUS;

enum {
	CERT_VERIFY_INHIBIT_CTL_UPDATE_FLAG = 0x1,
	CERT_VERIFY_TRUSTED_SIGNERS_FLAG    = 0x2,
	CERT_VERIFY_NO_TIME_CHECK_FLAG      = 0x4,
	CERT_VERIFY_ALLOW_MORE_USAGE_FLAG   = 0x8,
	CERT_VERIFY_UPDATED_CTL_FLAG        = 0x1,
}

export extern(Windows) BOOL CertVerifyCTLUsage(DWORD dwEncodingType, DWORD dwSubjectType, void* pvSubject, PCTL_USAGE pSubjectUsage, DWORD dwFlags, PCTL_VERIFY_USAGE_PARA pVerifyUsagePara, PCTL_VERIFY_USAGE_STATUS pVerifyUsageStatus);

struct CERT_REVOCATION_CRL_INFO {
	DWORD cbSize;
	PCCRL_CONTEXT pBaseCrlContext;
	PCCRL_CONTEXT pDeltaCrlContext;
	PCRL_ENTRY pCrlEntry;
	BOOL fDeltaCrlEntry;
}
alias CERT_REVOCATION_CRL_INFO* PCERT_REVOCATION_CRL_INFO;

struct CERT_REVOCATION_PARA {
	DWORD cbSize;
	PCCERT_CONTEXT pIssuerCert;
	DWORD cCertStore;
	HCERTSTORE* rgCertStore;
	HCERTSTORE hCrlStore;
	LPFILETIME pftTimeToUse;
	//CERT_REVOCATION_PARA_HAS_EXTRA_FIELDS
		DWORD dwUrlRetrievalTimeout;
		BOOL fCheckFreshnessTime;
		DWORD dwFreshnessTime;
		LPFILETIME pftCurrentTime;
		PCERT_REVOCATION_CRL_INFO pCrlInfo;
		LPFILETIME pftCacheResync;
		PCERT_REVOCATION_CHAIN_PARA pChainPara;
}
alias CERT_REVOCATION_PARA* PCERT_REVOCATION_PARA;

struct CERT_REVOCATION_STATUS {
	DWORD cbSize;
	DWORD dwIndex;
	DWORD dwError;
	DWORD dwReason;
	BOOL fHasFreshnessTime;
	DWORD dwFreshnessTime;
}
alias CERT_REVOCATION_STATUS* PCERT_REVOCATION_STATUS;

export extern(Windows) BOOL CertVerifyRevocation(DWORD dwEncodingType, DWORD dwRevType, DWORD cContext, PVOID* rgpvContext, DWORD dwFlags, PCERT_REVOCATION_PARA pRevPara, PCERT_REVOCATION_STATUS pRevStatus);

enum {
	CERT_CONTEXT_REVOCATION_TYPE              = 1,
	CERT_VERIFY_REV_CHAIN_FLAG                = 0x00000001,
	CERT_VERIFY_CACHE_ONLY_BASED_REVOCATION   = 0x00000002,
	CERT_VERIFY_REV_ACCUMULATIVE_TIMEOUT_FLAG = 0x00000004,
	CERT_VERIFY_REV_SERVER_OCSP_FLAG          = 0x00000008,
}

BOOL CertCompareIntegerBlob(PCRYPT_INTEGER_BLOB pInt1, PCRYPT_INTEGER_BLOB pInt2);
export extern(Windows) BOOL CertCompareCertificate(DWORD dwCertEncodingType, PCERT_INFO pCertId1, PCERT_INFO pCertId2);
export extern(Windows) BOOL CertCompareCertificateName(DWORD dwCertEncodingType, PCERT_NAME_BLOB pCertName1, PCERT_NAME_BLOB pCertName2);
export extern(Windows) BOOL CertIsRDNAttrsInCertificateName(DWORD dwCertEncodingType, DWORD dwFlags, PCERT_NAME_BLOB pCertName, PCERT_RDN pRDN);

enum {
	CERT_UNICODE_IS_RDN_ATTRS_FLAG          = 0x1,
	CERT_CASE_INSENSITIVE_IS_RDN_ATTRS_FLAG = 0x2,
}

export extern(Windows) BOOL CertComparePublicKeyInfo(DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pPublicKey1, PCERT_PUBLIC_KEY_INFO pPublicKey2);
export extern(Windows) DWORD CertGetPublicKeyLength(DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pPublicKey);
export extern(Windows) BOOL CryptVerifyCertificateSignature(HCRYPTPROV_LEGACY hCryptProv, DWORD dwCertEncodingType, const(BYTE)* pbEncoded, DWORD cbEncoded, PCERT_PUBLIC_KEY_INFO pPublicKey);
export extern(Windows) BOOL CryptVerifyCertificateSignatureEx(HCRYPTPROV_LEGACY hCryptProv, DWORD dwCertEncodingType, DWORD dwSubjectType, void* pvSubject, DWORD dwIssuerType, void* pvIssuer, DWORD dwFlags, void* pvReserved);

enum {
	CRYPT_VERIFY_CERT_SIGN_SUBJECT_BLOB                       = 1,
	CRYPT_VERIFY_CERT_SIGN_SUBJECT_CERT                       = 2,
	CRYPT_VERIFY_CERT_SIGN_SUBJECT_CRL                        = 3,
	CRYPT_VERIFY_CERT_SIGN_SUBJECT_OCSP_BASIC_SIGNED_RESPONSE = 4,
	CRYPT_VERIFY_CERT_SIGN_ISSUER_PUBKEY                      = 1,
	CRYPT_VERIFY_CERT_SIGN_ISSUER_CERT                        = 2,
	CRYPT_VERIFY_CERT_SIGN_ISSUER_CHAIN                       = 3,
	CRYPT_VERIFY_CERT_SIGN_ISSUER_NULL                        = 4,
}

export extern(Windows) BOOL CryptHashToBeSigned(HCRYPTPROV_LEGACY hCryptProv, DWORD dwCertEncodingType, const(BYTE)* pbEncoded, DWORD cbEncoded, BYTE* pbComputedHash, DWORD* pcbComputedHash);
export extern(Windows) BOOL CryptHashCertificate(HCRYPTPROV_LEGACY hCryptProv, ALG_ID Algid, DWORD dwFlags, const(BYTE)* pbEncoded, DWORD cbEncoded, BYTE* pbComputedHash, DWORD* pcbComputedHash);

static if(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL CryptHashCertificate2(LPCWSTR pwszCNGHashAlgid, DWORD dwFlags, void* pvReserved, const(BYTE)* pbEncoded, DWORD cbEncoded, BYTE* pbComputedHash, DWORD* pcbComputedHash);

export extern(Windows) BOOL CryptSignCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, DWORD dwKeySpec, DWORD dwCertEncodingType, const(BYTE)* pbEncodedToBeSigned, DWORD cbEncodedToBeSigned, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, const(void)* pvHashAuxInfo, BYTE* pbSignature, DWORD* pcbSignature);
export extern(Windows) BOOL CryptSignAndEncodeCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, DWORD dwKeySpec, DWORD dwCertEncodingType, LPCSTR lpszStructType, const(void)* pvStructInfo, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, const(void)* pvHashAuxInfo, BYTE* pbEncoded, DWORD* pcbEncoded);

const char* CRYPT_OID_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC = "CryptDllExtractEncodedSignatureParameters";
alias extern(Windows) BOOL function(DWORD dwCertEncodingType, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, void** ppvDecodedSignPara, LPWSTR* ppwszCNGHashAlgid) PFN_CRYPT_EXTRACT_ENCODED_SIGNATURE_PARAMETERS_FUNC;

const char* CRYPT_OID_SIGN_AND_ENCODE_HASH_FUNC = "CryptDllSignAndEncodeHash";
alias extern(Windows) BOOL function(NCRYPT_KEY_HANDLE hKey, DWORD dwCertEncodingType, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, void* pvDecodedSignPara, LPCWSTR pwszCNGPubKeyAlgid, LPCWSTR pwszCNGHashAlgid, BYTE* pbComputedHash, DWORD cbComputedHash, BYTE* pbSignature, DWORD* pcbSignature) PFN_CRYPT_SIGN_AND_ENCODE_HASH_FUNC;

const char* CRYPT_OID_VERIFY_ENCODED_SIGNATURE_FUNC = "CryptDllVerifyEncodedSignature";
alias extern(Windows) BOOL function(DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pPubKeyInfo, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, void* pvDecodedSignPara, LPCWSTR pwszCNGPubKeyAlgid, LPCWSTR pwszCNGHashAlgid, BYTE* pbComputedHash, DWORD cbComputedHash, BYTE* pbSignature, DWORD cbSignature) PFN_CRYPT_VERIFY_ENCODED_SIGNATURE_FUNC;

export extern(Windows) LONG CertVerifyTimeValidity(LPFILETIME pTimeToVerify, PCERT_INFO pCertInfo);
export extern(Windows) LONG CertVerifyCRLTimeValidity(LPFILETIME pTimeToVerify, PCRL_INFO pCrlInfo);
export extern(Windows) BOOL CertVerifyValidityNesting(PCERT_INFO pSubjectInfo, PCERT_INFO pIssuerInfo);
export extern(Windows) BOOL CertVerifyCRLRevocation(DWORD dwCertEncodingType, PCERT_INFO pCertId, DWORD cCrlInfo, PCRL_INFO* rgpCrlInfo);
export extern(Windows) LPCSTR CertAlgIdToOID(DWORD dwAlgId);
export extern(Windows) DWORD CertOIDToAlgId(LPCSTR pszObjId);
export extern(Windows) PCERT_EXTENSION CertFindExtension(LPCSTR pszObjId, DWORD cExtensions, CERT_EXTENSION* rgExtensions);
export extern(Windows) PCRYPT_ATTRIBUTE CertFindAttribute(LPCSTR pszObjId, DWORD cAttr, CRYPT_ATTRIBUTE* rgAttr);
export extern(Windows) PCERT_RDN_ATTR CertFindRDNAttr(LPCSTR pszObjId, PCERT_NAME_INFO pName);
export extern(Windows) BOOL CertGetIntendedKeyUsage(DWORD dwCertEncodingType, PCERT_INFO pCertInfo, BYTE* pbKeyUsage, DWORD cbKeyUsage);

enum HCRYPTDEFAULTCONTEXT : void* {init = (void*).init}

export extern(Windows) BOOL CryptInstallDefaultContext(HCRYPTPROV hCryptProv, DWORD dwDefaultType, const(void)* pvDefaultPara, DWORD dwFlags, void* pvReserved, HCRYPTDEFAULTCONTEXT* phDefaultContext);

enum {
	CRYPT_DEFAULT_CONTEXT_AUTO_RELEASE_FLAG = 0x00000001,
	CRYPT_DEFAULT_CONTEXT_PROCESS_FLAG      = 0x00000002,
}

enum {
	CRYPT_DEFAULT_CONTEXT_CERT_SIGN_OID       = 1,
	CRYPT_DEFAULT_CONTEXT_MULTI_CERT_SIGN_OID = 2,
}

struct CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA{
	DWORD cOID;
	LPSTR* rgpszOID;
}
alias CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA* PCRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA;

export extern(Windows) BOOL CryptUninstallDefaultContext(HCRYPTDEFAULTCONTEXT hDefaultContext, DWORD dwFlags, void* pvReserved);
export extern(Windows) BOOL CryptExportPublicKeyInfo(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, DWORD dwKeySpec, DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, DWORD* pcbInfo);

export extern(Windows) BOOL CryptExportPublicKeyInfoEx(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, DWORD dwKeySpec, DWORD dwCertEncodingType, LPSTR pszPublicKeyObjId, DWORD dwFlags, void* pvAuxInfo, PCERT_PUBLIC_KEY_INFO pInfo, DWORD* pcbInfo);

const char* CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FUNC = "CryptDllExportPublicKeyInfoEx";

const char* CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC = "CryptDllExportPublicKeyInfoEx2";
alias extern(Windows) BOOL function(NCRYPT_KEY_HANDLE hNCryptKey, DWORD dwCertEncodingType, LPSTR pszPublicKeyObjId, DWORD dwFlags, void* pvAuxInfo, PCERT_PUBLIC_KEY_INFO pInfo, DWORD* pcbInfo) PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_EX2_FUNC;

static if(NTDDI_VERSION >= NTDDI_WIN7)
	export extern(Windows) BOOL CryptExportPublicKeyInfoFromBCryptKeyHandle(BCRYPT_KEY_HANDLE hBCryptKey, DWORD dwCertEncodingType, LPSTR pszPublicKeyObjId, DWORD dwFlags, void* pvAuxInfo, PCERT_PUBLIC_KEY_INFO pInfo, DWORD* pcbInfo);

//(NTDDI_VERSION >= NTDDI_WIN7)
	const char* CRYPT_OID_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC = "CryptDllExportPublicKeyInfoFromBCryptKeyHandle";
	alias extern(Windows) BOOL function(BCRYPT_KEY_HANDLE hBCryptKey, DWORD dwCertEncodingType, LPSTR pszPublicKeyObjId, DWORD dwFlags, void* pvAuxInfo, PCERT_PUBLIC_KEY_INFO pInfo, DWORD* pcbInfo) PFN_CRYPT_EXPORT_PUBLIC_KEY_INFO_FROM_BCRYPT_HANDLE_FUNC;

export extern(Windows) BOOL CryptImportPublicKeyInfo(HCRYPTPROV hCryptProv, DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, HCRYPTKEY* phKey);

const char* CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_FUNC = "CryptDllImportPublicKeyInfoEx";

export extern(Windows) BOOL CryptImportPublicKeyInfoEx(HCRYPTPROV hCryptProv, DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, ALG_ID aiKeyAlg, DWORD dwFlags, void* pvAuxInfo, HCRYPTKEY* phKey);

static if(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL CryptImportPublicKeyInfoEx2(DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, DWORD dwFlags, void* pvAuxInfo, BCRYPT_KEY_HANDLE* phKey);
//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	const char* CRYPT_OID_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC = "CryptDllImportPublicKeyInfoEx2";
	alias extern(Windows) BOOL function(DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, DWORD dwFlags, void* pvAuxInfo, BCRYPT_KEY_HANDLE* phKey) PFN_IMPORT_PUBLIC_KEY_INFO_EX2_FUNC;


export extern(Windows) BOOL CryptAcquireCertificatePrivateKey(PCCERT_CONTEXT pCert, DWORD dwFlags, void* pvReserved, HCRYPTPROV_OR_NCRYPT_KEY_HANDLE* phCryptProvOrNCryptKey, DWORD* pdwKeySpec, BOOL* pfCallerFreeProvOrNCryptKey);

enum {
	CRYPT_ACQUIRE_CACHE_FLAG             = 0x00000001,
	CRYPT_ACQUIRE_USE_PROV_INFO_FLAG     = 0x00000002,
	CRYPT_ACQUIRE_COMPARE_KEY_FLAG       = 0x00000004,
	CRYPT_ACQUIRE_NO_HEALING             = 0x00000008,
	CRYPT_ACQUIRE_SILENT_FLAG            = 0x00000040,
	CRYPT_ACQUIRE_NCRYPT_KEY_FLAGS_MASK  = 0x00070000,
	CRYPT_ACQUIRE_ALLOW_NCRYPT_KEY_FLAG  = 0x00010000,
	CRYPT_ACQUIRE_PREFER_NCRYPT_KEY_FLAG = 0x00020000,
	CRYPT_ACQUIRE_ONLY_NCRYPT_KEY_FLAG   = 0x00040000,
}

export extern(Windows) BOOL CryptFindCertificateKeyProvInfo(PCCERT_CONTEXT pCert, DWORD dwFlags, void* pvReserved);

enum {
	CRYPT_FIND_USER_KEYSET_FLAG    = 0x00000001,
	CRYPT_FIND_MACHINE_KEYSET_FLAG = 0x00000002,
	CRYPT_FIND_SILENT_KEYSET_FLAG  = 0x00000040,
}

alias extern(Windows) BOOL function(HCRYPTPROV hCryptProv, CRYPT_PRIVATE_KEY_INFO* pPrivateKeyInfo, DWORD dwFlags, void* pvAuxInfo) PFN_IMPORT_PRIV_KEY_FUNC;

const char* CRYPT_OID_IMPORT_PRIVATE_KEY_INFO_FUNC = "CryptDllImportPrivateKeyInfoEx";

export extern(Windows) BOOL CryptImportPKCS8(CRYPT_PKCS8_IMPORT_PARAMS sPrivateKeyAndParams, DWORD dwFlags, HCRYPTPROV* phCryptProv, void* pvAuxInfo);

alias extern(Windows) BOOL function(HCRYPTPROV hCryptProv, DWORD dwKeySpec, LPSTR pszPrivateKeyObjId, DWORD dwFlags, void* pvAuxInfo, CRYPT_PRIVATE_KEY_INFO* pPrivateKeyInfo, DWORD* pcbPrivateKeyInfo) PFN_EXPORT_PRIV_KEY_FUNC;

const char* CRYPT_OID_EXPORT_PRIVATE_KEY_INFO_FUNC = "CryptDllExportPrivateKeyInfoEx";

alias CRYPT_DELETEKEYSET CRYPT_DELETE_KEYSET;

export extern(Windows) BOOL CryptExportPKCS8(HCRYPTPROV hCryptProv, DWORD dwKeySpec, LPSTR pszPrivateKeyObjId, DWORD dwFlags, void* pvAuxInfo, BYTE* pbPrivateKeyBlob, DWORD* pcbPrivateKeyBlob);
export extern(Windows) BOOL CryptExportPKCS8Ex(CRYPT_PKCS8_EXPORT_PARAMS* psExportParams, DWORD dwFlags, void* pvAuxInfo, BYTE* pbPrivateKeyBlob, DWORD* pcbPrivateKeyBlob);
export extern(Windows) BOOL CryptHashPublicKeyInfo(HCRYPTPROV_LEGACY hCryptProv, ALG_ID Algid, DWORD dwFlags, DWORD dwCertEncodingType, PCERT_PUBLIC_KEY_INFO pInfo, BYTE* pbComputedHash, DWORD* pcbComputedHash);
export extern(Windows) DWORD CertRDNValueToStrA(DWORD dwValueType, PCERT_RDN_VALUE_BLOB pValue, LPSTR psz, DWORD csz);
export extern(Windows) DWORD CertRDNValueToStrW(DWORD dwValueType, PCERT_RDN_VALUE_BLOB pValue, LPWSTR psz, DWORD csz);
version(UNICODE)
	alias CertRDNValueToStrW CertRDNValueToStr;
else
	alias CertRDNValueToStrA CertRDNValueToStr;

export extern(Windows) DWORD CertNameToStrA(DWORD dwCertEncodingType, PCERT_NAME_BLOB pName, DWORD dwStrType, LPSTR psz, DWORD csz);
export extern(Windows) DWORD CertNameToStrW(DWORD dwCertEncodingType, PCERT_NAME_BLOB pName, DWORD dwStrType, LPWSTR psz, DWORD csz);
version(UNICODE)
	alias CertNameToStrW CertNameToStr;
else
	alias CertNameToStrA CertNameToStr;

enum {
	CERT_SIMPLE_NAME_STR = 1,
	CERT_OID_NAME_STR    = 2,
	CERT_X500_NAME_STR   = 3,
	CERT_XML_NAME_STR    = 4,
}

enum {
	CERT_NAME_STR_SEMICOLON_FLAG            = 0x40000000,
	CERT_NAME_STR_NO_PLUS_FLAG              = 0x20000000,
	CERT_NAME_STR_NO_QUOTING_FLAG           = 0x10000000,
	CERT_NAME_STR_CRLF_FLAG                 = 0x08000000,
	CERT_NAME_STR_COMMA_FLAG                = 0x04000000,
	CERT_NAME_STR_REVERSE_FLAG              = 0x02000000,
	CERT_NAME_STR_FORWARD_FLAG              = 0x01000000,
	CERT_NAME_STR_DISABLE_IE4_UTF8_FLAG     = 0x00010000,
	CERT_NAME_STR_ENABLE_T61_UNICODE_FLAG   = 0x00020000,
	CERT_NAME_STR_ENABLE_UTF8_UNICODE_FLAG  = 0x00040000,
	CERT_NAME_STR_FORCE_UTF8_DIR_STR_FLAG   = 0x00080000,
	CERT_NAME_STR_DISABLE_UTF8_DIR_STR_FLAG = 0x00100000,
	CERT_NAME_STR_ENABLE_PUNYCODE_FLAG      = 0x00200000,
}

export extern(Windows) BOOL CertStrToNameA(DWORD dwCertEncodingType, LPCSTR pszX500, DWORD dwStrType, void* pvReserved, BYTE* pbEncoded, DWORD* pcbEncoded, LPCSTR* ppszError);
export extern(Windows) BOOL CertStrToNameW(DWORD dwCertEncodingType, LPCWSTR pszX500, DWORD dwStrType, void* pvReserved, BYTE* pbEncoded, DWORD* pcbEncoded, LPCWSTR* ppszError);
version(UNICODE)
	alias CertStrToNameW CertStrToName;
else
	alias CertStrToNameA CertStrToName;

export extern(Windows) DWORD CertGetNameStringA(PCCERT_CONTEXT pCertContext, DWORD dwType, DWORD dwFlags, void* pvTypePara, LPSTR pszNameString, DWORD cchNameString);
export extern(Windows) DWORD CertGetNameStringW(PCCERT_CONTEXT pCertContext, DWORD dwType, DWORD dwFlags, void* pvTypePara, LPWSTR pszNameString, DWORD cchNameString);
version(UNICODE)
	alias CertGetNameStringW CertGetNameString;
else
	alias CertGetNameStringA CertGetNameString;

enum {
	CERT_NAME_EMAIL_TYPE            = 1,
	CERT_NAME_RDN_TYPE              = 2,
	CERT_NAME_ATTR_TYPE             = 3,
	CERT_NAME_SIMPLE_DISPLAY_TYPE   = 4,
	CERT_NAME_FRIENDLY_DISPLAY_TYPE = 5,
	CERT_NAME_DNS_TYPE              = 6,
	CERT_NAME_URL_TYPE              = 7,
	CERT_NAME_UPN_TYPE              = 8,
	CERT_NAME_ISSUER_FLAG           = 0x1,
	CERT_NAME_DISABLE_IE4_UTF8_FLAG = 0x00010000,
}

alias extern(Windows) PCCERT_CONTEXT function(void* pvGetArg, DWORD dwCertEncodingType, PCERT_INFO pSignerId, HCERTSTORE hMsgCertStore) PFN_CRYPT_GET_SIGNER_CERTIFICATE;

struct CRYPT_SIGN_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgEncodingType;
	PCCERT_CONTEXT pSigningCert;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	void* pvHashAuxInfo;
	DWORD cMsgCert;
	PCCERT_CONTEXT* rgpMsgCert;
	DWORD cMsgCrl;
	PCCRL_CONTEXT* rgpMsgCrl;
	DWORD cAuthAttr;
	PCRYPT_ATTRIBUTE rgAuthAttr;
	DWORD cUnauthAttr;
	PCRYPT_ATTRIBUTE rgUnauthAttr;
	DWORD dwFlags;
	DWORD dwInnerContentType;
	//CRYPT_SIGN_MESSAGE_PARA_HAS_CMS_FIELDS
		CRYPT_ALGORITHM_IDENTIFIER HashEncryptionAlgorithm;
		void* pvHashEncryptionAuxInfo;
}
alias CRYPT_SIGN_MESSAGE_PARA* PCRYPT_SIGN_MESSAGE_PARA;

enum {
	CRYPT_MESSAGE_BARE_CONTENT_OUT_FLAG         = 0x00000001,
	CRYPT_MESSAGE_ENCAPSULATED_CONTENT_OUT_FLAG = 0x00000002,
	CRYPT_MESSAGE_KEYID_SIGNER_FLAG             = 0x00000004,
	CRYPT_MESSAGE_SILENT_KEYSET_FLAG            = 0x00000040,
}

struct CRYPT_VERIFY_MESSAGE_PARA{
	DWORD cbSize;
	DWORD dwMsgAndCertEncodingType;
	HCRYPTPROV_LEGACY hCryptProv;
	PFN_CRYPT_GET_SIGNER_CERTIFICATE pfnGetSignerCertificate;
	void* pvGetArg;
}
alias CRYPT_VERIFY_MESSAGE_PARA* PCRYPT_VERIFY_MESSAGE_PARA;

struct CRYPT_ENCRYPT_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgEncodingType;
	HCRYPTPROV_LEGACY hCryptProv;
	CRYPT_ALGORITHM_IDENTIFIER ContentEncryptionAlgorithm;
	void* pvEncryptionAuxInfo;
	DWORD dwFlags;
	DWORD dwInnerContentType;
}
alias CRYPT_ENCRYPT_MESSAGE_PARA* PCRYPT_ENCRYPT_MESSAGE_PARA;

enum CRYPT_MESSAGE_KEYID_RECIPIENT_FLAG = 0x4;

struct CRYPT_DECRYPT_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgAndCertEncodingType;
	DWORD cCertStore;
	HCERTSTORE* rghCertStore;
	//CRYPT_DECRYPT_MESSAGE_PARA_HAS_EXTRA_FIELDS
		 DWORD dwFlags;
}
alias CRYPT_DECRYPT_MESSAGE_PARA* PCRYPT_DECRYPT_MESSAGE_PARA;

struct CRYPT_HASH_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgEncodingType;
	HCRYPTPROV_LEGACY hCryptProv;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	void* pvHashAuxInfo;
}
alias CRYPT_HASH_MESSAGE_PARA* PCRYPT_HASH_MESSAGE_PARA;

struct CRYPT_KEY_SIGN_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgAndCertEncodingType;
	union {
		HCRYPTPROV hCryptProv;
		NCRYPT_KEY_HANDLE hNCryptKey;
	}
	DWORD dwKeySpec;
	CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
	void* pvHashAuxInfo;
	CRYPT_ALGORITHM_IDENTIFIER PubKeyAlgorithm;
}
alias CRYPT_KEY_SIGN_MESSAGE_PARA* PCRYPT_KEY_SIGN_MESSAGE_PARA;

struct CRYPT_KEY_VERIFY_MESSAGE_PARA {
	DWORD cbSize;
	DWORD dwMsgEncodingType;
	HCRYPTPROV_LEGACY hCryptProv;
}
alias CRYPT_KEY_VERIFY_MESSAGE_PARA* PCRYPT_KEY_VERIFY_MESSAGE_PARA;

export extern(Windows) BOOL CryptSignMessage(PCRYPT_SIGN_MESSAGE_PARA pSignPara, BOOL fDetachedSignature, DWORD cToBeSigned, const(BYTE)** rgpbToBeSigned, DWORD* rgcbToBeSigned, BYTE* pbSignedBlob, DWORD* pcbSignedBlob);
export extern(Windows) BOOL CryptVerifyMessageSignature(PCRYPT_VERIFY_MESSAGE_PARA pVerifyPara, DWORD dwSignerIndex, const(BYTE)* pbSignedBlob, DWORD cbSignedBlob, BYTE* pbDecoded, DWORD* pcbDecoded, PCCERT_CONTEXT* ppSignerCert);
export extern(Windows) LONG CryptGetMessageSignerCount(DWORD dwMsgEncodingType, const(BYTE)* pbSignedBlob, WORD cbSignedBlob);
export extern(Windows) HCERTSTORE CryptGetMessageCertificates(DWORD dwMsgAndCertEncodingType, HCRYPTPROV_LEGACY hCryptProv, DWORD dwFlags, const(BYTE)* pbSignedBlob, DWORD cbSignedBlob);
export extern(Windows) BOOL CryptVerifyDetachedMessageSignature(PCRYPT_VERIFY_MESSAGE_PARA pVerifyPara, DWORD dwSignerIndex, const(BYTE)** pbDetachedSignBlob, DWORD cbDetachedSignBlob, DWORD cToBeSigned, const(BYTE)** rgpbToBeSigned, DWORD* rgcbToBeSigned, PCCERT_CONTEXT* ppSignerCert);
export extern(Windows) BOOL CryptEncryptMessage(PCRYPT_ENCRYPT_MESSAGE_PARA pEncryptPara, DWORD cRecipientCert, PCCERT_CONTEXT* rgpRecipientCert, const(BYTE)* pbToBeEncrypted, DWORD cbToBeEncrypted, BYTE* pbEncryptedBlob, DWORD* pcbEncryptedBlob);
export extern(Windows) BOOL CryptDecryptMessage(PCRYPT_DECRYPT_MESSAGE_PARA pDecryptPara, const(BYTE)* pbEncryptedBlob, DWORD cbEncryptedBlob, BYTE* pbDecrypted, DWORD* pcbDecrypted, PCCERT_CONTEXT* ppXchgCert);
export extern(Windows) BOOL CryptSignAndEncryptMessage(PCRYPT_SIGN_MESSAGE_PARA pSignPara, PCRYPT_ENCRYPT_MESSAGE_PARA pEncryptPara, DWORD cRecipientCert, PCCERT_CONTEXT* rgpRecipientCert, const(BYTE)* pbToBeSignedAndEncrypted, DWORD cbToBeSignedAndEncrypted, BYTE* pbSignedAndEncryptedBlob, DWORD* pcbSignedAndEncryptedBlob);
export extern(Windows) BOOL CryptDecryptAndVerifyMessageSignature(PCRYPT_DECRYPT_MESSAGE_PARA pDecryptPara, PCRYPT_VERIFY_MESSAGE_PARA pVerifyPara, DWORD dwSignerIndex, const(BYTE)* pbEncryptedBlob, DWORD cbEncryptedBlob, BYTE* pbDecrypted, DWORD* pcbDecrypted, PCCERT_CONTEXT* ppXchgCert, PCCERT_CONTEXT* ppSignerCert);
export extern(Windows) BOOL CryptDecodeMessage(DWORD dwMsgTypeFlags, PCRYPT_DECRYPT_MESSAGE_PARA pDecryptPara, PCRYPT_VERIFY_MESSAGE_PARA pVerifyPara, DWORD dwSignerIndex, const(BYTE)* pbEncodedBlob, DWORD cbEncodedBlob, DWORD dwPrevInnerContentType, DWORD* pdwMsgType, DWORD* pdwInnerContentType, BYTE* pbDecoded, DWORD* pcbDecoded, PCCERT_CONTEXT* ppXchgCert, PCCERT_CONTEXT* ppSignerCert);
export extern(Windows) BOOL CryptHashMessage(PCRYPT_HASH_MESSAGE_PARA pHashPara, BOOL fDetachedHash, DWORD cToBeHashed, const(BYTE)** rgpbToBeHashed, DWORD* rgcbToBeHashed, BYTE* pbHashedBlob, DWORD* pcbHashedBlob, BYTE* pbComputedHash, DWORD* pcbComputedHash);
export extern(Windows) BOOL CryptVerifyMessageHash(PCRYPT_HASH_MESSAGE_PARA pHashPara, BYTE* pbHashedBlob, DWORD cbHashedBlob, BYTE* pbToBeHashed, DWORD* pcbToBeHashed, BYTE* pbComputedHash, DWORD* pcbComputedHash);
export extern(Windows) BOOL CryptVerifyDetachedMessageHash(PCRYPT_HASH_MESSAGE_PARA pHashPara, BYTE* pbDetachedHashBlob, DWORD cbDetachedHashBlob, DWORD cToBeHashed, const(BYTE)** rgpbToBeHashed, DWORD* rgcbToBeHashed, BYTE* pbComputedHash, DWORD* pcbComputedHash);
export extern(Windows) BOOL CryptSignMessageWithKey(PCRYPT_KEY_SIGN_MESSAGE_PARA pSignPara, const(BYTE)* pbToBeSigned, DWORD cbToBeSigned, BYTE* pbSignedBlob, DWORD* pcbSignedBlob);
export extern(Windows) BOOL CryptVerifyMessageSignatureWithKey(PCRYPT_KEY_VERIFY_MESSAGE_PARA pVerifyPara, PCERT_PUBLIC_KEY_INFO pPublicKeyInfo, const(BYTE)* pbSignedBlob, DWORD cbSignedBlob, BYTE* pbDecoded, DWORD* pcbDecoded);

export extern(Windows) HCERTSTORE CertOpenSystemStoreA(HCRYPTPROV_LEGACY hProv, LPCSTR szSubsystemProtocol);
export extern(Windows) HCERTSTORE CertOpenSystemStoreW(HCRYPTPROV_LEGACY hProv, LPCWSTR szSubsystemProtocol);
version(UNICODE)
	alias CertOpenSystemStoreW CertOpenSystemStore;
else
	alias CertOpenSystemStoreA CertOpenSystemStore;

export extern(Windows) BOOL CertAddEncodedCertificateToSystemStoreA(LPCSTR szCertStoreName, const(BYTE)* pbCertEncoded, DWORD cbCertEncoded);
export extern(Windows) BOOL CertAddEncodedCertificateToSystemStoreW(LPCWSTR szCertStoreName, const(BYTE)* pbCertEncoded, DWORD cbCertEncoded);
version(UNICODE)
	alias CertAddEncodedCertificateToSystemStoreW CertAddEncodedCertificateToSystemStore;
else
	alias CertAddEncodedCertificateToSystemStoreA CertAddEncodedCertificateToSystemStore;

struct CERT_CHAIN {
	DWORD cCerts;
	PCERT_BLOB certs;
	CRYPT_KEY_PROV_INFO keyLocatorInfo;
}
alias CERT_CHAIN* PCERT_CHAIN;

export extern(Windows) HRESULT FindCertsByIssuer(PCERT_CHAIN pCertChains, DWORD* pcbCertChains, DWORD* pcCertChains, BYTE* pbEncodedIssuerName, DWORD cbEncodedIssuerName, LPCWSTR pwszPurpose, DWORD dwKeySpec);
export extern(Windows) BOOL CryptQueryObject(DWORD dwObjectType, const(void)* pvObject, DWORD dwExpectedContentTypeFlags, DWORD dwExpectedFormatTypeFlags, DWORD dwFlags, DWORD* pdwMsgAndCertEncodingType, DWORD* pdwContentType, DWORD* pdwFormatType, HCERTSTORE* phCertStore, HCRYPTMSG* phMsg, const(void)** ppvContext);

enum {
	CERT_QUERY_OBJECT_FILE = 0x00000001,
	CERT_QUERY_OBJECT_BLOB = 0x00000002,
}

enum {
	CERT_QUERY_CONTENT_CERT                      = 1,
	CERT_QUERY_CONTENT_CTL                       = 2,
	CERT_QUERY_CONTENT_CRL                       = 3,
	CERT_QUERY_CONTENT_SERIALIZED_STORE          = 4,
	CERT_QUERY_CONTENT_SERIALIZED_CERT           = 5,
	CERT_QUERY_CONTENT_SERIALIZED_CTL            = 6,
	CERT_QUERY_CONTENT_SERIALIZED_CRL            = 7,
	CERT_QUERY_CONTENT_PKCS7_SIGNED              = 8,
	CERT_QUERY_CONTENT_PKCS7_UNSIGNED            = 9,
	CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED        = 10,
	CERT_QUERY_CONTENT_PKCS10                    = 11,
	CERT_QUERY_CONTENT_PFX                       = 12,
	CERT_QUERY_CONTENT_CERT_PAIR                 = 13,
	CERT_QUERY_CONTENT_PFX_AND_LOAD              = 14,
	CERT_QUERY_CONTENT_FLAG_CERT                 = ( 1 << CERT_QUERY_CONTENT_CERT),
	CERT_QUERY_CONTENT_FLAG_CTL                  = ( 1 << CERT_QUERY_CONTENT_CTL),
	CERT_QUERY_CONTENT_FLAG_CRL                  = ( 1 << CERT_QUERY_CONTENT_CRL),
	CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE     = ( 1 << CERT_QUERY_CONTENT_SERIALIZED_STORE),
	CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT      = ( 1 << CERT_QUERY_CONTENT_SERIALIZED_CERT),
	CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL       = ( 1 << CERT_QUERY_CONTENT_SERIALIZED_CTL),
	CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL       = ( 1 << CERT_QUERY_CONTENT_SERIALIZED_CRL),
	CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED         = ( 1 << CERT_QUERY_CONTENT_PKCS7_SIGNED),
	CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED       = ( 1 << CERT_QUERY_CONTENT_PKCS7_UNSIGNED),
	CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED   = ( 1 << CERT_QUERY_CONTENT_PKCS7_SIGNED_EMBED),
	CERT_QUERY_CONTENT_FLAG_PKCS10               = ( 1 << CERT_QUERY_CONTENT_PKCS10),
	CERT_QUERY_CONTENT_FLAG_PFX                  = ( 1 << CERT_QUERY_CONTENT_PFX),
	CERT_QUERY_CONTENT_FLAG_CERT_PAIR            = ( 1 << CERT_QUERY_CONTENT_CERT_PAIR),
	CERT_QUERY_CONTENT_FLAG_PFX_AND_LOAD         = ( 1 << CERT_QUERY_CONTENT_PFX_AND_LOAD),
	CERT_QUERY_CONTENT_FLAG_ALL                  = ( CERT_QUERY_CONTENT_FLAG_CERT | CERT_QUERY_CONTENT_FLAG_CTL | CERT_QUERY_CONTENT_FLAG_CRL | CERT_QUERY_CONTENT_FLAG_SERIALIZED_STORE | CERT_QUERY_CONTENT_FLAG_SERIALIZED_CERT | CERT_QUERY_CONTENT_FLAG_SERIALIZED_CTL | CERT_QUERY_CONTENT_FLAG_SERIALIZED_CRL | CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED | CERT_QUERY_CONTENT_FLAG_PKCS7_UNSIGNED | CERT_QUERY_CONTENT_FLAG_PKCS7_SIGNED_EMBED | CERT_QUERY_CONTENT_FLAG_PKCS10 | CERT_QUERY_CONTENT_FLAG_PFX | CERT_QUERY_CONTENT_FLAG_CERT_PAIR ),
	CERT_QUERY_FORMAT_BINARY                     = 1,
	CERT_QUERY_FORMAT_BASE64_ENCODED             = 2,
	CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED      = 3,
	CERT_QUERY_FORMAT_FLAG_BINARY                = ( 1 << CERT_QUERY_FORMAT_BINARY),
	CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED        = ( 1 << CERT_QUERY_FORMAT_BASE64_ENCODED),
	CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED = ( 1 << CERT_QUERY_FORMAT_ASN_ASCII_HEX_ENCODED),
	CERT_QUERY_FORMAT_FLAG_ALL                   = ( CERT_QUERY_FORMAT_FLAG_BINARY | CERT_QUERY_FORMAT_FLAG_BASE64_ENCODED | CERT_QUERY_FORMAT_FLAG_ASN_ASCII_HEX_ENCODED ),
}

export extern(Windows) LPVOID CryptMemAlloc(ULONG cbSize);
export extern(Windows) LPVOID CryptMemRealloc(LPVOID pv, ULONG cbSize);
export extern(Windows) VOID CryptMemFree(LPVOID pv);

enum HCRYPTASYNC : HANDLE {init = (HANDLE).init}
alias HCRYPTASYNC* PHCRYPTASYNC;

alias extern(Windows) VOID function(LPSTR pszParamOid, LPVOID pvParam) PFN_CRYPT_ASYNC_PARAM_FREE_FUNC;

export extern(Windows) BOOL CryptCreateAsyncHandle(DWORD dwFlags, PHCRYPTASYNC phAsync);
export extern(Windows) BOOL CryptSetAsyncParam(HCRYPTASYNC hAsync, LPSTR pszParamOid, LPVOID pvParam, PFN_CRYPT_ASYNC_PARAM_FREE_FUNC pfnFree);
export extern(Windows) BOOL CryptGetAsyncParam(HCRYPTASYNC hAsync, LPSTR pszParamOid, LPVOID* ppvParam, PFN_CRYPT_ASYNC_PARAM_FREE_FUNC* ppfnFree);
export extern(Windows) BOOL CryptCloseAsyncHandle(HCRYPTASYNC hAsync);

struct CRYPT_BLOB_ARRAY {
	DWORD cBlob;
	PCRYPT_DATA_BLOB rgBlob;
}
alias CRYPT_BLOB_ARRAY* PCRYPT_BLOB_ARRAY;

struct CRYPT_CREDENTIALS {
	DWORD cbSize;
	LPCSTR pszCredentialsOid;
	LPVOID pvCredentials;
}
alias CRYPT_CREDENTIALS* PCRYPT_CREDENTIALS;

const LPCSTR CREDENTIAL_OID_PASSWORD_CREDENTIALS_A = cast(LPCSTR)1;
const LPCSTR CREDENTIAL_OID_PASSWORD_CREDENTIALS_W = cast(LPCSTR)2;
version(UNICODE)
	alias CREDENTIAL_OID_PASSWORD_CREDENTIALS_W CREDENTIAL_OID_PASSWORD_CREDENTIALS;
else
	alias CREDENTIAL_OID_PASSWORD_CREDENTIALS_A CREDENTIAL_OID_PASSWORD_CREDENTIALS;

struct CRYPT_PASSWORD_CREDENTIALSA {
	DWORD cbSize;
	LPSTR pszUsername;
	LPSTR pszPassword;
}
alias CRYPT_PASSWORD_CREDENTIALSA* PCRYPT_PASSWORD_CREDENTIALSA;

struct CRYPT_PASSWORD_CREDENTIALSW {
	DWORD cbSize;
	LPWSTR pszUsername;
	LPWSTR pszPassword;
}
alias CRYPT_PASSWORD_CREDENTIALSW* PCRYPT_PASSWORD_CREDENTIALSW;
version(UNICODE){
	alias CRYPT_PASSWORD_CREDENTIALSW CRYPT_PASSWORD_CREDENTIALS;
	alias PCRYPT_PASSWORD_CREDENTIALSW PCRYPT_PASSWORD_CREDENTIALS;
}else{
	alias CRYPT_PASSWORD_CREDENTIALSA CRYPT_PASSWORD_CREDENTIALS;
	alias PCRYPT_PASSWORD_CREDENTIALSA PCRYPT_PASSWORD_CREDENTIALS;
}

const char* SCHEME_OID_RETRIEVE_ENCODED_OBJECT_FUNC = "SchemeDllRetrieveEncodedObject";
const char* SCHEME_OID_RETRIEVE_ENCODED_OBJECTW_FUNC = "SchemeDllRetrieveEncodedObjectW";

alias extern(Windows) VOID function(LPCSTR pszObjectOid, PCRYPT_BLOB_ARRAY pObject, LPVOID pvFreeContext) PFN_FREE_ENCODED_OBJECT_FUNC;

const char* CONTEXT_OID_CREATE_OBJECT_CONTEXT_FUNC = "ContextDllCreateObjectContext";
const LPCSTR CONTEXT_OID_CERTIFICATE = cast(LPCSTR)1;
const LPCSTR CONTEXT_OID_CRL = cast(LPCSTR)2;
const LPCSTR CONTEXT_OID_CTL = cast(LPCSTR)3;
const LPCSTR CONTEXT_OID_PKCS7 = cast(LPCSTR)4;
const LPCSTR CONTEXT_OID_CAPI2_ANY = cast(LPCSTR)5;
const LPCSTR CONTEXT_OID_OCSP_RESP = cast(LPCSTR)6;

enum {
	CRYPT_RETRIEVE_MULTIPLE_OBJECTS      = 0x00000001,
	CRYPT_CACHE_ONLY_RETRIEVAL           = 0x00000002,
	CRYPT_WIRE_ONLY_RETRIEVAL            = 0x00000004,
	CRYPT_DONT_CACHE_RESULT              = 0x00000008,
	CRYPT_ASYNC_RETRIEVAL                = 0x00000010,
	CRYPT_STICKY_CACHE_RETRIEVAL         = 0x00001000,
	CRYPT_LDAP_SCOPE_BASE_ONLY_RETRIEVAL = 0x00002000,
	CRYPT_OFFLINE_CHECK_RETRIEVAL        = 0x00004000,
	CRYPT_LDAP_INSERT_ENTRY_ATTRIBUTE    = 0x00008000,
	CRYPT_LDAP_SIGN_RETRIEVAL            = 0x00010000,
	CRYPT_NO_AUTH_RETRIEVAL              = 0x00020000,
	CRYPT_LDAP_AREC_EXCLUSIVE_RETRIEVAL  = 0x00040000,
	CRYPT_AIA_RETRIEVAL                  = 0x00080000,
	CRYPT_HTTP_POST_RETRIEVAL            = 0x00100000,
	CRYPT_PROXY_CACHE_RETRIEVAL          = 0x00200000,
	CRYPT_NOT_MODIFIED_RETRIEVAL         = 0x00400000,
	CRYPT_VERIFY_CONTEXT_SIGNATURE       = 0x00000020,
	CRYPT_VERIFY_DATA_HASH               = 0x00000040,
	CRYPT_KEEP_TIME_VALID                = 0x00000080,
	CRYPT_DONT_VERIFY_SIGNATURE          = 0x00000100,
	CRYPT_DONT_CHECK_TIME_VALIDITY       = 0x00000200,
	CRYPT_CHECK_FRESHNESS_TIME_VALIDITY  = 0x00000400,
	CRYPT_ACCUMULATIVE_TIMEOUT           = 0x00000800,
	CRYPT_OCSP_ONLY_RETRIEVAL            = 0x01000000,
}

struct CRYPTNET_URL_CACHE_PRE_FETCH_INFO {
	DWORD cbSize;
	DWORD dwObjectType;
	DWORD dwError;
	DWORD dwReserved;
	FILETIME ThisUpdateTime;
	FILETIME NextUpdateTime;
	FILETIME PublishTime;
}
alias CRYPTNET_URL_CACHE_PRE_FETCH_INFO* PCRYPTNET_URL_CACHE_PRE_FETCH_INFO;

enum {
	CRYPTNET_URL_CACHE_PRE_FETCH_NONE         = 0,
	CRYPTNET_URL_CACHE_PRE_FETCH_BLOB         = 1,
	CRYPTNET_URL_CACHE_PRE_FETCH_CRL          = 2,
	CRYPTNET_URL_CACHE_PRE_FETCH_OCSP         = 3,
	CRYPTNET_URL_CACHE_PRE_FETCH_AUTOROOT_CAB = 5,
}

struct CRYPTNET_URL_CACHE_FLUSH_INFO {
	DWORD cbSize;
	DWORD dwExemptSeconds;
	FILETIME ExpireTime;
}
alias CRYPTNET_URL_CACHE_FLUSH_INFO* PCRYPTNET_URL_CACHE_FLUSH_INFO;

enum {
	CRYPTNET_URL_CACHE_DEFAULT_FLUSH = 0,
	CRYPTNET_URL_CACHE_DISABLE_FLUSH = 0xFFFFFFFF,
}

struct CRYPTNET_URL_CACHE_RESPONSE_INFO {
	DWORD cbSize;
	WORD wResponseType;
	WORD wResponseFlags;
	FILETIME LastModifiedTime;
	DWORD dwMaxAge;
	LPCWSTR pwszETag;
	DWORD dwProxyId;
}
alias CRYPTNET_URL_CACHE_RESPONSE_INFO* PCRYPTNET_URL_CACHE_RESPONSE_INFO;

enum {
	CRYPTNET_URL_CACHE_RESPONSE_NONE      = 0,
	CRYPTNET_URL_CACHE_RESPONSE_HTTP      = 1,
	CRYPTNET_URL_CACHE_RESPONSE_VALIDATED = 0x8000,
}

struct CRYPT_RETRIEVE_AUX_INFO {
	DWORD cbSize;
	FILETIME* pLastSyncTime;
	DWORD dwMaxUrlRetrievalByteCount;
	PCRYPTNET_URL_CACHE_PRE_FETCH_INFO pPreFetchInfo;
	PCRYPTNET_URL_CACHE_FLUSH_INFO pFlushInfo;
	PCRYPTNET_URL_CACHE_RESPONSE_INFO* ppResponseInfo;
	LPWSTR pwszCacheFileNamePrefix;
	LPFILETIME pftCacheResync;
	BOOL fProxyCacheRetrieval;
	DWORD dwHttpStatusCode;
}
alias CRYPT_RETRIEVE_AUX_INFO* PCRYPT_RETRIEVE_AUX_INFO;

export extern(Windows) BOOL CryptRetrieveObjectByUrlA(LPCSTR pszUrl, LPCSTR pszObjectOid, DWORD dwRetrievalFlags, DWORD dwTimeout, LPVOID* ppvObject, HCRYPTASYNC hAsyncRetrieve, PCRYPT_CREDENTIALS pCredentials, LPVOID pvVerify, PCRYPT_RETRIEVE_AUX_INFO pAuxInfo);
export extern(Windows) BOOL CryptRetrieveObjectByUrlW(LPCWSTR pszUrl, LPCSTR pszObjectOid, DWORD dwRetrievalFlags, DWORD dwTimeout, LPVOID* ppvObject, HCRYPTASYNC hAsyncRetrieve, PCRYPT_CREDENTIALS pCredentials, LPVOID pvVerify, PCRYPT_RETRIEVE_AUX_INFO pAuxInfo);
version(UNICODE)
	alias CryptRetrieveObjectByUrlW CryptRetrieveObjectByUrl;
else
	alias CryptRetrieveObjectByUrlA CryptRetrieveObjectByUrl;


alias extern(Windows) BOOL function(DWORD dwFlags, void* pvArg) PFN_CRYPT_CANCEL_RETRIEVAL;
export extern(Windows) BOOL CryptInstallCancelRetrieval(PFN_CRYPT_CANCEL_RETRIEVAL pfnCancel, const(void)* pvArg, DWORD dwFlags, void* pvReserved);
export extern(Windows) BOOL CryptUninstallCancelRetrieval(DWORD dwFlags, void* pvReserved);
export extern(Windows) BOOL CryptCancelAsyncRetrieval(HCRYPTASYNC hAsyncRetrieval);

const LPCSTR CRYPT_PARAM_ASYNC_RETRIEVAL_COMPLETION = cast(LPCSTR)1;

alias extern(Windows) VOID function(LPVOID pvCompletion, DWORD dwCompletionCode, LPCSTR pszUrl, LPSTR pszObjectOid, LPVOID pvObject) PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC;

struct CRYPT_ASYNC_RETRIEVAL_COMPLETION {
	PFN_CRYPT_ASYNC_RETRIEVAL_COMPLETION_FUNC pfnCompletion;
	LPVOID pvCompletion;
}
alias CRYPT_ASYNC_RETRIEVAL_COMPLETION* PCRYPT_ASYNC_RETRIEVAL_COMPLETION;

const LPCSTR CRYPT_PARAM_CANCEL_ASYNC_RETRIEVAL = cast(LPCSTR)2;

alias extern(Windows) BOOL function(HCRYPTASYNC hAsyncRetrieve) PFN_CANCEL_ASYNC_RETRIEVAL_FUNC;

enum {
	CRYPT_GET_URL_FROM_PROPERTY         = 0x00000001,
	CRYPT_GET_URL_FROM_EXTENSION        = 0x00000002,
	CRYPT_GET_URL_FROM_UNAUTH_ATTRIBUTE = 0x00000004,
	CRYPT_GET_URL_FROM_AUTH_ATTRIBUTE   = 0x00000008,
}

struct CRYPT_URL_ARRAY {
	DWORD cUrl;
	LPWSTR* rgwszUrl;
}
alias CRYPT_URL_ARRAY* PCRYPT_URL_ARRAY;

struct CRYPT_URL_INFO {
	DWORD cbSize;
	DWORD dwSyncDeltaTime;
	DWORD cGroup;
	DWORD* rgcGroupEntry;
}
alias CRYPT_URL_INFO* PCRYPT_URL_INFO;

export extern(Windows) BOOL CryptGetObjectUrl(LPCSTR pszUrlOid, LPVOID pvPara, DWORD dwFlags, PCRYPT_URL_ARRAY pUrlArray, DWORD* pcbUrlArray, PCRYPT_URL_INFO pUrlInfo, DWORD* pcbUrlInfo, LPVOID pvReserved);

const char* URL_OID_GET_OBJECT_URL_FUNC = "UrlDllGetObjectUrl";
const LPCSTR URL_OID_CERTIFICATE_ISSUER = cast(LPCSTR)1;
const LPCSTR URL_OID_CERTIFICATE_CRL_DIST_POINT = cast(LPCSTR)2;
const LPCSTR URL_OID_CTL_ISSUER = cast(LPCSTR)3;
const LPCSTR URL_OID_CTL_NEXT_UPDATE = cast(LPCSTR)4;
const LPCSTR URL_OID_CRL_ISSUER = cast(LPCSTR)5;
const LPCSTR URL_OID_CERTIFICATE_FRESHEST_CRL = cast(LPCSTR)6;
const LPCSTR URL_OID_CRL_FRESHEST_CRL = cast(LPCSTR)7;
const LPCSTR URL_OID_CROSS_CERT_DIST_POINT = cast(LPCSTR)8;
const LPCSTR URL_OID_CERTIFICATE_OCSP = cast(LPCSTR)9;
const LPCSTR URL_OID_CERTIFICATE_OCSP_AND_CRL_DIST_POINT = cast(LPCSTR)10;
const LPCSTR URL_OID_CERTIFICATE_CRL_DIST_POINT_AND_OCSP = cast(LPCSTR)11;
const LPCSTR URL_OID_CROSS_CERT_SUBJECT_INFO_ACCESS = cast(LPCSTR)12;
const LPCSTR URL_OID_CERTIFICATE_ONLY_OCSP = cast(LPCSTR)13;

struct CERT_CRL_CONTEXT_PAIR {
	PCCERT_CONTEXT pCertContext;
	PCCRL_CONTEXT pCrlContext;
}
alias CERT_CRL_CONTEXT_PAIR* PCERT_CRL_CONTEXT_PAIR;
alias const(CERT_CRL_CONTEXT_PAIR)* PCCERT_CRL_CONTEXT_PAIR;

struct CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO {
	DWORD cbSize;
	int iDeltaCrlIndicator;
	LPFILETIME pftCacheResync;
	LPFILETIME pLastSyncTime;
	LPFILETIME pMaxAgeTime;
	PCERT_REVOCATION_CHAIN_PARA pChainPara;
	PCRYPT_INTEGER_BLOB pDeltaCrlIndicator;
}
alias CRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO* PCRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO;

export extern(Windows) BOOL CryptGetTimeValidObject(LPCSTR pszTimeValidOid, LPVOID pvPara, PCCERT_CONTEXT pIssuer, LPFILETIME pftValidFor, DWORD dwFlags, DWORD dwTimeout, LPVOID* ppvObject, PCRYPT_CREDENTIALS pCredentials, PCRYPT_GET_TIME_VALID_OBJECT_EXTRA_INFO pExtraInfo);

const char* TIME_VALID_OID_GET_OBJECT_FUNC = "TimeValidDllGetObject";
const LPCSTR TIME_VALID_OID_GET_CTL = cast(LPCSTR)1;
const LPCSTR TIME_VALID_OID_GET_CRL = cast(LPCSTR)2;
const LPCSTR TIME_VALID_OID_GET_CRL_FROM_CERT = cast(LPCSTR)3;
const LPCSTR TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CERT = cast(LPCSTR)4;
const LPCSTR TIME_VALID_OID_GET_FRESHEST_CRL_FROM_CRL = cast(LPCSTR)5;

export extern(Windows) BOOL CryptFlushTimeValidObject(LPCSTR pszFlushTimeValidOid, LPVOID pvPara, PCCERT_CONTEXT pIssuer, DWORD dwFlags, LPVOID pvReserved);

const char* TIME_VALID_OID_FLUSH_OBJECT_FUNC = "TimeValidDllFlushObject";
const LPCSTR TIME_VALID_OID_FLUSH_CTL = cast(LPCSTR)1;
const LPCSTR TIME_VALID_OID_FLUSH_CRL = cast(LPCSTR)2;
const LPCSTR TIME_VALID_OID_FLUSH_CRL_FROM_CERT = cast(LPCSTR)3;
const LPCSTR TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CERT = cast(LPCSTR)4;
const LPCSTR TIME_VALID_OID_FLUSH_FRESHEST_CRL_FROM_CRL = cast(LPCSTR)5;

struct CRYPTPROTECT_PROMPTSTRUCT {
	DWORD cbSize;
	DWORD dwPromptFlags;
	HWND hwndApp;
	LPCWSTR szPrompt;
}
alias CRYPTPROTECT_PROMPTSTRUCT* PCRYPTPROTECT_PROMPTSTRUCT;

//CRYPTPROTECT_DEFAULT_PROVIDER       = { 0xdf9d8cd0, 0x1501, 0x11d1, {0x8c, 0x7a, 0x00, 0xc0, 0x4f, 0xc2, 0x97, 0xeb} }
enum {
	CRYPTPROTECT_PROMPT_ON_UNPROTECT    = 0x1,
	CRYPTPROTECT_PROMPT_ON_PROTECT      = 0x2,
	CRYPTPROTECT_PROMPT_RESERVED        = 0x04,
	CRYPTPROTECT_PROMPT_STRONG          = 0x08,
	CRYPTPROTECT_PROMPT_REQUIRE_STRONG  = 0x10,
	CRYPTPROTECT_UI_FORBIDDEN           = 0x1,
	CRYPTPROTECT_LOCAL_MACHINE          = 0x4,
	CRYPTPROTECT_CRED_SYNC              = 0x8,
	CRYPTPROTECT_AUDIT                  = 0x10,
	CRYPTPROTECT_NO_RECOVERY            = 0x20,
	CRYPTPROTECT_VERIFY_PROTECTION      = 0x40,
	CRYPTPROTECT_CRED_REGENERATE        = 0x80,
	CRYPTPROTECT_FIRST_RESERVED_FLAGVAL = 0x0FFFFFFF,
	CRYPTPROTECT_LAST_RESERVED_FLAGVAL  = 0xFFFFFFFF,
}

export extern(Windows) BOOL CryptProtectData(DATA_BLOB* pDataIn, LPCWSTR szDataDescr, DATA_BLOB* pOptionalEntropy, PVOID pvReserved, CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, DWORD dwFlags, DATA_BLOB* pDataOut);
export extern(Windows) BOOL CryptUnprotectData(DATA_BLOB* pDataIn, LPWSTR* ppszDataDescr, DATA_BLOB* pOptionalEntropy, PVOID pvReserved, CRYPTPROTECT_PROMPTSTRUCT* pPromptStruct, DWORD dwFlags, DATA_BLOB* pDataOut);

static if(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	export extern(Windows) BOOL CryptUpdateProtectedState(PSID pOldSid, LPCWSTR pwszOldPassword, DWORD dwFlags, DWORD* pdwSuccessCount, DWORD* pdwFailureCount);

enum {
	CRYPTPROTECTMEMORY_BLOCK_SIZE    = 16,
	CRYPTPROTECTMEMORY_SAME_PROCESS  = 0x00,
	CRYPTPROTECTMEMORY_CROSS_PROCESS = 0x01,
	CRYPTPROTECTMEMORY_SAME_LOGON    = 0x02,
}

export extern(Windows) BOOL CryptProtectMemory(LPVOID pDataIn, DWORD cbDataIn, DWORD dwFlags);
export extern(Windows) BOOL CryptUnprotectMemory(LPVOID pDataIn, DWORD cbDataIn, DWORD dwFlags);
export extern(Windows) PCCERT_CONTEXT CertCreateSelfSignCertificate(HCRYPTPROV_OR_NCRYPT_KEY_HANDLE hCryptProvOrNCryptKey, PCERT_NAME_BLOB pSubjectIssuerBlob, DWORD dwFlags, PCRYPT_KEY_PROV_INFO pKeyProvInfo, PCRYPT_ALGORITHM_IDENTIFIER pSignatureAlgorithm, PSYSTEMTIME pStartTime, PSYSTEMTIME pEndTime, PCERT_EXTENSIONS pExtensions);

enum {
	CERT_CREATE_SELFSIGN_NO_SIGN     = 1,
	CERT_CREATE_SELFSIGN_NO_KEY_INFO = 2,
}

export extern(Windows) BOOL CryptGetKeyIdentifierProperty(const(CRYPT_HASH_BLOB)* pKeyIdentifier, DWORD dwPropId, DWORD dwFlags, LPCWSTR pwszComputerName, void* pvReserved, void* pvData, DWORD* pcbData);

enum {
	CRYPT_KEYID_MACHINE_FLAG = 0x00000020,
	CRYPT_KEYID_ALLOC_FLAG   = 0x00008000,
}

export extern(Windows) BOOL CryptSetKeyIdentifierProperty(const(CRYPT_HASH_BLOB)* pKeyIdentifier, DWORD dwPropId, DWORD dwFlags, LPCWSTR pwszComputerName, void* pvReserved, const(void)* pvData);

enum {
	CRYPT_KEYID_DELETE_FLAG  = 0x00000010,
	CRYPT_KEYID_SET_NEW_FLAG = 0x00002000,
}

alias extern(Windows) BOOL function(const(CRYPT_HASH_BLOB)* pKeyIdentifier, DWORD dwFlags, void* pvReserved, void* pvArg, DWORD cProp, DWORD* rgdwPropId, void** rgpvData, DWORD* rgcbData) PFN_CRYPT_ENUM_KEYID_PROP;
export extern(Windows) BOOL CryptEnumKeyIdentifierProperties(const(CRYPT_HASH_BLOB)* pKeyIdentifier, DWORD dwPropId, DWORD dwFlags, LPCWSTR pwszComputerName, void* pvReserved, void* pvArg, PFN_CRYPT_ENUM_KEYID_PROP pfnEnum);
export extern(Windows) BOOL CryptCreateKeyIdentifierFromCSP(DWORD dwCertEncodingType, LPCSTR pszPubKeyOID, const(PUBLICKEYSTRUC)* pPubKeyStruc, DWORD cbPubKeyStruc, DWORD dwFlags, void* pvReserved, BYTE* pbHash, DWORD* pcbHash);

const wchar* CERT_CHAIN_CONFIG_REGPATH = "Software\\Microsoft\\Cryptography\\OID\\EncodingType 0\\CertDllCreateCertificateChainEngine\\Config";
const wchar* CERT_CHAIN_MAX_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME = "MaxUrlRetrievalByteCount";
enum CERT_CHAIN_MAX_URL_RETRIEVAL_BYTE_COUNT_DEFAULT = 100 * 1024 * 1024;
const wchar* CERT_CHAIN_CACHE_RESYNC_FILETIME_VALUE_NAME = "ChainCacheResyncFiletime";
const wchar* CERT_CHAIN_DISABLE_MANDATORY_BASIC_CONSTRAINTS_VALUE_NAME = "DisableMandatoryBasicConstraints";
const wchar* CERT_CHAIN_DISABLE_CA_NAME_CONSTRAINTS_VALUE_NAME = "DisableCANameConstraints";
const wchar* CERT_CHAIN_DISABLE_UNSUPPORTED_CRITICAL_EXTENSIONS_VALUE_NAME = "DisableUnsupportedCriticalExtensions";
const wchar* CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_VALUE_NAME = "MaxAIAUrlCountInCert";
enum CERT_CHAIN_MAX_AIA_URL_COUNT_IN_CERT_DEFAULT = 5;
const wchar* CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_VALUE_NAME = "MaxAIAUrlRetrievalCountPerChain";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_COUNT_PER_CHAIN_DEFAULT = 3;
const wchar* CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_VALUE_NAME = "MaxAIAUrlRetrievalByteCount";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_BYTE_COUNT_DEFAULT= 100000;
const wchar* CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_VALUE_NAME = "MaxAIAUrlRetrievalCertCount";
enum CERT_CHAIN_MAX_AIA_URL_RETRIEVAL_CERT_COUNT_DEFAULT = 10;
const wchar* CERT_CHAIN_OCSP_VALIDITY_SECONDS_VALUE_NAME = "OcspValiditySeconds";
enum CERT_CHAIN_OCSP_VALIDITY_SECONDS_DEFAULT = 12 * 60 * 60;
const wchar* CERT_SRV_OCSP_RESP_MIN_VALIDITY_SECONDS_VALUE_NAME = "SrvOcspRespMinValiditySeconds";
enum CERT_SRV_OCSP_RESP_MIN_VALIDITY_SECONDS_DEFAULT = 10 * 60;
const wchar* CERT_SRV_OCSP_RESP_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "SrvOcspRespUrlRetrievalTimeoutMilliseconds";
enum CERT_SRV_OCSP_RESP_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_DEFAULT = 15 * 1000;
const wchar* CERT_SRV_OCSP_RESP_MAX_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "SrvOcspRespMaxBeforeNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MAX_BEFORE_NEXT_UPDATE_SECONDS_DEFAULT = 4 * 60 * 60;
const wchar* CERT_SRV_OCSP_RESP_MIN_BEFORE_NEXT_UPDATE_SECONDS_VALUE_NAME = "SrvOcspRespMinBeforeNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MIN_BEFORE_NEXT_UPDATE_SECONDS_DEFAULT = 2 * 60;
const wchar* CERT_SRV_OCSP_RESP_MIN_AFTER_NEXT_UPDATE_SECONDS_VALUE_NAME= "SrvOcspRespMinAfterNextUpdateSeconds";
enum CERT_SRV_OCSP_RESP_MIN_AFTER_NEXT_UPDATE_SECONDS_DEFAULT = 1 * 60;
const wchar* CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_VALUE_NAME = "CryptnetMaxCachedOcspPerCrlCount";
enum CRYPTNET_MAX_CACHED_OCSP_PER_CRL_COUNT_DEFAULT = 500;
enum CRYPTNET_OCSP_AFTER_CRL_DISABLE = 0xFFFFFFFF;
const wchar* CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_VALUE_NAME = "CryptnetDefaultFlushExemptSeconds";
enum CRYPTNET_URL_CACHE_DEFAULT_FLUSH_EXEMPT_SECONDS_DEFAULT = 28 * 24 * 60 * 60;
const wchar* CRYPTNET_PRE_FETCH_MIN_MAX_AGE_SECONDS_VALUE_NAME = "CryptnetPreFetchMinMaxAgeSeconds";
enum CRYPTNET_PRE_FETCH_MIN_MAX_AGE_SECONDS_DEFAULT = 1 * 60 * 60;
const wchar* CRYPTNET_PRE_FETCH_MAX_MAX_AGE_SECONDS_VALUE_NAME = "CryptnetPreFetchMaxMaxAgeSeconds";
enum CRYPTNET_PRE_FETCH_MAX_MAX_AGE_SECONDS_DEFAULT = 14 * 24 * 60 * 60;
const wchar* CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchAfterPublishPreFetchDivisor";
enum CRYPTNET_PRE_FETCH_AFTER_PUBLISH_PRE_FETCH_DIVISOR_DEFAULT = 10;
const wchar* CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchBeforeNextUpdatePreFetchDivisor";
enum CRYPTNET_PRE_FETCH_BEFORE_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 20;
const wchar* CRYPTNET_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMinBeforeNextUpdatePreFetchSeconds";
enum CRYPTNET_PRE_FETCH_MIN_BEFORE_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_DEFAULT = 1 * 60 * 60;
const wchar* CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_VALUE_NAME = "CryptnetPreFetchValidityPeriodAfterNextUpdatePreFetchDivisor";
enum CRYPTNET_PRE_FETCH_VALIDITY_PERIOD_AFTER_NEXT_UPDATE_PRE_FETCH_DIVISOR_DEFAULT = 10;
const wchar* CRYPTNET_PRE_FETCH_MAX_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMaxAfterNextUpdatePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_MAX_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_DEFAULT = 4 * 60 * 60;
const wchar* CRYPTNET_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchMinAfterNextUpdatePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_MIN_AFTER_NEXT_UPDATE_PRE_FETCH_PERIOD_SECONDS_DEFAULT = 30 * 60;
const wchar* CRYPTNET_PRE_FETCH_AFTER_CURRENT_TIME_PRE_FETCH_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchAfterCurrentTimePreFetchPeriodSeconds";
enum CRYPTNET_PRE_FETCH_AFTER_CURRENT_TIME_PRE_FETCH_PERIOD_SECONDS_DEFAULT = 30 * 60;
const wchar* CRYPTNET_PRE_FETCH_TRIGGER_PERIOD_SECONDS_VALUE_NAME = "CryptnetPreFetchTriggerPeriodSeconds";
enum CRYPTNET_PRE_FETCH_TRIGGER_PERIOD_SECONDS_DEFAULT = 10 * 60;
enum CRYPTNET_PRE_FETCH_TRIGGER_DISABLE = 0xFFFFFFFF;
const wchar* CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_VALUE_NAME = "CryptnetPreFetchScanAfterTriggerDelaySeconds";
enum CRYPTNET_PRE_FETCH_SCAN_AFTER_TRIGGER_DELAY_SECONDS_DEFAULT = 30;
const wchar* CRYPTNET_PRE_FETCH_RETRIEVAL_TIMEOUT_SECONDS_VALUE_NAME = "CryptnetPreFetchRetrievalTimeoutSeconds";
enum CRYPTNET_PRE_FETCH_RETRIEVAL_TIMEOUT_SECONDS_DEFAULT = 5 * 60;
const wchar* CERT_GROUP_POLICY_CHAIN_CONFIG_REGPATH = "Software\\Policies\\Microsoft\\SystemCertificates\\ChainEngine\\Config";
const wchar* CERT_CHAIN_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "ChainUrlRetrievalTimeoutMilliseconds";
enum CERT_CHAIN_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_DEFAULT = 15 * 1000;
const wchar* CERT_CHAIN_REV_ACCUMULATIVE_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_VALUE_NAME = "ChainRevAccumulativeUrlRetrievalTimeoutMilliseconds";
enum CERT_CHAIN_REV_ACCUMULATIVE_URL_RETRIEVAL_TIMEOUT_MILLISECONDS_DEFAULT = 20 * 1000;
const wchar* CERT_RETR_BEHAVIOR_INET_AUTH_VALUE_NAME = "EnableInetUnknownAuth";
const wchar* CERT_RETR_BEHAVIOR_INET_STATUS_VALUE_NAME = "EnableInetLocal";
const wchar* CERT_RETR_BEHAVIOR_FILE_VALUE_NAME = "AllowFileUrlScheme";
const wchar* CERT_RETR_BEHAVIOR_LDAP_VALUE_NAME = "DisableLDAPSignAndEncrypt";
const wchar* CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_VALUE_NAME = "CryptnetCachedOcspSwitchToCrlCount";
enum CRYPTNET_CACHED_OCSP_SWITCH_TO_CRL_COUNT_DEFAULT = 50;
enum CRYPTNET_CRL_BEFORE_OCSP_ENABLE = 0xFFFFFFFF;
const wchar* CERT_CHAIN_DISABLE_AIA_URL_RETRIEVAL_VALUE_NAME = "DisableAIAUrlRetrieval";
const wchar* CERT_CHAIN_OPTIONS_VALUE_NAME = "Options";
enum CERT_CHAIN_OPTION_DISABLE_AIA_URL_RETRIEVAL = 0x2;
enum CERT_CHAIN_OPTION_ENABLE_SIA_URL_RETRIEVAL = 0x4;
const wchar* CERT_CHAIN_CROSS_CERT_DOWNLOAD_INTERVAL_HOURS_VALUE_NAME = "CrossCertDownloadIntervalHours";
enum CERT_CHAIN_CROSS_CERT_DOWNLOAD_INTERVAL_HOURS_DEFAULT = 24 * 7;
const wchar* CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_VALUE_NAME = "CRLValidityExtensionPeriod";
enum CERT_CHAIN_CRL_VALIDITY_EXT_PERIOD_HOURS_DEFAULT = 12;

enum HCERTCHAINENGINE : HANDLE {init = (HANDLE).init}
const HCERTCHAINENGINE HCCE_CURRENT_USER = cast(HCERTCHAINENGINE)null;
const HCERTCHAINENGINE HCCE_LOCAL_MACHINE = cast(HCERTCHAINENGINE)0x1;

enum {
	CERT_CHAIN_CACHE_END_CERT           = 0x00000001,
	CERT_CHAIN_THREAD_STORE_SYNC        = 0x00000002,
	CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL = 0x00000004,
	CERT_CHAIN_USE_LOCAL_MACHINE_STORE  = 0x00000008,
	CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE = 0x00000010,
	CERT_CHAIN_ENABLE_SHARE_STORE       = 0x00000020,
}

struct CERT_CHAIN_ENGINE_CONFIG {
	DWORD cbSize;
	HCERTSTORE hRestrictedRoot;
	HCERTSTORE hRestrictedTrust;
	HCERTSTORE hRestrictedOther;
	DWORD cAdditionalStore;
	HCERTSTORE* rghAdditionalStore;
	DWORD dwFlags;
	DWORD dwUrlRetrievalTimeout;
	DWORD MaximumCachedCertificates;
	DWORD CycleDetectionModulus;
	//(NTDDI_VERSION >= NTDDI_WIN7)
		HCERTSTORE hExclusiveRoot;
		HCERTSTORE hExclusiveTrustedPeople;
}
alias CERT_CHAIN_ENGINE_CONFIG* PCERT_CHAIN_ENGINE_CONFIG;

export extern(Windows) BOOL CertCreateCertificateChainEngine(PCERT_CHAIN_ENGINE_CONFIG pConfig, HCERTCHAINENGINE* phChainEngine);
export extern(Windows) VOID CertFreeCertificateChainEngine(HCERTCHAINENGINE hChainEngine);
export extern(Windows) BOOL CertResyncCertificateChainEngine(HCERTCHAINENGINE hChainEngine);

struct CERT_TRUST_STATUS {
	DWORD dwErrorStatus;
	DWORD dwInfoStatus;
}
alias CERT_TRUST_STATUS* PCERT_TRUST_STATUS;

enum {
	CERT_TRUST_NO_ERROR                          = 0x00000000,
	CERT_TRUST_IS_NOT_TIME_VALID                 = 0x00000001,
	CERT_TRUST_IS_NOT_TIME_NESTED                = 0x00000002,
	CERT_TRUST_IS_REVOKED                        = 0x00000004,
	CERT_TRUST_IS_NOT_SIGNATURE_VALID            = 0x00000008,
	CERT_TRUST_IS_NOT_VALID_FOR_USAGE            = 0x00000010,
	CERT_TRUST_IS_UNTRUSTED_ROOT                 = 0x00000020,
	CERT_TRUST_REVOCATION_STATUS_UNKNOWN         = 0x00000040,
	CERT_TRUST_IS_CYCLIC                         = 0x00000080,
	CERT_TRUST_INVALID_EXTENSION                 = 0x00000100,
	CERT_TRUST_INVALID_POLICY_CONSTRAINTS        = 0x00000200,
	CERT_TRUST_INVALID_BASIC_CONSTRAINTS         = 0x00000400,
	CERT_TRUST_INVALID_NAME_CONSTRAINTS          = 0x00000800,
	CERT_TRUST_HAS_NOT_SUPPORTED_NAME_CONSTRAINT = 0x00001000,
	CERT_TRUST_HAS_NOT_DEFINED_NAME_CONSTRAINT   = 0x00002000,
	CERT_TRUST_HAS_NOT_PERMITTED_NAME_CONSTRAINT = 0x00004000,
	CERT_TRUST_HAS_EXCLUDED_NAME_CONSTRAINT      = 0x00008000,
	CERT_TRUST_IS_OFFLINE_REVOCATION             = 0x01000000,
	CERT_TRUST_NO_ISSUANCE_CHAIN_POLICY          = 0x02000000,
	CERT_TRUST_IS_EXPLICIT_DISTRUST              = 0x04000000,
	CERT_TRUST_HAS_NOT_SUPPORTED_CRITICAL_EXT    = 0x08000000,
	CERT_TRUST_IS_PARTIAL_CHAIN                  = 0x00010000,
	CERT_TRUST_CTL_IS_NOT_TIME_VALID             = 0x00020000,
	CERT_TRUST_CTL_IS_NOT_SIGNATURE_VALID        = 0x00040000,
	CERT_TRUST_CTL_IS_NOT_VALID_FOR_USAGE        = 0x00080000,
	CERT_TRUST_HAS_EXACT_MATCH_ISSUER            = 0x00000001,
	CERT_TRUST_HAS_KEY_MATCH_ISSUER              = 0x00000002,
	CERT_TRUST_HAS_NAME_MATCH_ISSUER             = 0x00000004,
	CERT_TRUST_IS_SELF_SIGNED                    = 0x00000008,
	CERT_TRUST_HAS_PREFERRED_ISSUER              = 0x00000100,
	CERT_TRUST_HAS_ISSUANCE_CHAIN_POLICY         = 0x00000200,
	CERT_TRUST_HAS_VALID_NAME_CONSTRAINTS        = 0x00000400,
	CERT_TRUST_IS_PEER_TRUSTED                   = 0x00000800,
	CERT_TRUST_HAS_CRL_VALIDITY_EXTENDED         = 0x00001000,
	CERT_TRUST_IS_FROM_EXCLUSIVE_TRUST_STORE     = 0x00002000,
	CERT_TRUST_IS_COMPLEX_CHAIN                  = 0x00010000,
}

struct CERT_REVOCATION_INFO{
	DWORD cbSize;
	DWORD dwRevocationResult;
	LPCSTR pszRevocationOid;
	LPVOID pvOidSpecificInfo;
	BOOL fHasFreshnessTime;
	DWORD dwFreshnessTime;
	PCERT_REVOCATION_CRL_INFO pCrlInfo;
}
alias CERT_REVOCATION_INFO* PCERT_REVOCATION_INFO;

struct CERT_TRUST_LIST_INFO {
	DWORD cbSize;
	PCTL_ENTRY pCtlEntry;
	PCCTL_CONTEXT pCtlContext;
}
alias CERT_TRUST_LIST_INFO* PCERT_TRUST_LIST_INFO;

struct CERT_CHAIN_ELEMENT {
	DWORD cbSize;
	PCCERT_CONTEXT pCertContext;
	CERT_TRUST_STATUS TrustStatus;
	PCERT_REVOCATION_INFO pRevocationInfo;
	PCERT_ENHKEY_USAGE pIssuanceUsage;
	PCERT_ENHKEY_USAGE pApplicationUsage;
	LPCWSTR pwszExtendedErrorInfo;
}
alias CERT_CHAIN_ELEMENT* PCERT_CHAIN_ELEMENT;
alias const(CERT_CHAIN_ELEMENT)* PCCERT_CHAIN_ELEMENT;

struct CERT_SIMPLE_CHAIN {
	DWORD cbSize;
	CERT_TRUST_STATUS TrustStatus;
	DWORD cElement;
	PCERT_CHAIN_ELEMENT* rgpElement;
	PCERT_TRUST_LIST_INFO pTrustListInfo;
	BOOL fHasRevocationFreshnessTime;
	DWORD dwRevocationFreshnessTime;
}
alias CERT_SIMPLE_CHAIN* PCERT_SIMPLE_CHAIN;
alias const(CERT_SIMPLE_CHAIN)* PCCERT_SIMPLE_CHAIN;

struct CERT_CHAIN_CONTEXT {
	DWORD cbSize;
	CERT_TRUST_STATUS TrustStatus;
	DWORD cChain;
	PCERT_SIMPLE_CHAIN* rgpChain;
	DWORD cLowerQualityChainContext;
	PCCERT_CHAIN_CONTEXT* rgpLowerQualityChainContext;
	BOOL fHasRevocationFreshnessTime;
	DWORD dwRevocationFreshnessTime;
	DWORD dwCreateFlags;
	GUID ChainId;
}
alias CERT_CHAIN_CONTEXT* PCERT_CHAIN_CONTEXT;
alias const(CERT_CHAIN_CONTEXT)* PCCERT_CHAIN_CONTEXT;

enum {
	USAGE_MATCH_TYPE_AND = 0x00000000,
	USAGE_MATCH_TYPE_OR  = 0x00000001,
}

struct CERT_USAGE_MATCH {
	DWORD dwType;
	CERT_ENHKEY_USAGE Usage;
}
alias CERT_USAGE_MATCH* PCERT_USAGE_MATCH;

struct CTL_USAGE_MATCH {
	DWORD dwType;
	CTL_USAGE Usage;
}
alias CTL_USAGE_MATCH* PCTL_USAGE_MATCH;

struct CERT_CHAIN_PARA {
	DWORD cbSize;
	CERT_USAGE_MATCH RequestedUsage;
	//CERT_CHAIN_PARA_HAS_EXTRA_FIELDS
		CERT_USAGE_MATCH RequestedIssuancePolicy;
		DWORD dwUrlRetrievalTimeout;
		BOOL fCheckRevocationFreshnessTime;
		DWORD dwRevocationFreshnessTime;
		LPFILETIME pftCacheResync;
}
alias CERT_CHAIN_PARA* PCERT_CHAIN_PARA;

enum {
	CERT_CHAIN_REVOCATION_CHECK_END_CERT           = 0x10000000,
	CERT_CHAIN_REVOCATION_CHECK_CHAIN              = 0x20000000,
	CERT_CHAIN_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x40000000,
	CERT_CHAIN_REVOCATION_CHECK_CACHE_ONLY         = 0x80000000,
	CERT_CHAIN_REVOCATION_ACCUMULATIVE_TIMEOUT     = 0x08000000,
	CERT_CHAIN_REVOCATION_CHECK_OCSP_CERT          = 0x04000000,
	CERT_CHAIN_DISABLE_PASS1_QUALITY_FILTERING     = 0x00000040,
	CERT_CHAIN_RETURN_LOWER_QUALITY_CONTEXTS       = 0x00000080,
	CERT_CHAIN_DISABLE_AUTH_ROOT_AUTO_UPDATE       = 0x00000100,
	CERT_CHAIN_TIMESTAMP_TIME                      = 0x00000200,
	CERT_CHAIN_ENABLE_PEER_TRUST                   = 0x00000400,
	CERT_CHAIN_DISABLE_MY_PEER_TRUST               = 0x00000800,
}

export extern(Windows) BOOL CertGetCertificateChain(HCERTCHAINENGINE hChainEngine, LPFILETIME pTime, HCERTSTORE hAdditionalStore, PCERT_CHAIN_PARA pChainPara, DWORD dwFlags, LPVOID pvReserved, PCCERT_CHAIN_CONTEXT* ppChainContext);
export extern(Windows) VOID CertFreeCertificateChain(PCCERT_CHAIN_CONTEXT pChainContext);
export extern(Windows) PCCERT_CHAIN_CONTEXT CertDuplicateCertificateChain(PCCERT_CHAIN_CONTEXT pChainContext);

struct CERT_REVOCATION_CHAIN_PARA {
	DWORD cbSize;
	HCERTCHAINENGINE hChainEngine;
	HCERTSTORE hAdditionalStore;
	DWORD dwChainFlags;
	DWORD dwUrlRetrievalTimeout;
	LPFILETIME pftCurrentTime;
	LPFILETIME pftCacheResync;
	DWORD cbMaxUrlRetrievalByteCount;
}
alias CERT_REVOCATION_CHAIN_PARA* PCERT_REVOCATION_CHAIN_PARA;
 
const LPCSTR REVOCATION_OID_CRL_REVOCATION = cast(LPCSTR)1;

struct CRL_REVOCATION_INFO {
	PCRL_ENTRY pCrlEntry;
	PCCRL_CONTEXT pCrlContext;
	PCCERT_CHAIN_CONTEXT pCrlIssuerChain;
}
alias CRL_REVOCATION_INFO* PCRL_REVOCATION_INFO;

export extern(Windows) PCCERT_CHAIN_CONTEXT CertFindChainInStore(HCERTSTORE hCertStore, DWORD dwCertEncodingType, DWORD dwFindFlags, DWORD dwFindType, const(void)* pvFindPara, PCCERT_CHAIN_CONTEXT pPrevChainContext);

enum CERT_CHAIN_FIND_BY_ISSUER = 1;
alias extern(Windows) BOOL function(PCCERT_CONTEXT pCert, void* pvFindArg) PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK;

struct CERT_CHAIN_FIND_ISSUER_PARA {
	DWORD cbSize;
	LPCSTR pszUsageIdentifier;
	DWORD dwKeySpec;
	DWORD dwAcquirePrivateKeyFlags;
	DWORD cIssuer;
	CERT_NAME_BLOB* rgIssuer;
	PFN_CERT_CHAIN_FIND_BY_ISSUER_CALLBACK pfnFindCallback;
	void* pvFindArg;
	//CERT_CHAIN_FIND_BY_ISSUER_PARA_HAS_EXTRA_FIELDS
		DWORD* pdwIssuerChainIndex;
		DWORD* pdwIssuerElementIndex;
}
alias CERT_CHAIN_FIND_ISSUER_PARA* PCERT_CHAIN_FIND_ISSUER_PARA;
alias CERT_CHAIN_FIND_ISSUER_PARA CERT_CHAIN_FIND_BY_ISSUER_PARA;
alias CERT_CHAIN_FIND_BY_ISSUER_PARA* PCERT_CHAIN_FIND_BY_ISSUER_PARA;

enum {
	CERT_CHAIN_FIND_BY_ISSUER_COMPARE_KEY_FLAG    = 0x0001,
	CERT_CHAIN_FIND_BY_ISSUER_COMPLEX_CHAIN_FLAG  = 0x0002,
	CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_URL_FLAG = 0x0004,
	CERT_CHAIN_FIND_BY_ISSUER_LOCAL_MACHINE_FLAG  = 0x0008,
	CERT_CHAIN_FIND_BY_ISSUER_NO_KEY_FLAG         = 0x4000,
	CERT_CHAIN_FIND_BY_ISSUER_CACHE_ONLY_FLAG     = 0x8000,
}

struct CERT_CHAIN_POLICY_PARA {
	DWORD cbSize;
	DWORD dwFlags;
	void* pvExtraPolicyPara;
}
alias CERT_CHAIN_POLICY_PARA* PCERT_CHAIN_POLICY_PARA;

struct CERT_CHAIN_POLICY_STATUS {
	DWORD cbSize;
	DWORD dwError;
	LONG lChainIndex;
	LONG lElementIndex;
	void* pvExtraPolicyStatus;
}
alias CERT_CHAIN_POLICY_STATUS* PCERT_CHAIN_POLICY_STATUS;

enum {
	CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG             = 0x00000001,
	CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG         = 0x00000002,
	CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG            = 0x00000004,
	CERT_CHAIN_POLICY_IGNORE_INVALID_BASIC_CONSTRAINTS_FLAG  = 0x00000008,
	CERT_CHAIN_POLICY_IGNORE_ALL_NOT_TIME_VALID_FLAGS        = CERT_CHAIN_POLICY_IGNORE_NOT_TIME_VALID_FLAG | CERT_CHAIN_POLICY_IGNORE_CTL_NOT_TIME_VALID_FLAG | CERT_CHAIN_POLICY_IGNORE_NOT_TIME_NESTED_FLAG,
	CERT_CHAIN_POLICY_ALLOW_UNKNOWN_CA_FLAG                  = 0x00000010,
	CERT_CHAIN_POLICY_IGNORE_WRONG_USAGE_FLAG                = 0x00000020,
	CERT_CHAIN_POLICY_IGNORE_INVALID_NAME_FLAG               = 0x00000040,
	CERT_CHAIN_POLICY_IGNORE_INVALID_POLICY_FLAG             = 0x00000080,
	CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG            = 0x00000100,
	CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG     = 0x00000200,
	CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG             = 0x00000400,
	CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG           = 0x00000800,
	CERT_CHAIN_POLICY_IGNORE_ALL_REV_UNKNOWN_FLAGS           = CERT_CHAIN_POLICY_IGNORE_END_REV_UNKNOWN_FLAG | CERT_CHAIN_POLICY_IGNORE_CTL_SIGNER_REV_UNKNOWN_FLAG | CERT_CHAIN_POLICY_IGNORE_CA_REV_UNKNOWN_FLAG | CERT_CHAIN_POLICY_IGNORE_ROOT_REV_UNKNOWN_FLAG,
	CERT_CHAIN_POLICY_ALLOW_TESTROOT_FLAG                    = 0x00008000,
	CERT_CHAIN_POLICY_TRUST_TESTROOT_FLAG                    = 0x00004000,
	CERT_CHAIN_POLICY_IGNORE_NOT_SUPPORTED_CRITICAL_EXT_FLAG = 0x00002000,
	CERT_CHAIN_POLICY_IGNORE_PEER_TRUST_FLAG                 = 0x00001000,
}

export extern(Windows) BOOL CertVerifyCertificateChainPolicy(LPCSTR pszPolicyOID, PCCERT_CHAIN_CONTEXT pChainContext, PCERT_CHAIN_POLICY_PARA pPolicyPara, PCERT_CHAIN_POLICY_STATUS pPolicyStatus);

const char* CRYPT_OID_VERIFY_CERTIFICATE_CHAIN_POLICY_FUNC = "CertDllVerifyCertificateChainPolicy";

const LPCSTR CERT_CHAIN_POLICY_BASE              = cast(LPCSTR)1;
const LPCSTR CERT_CHAIN_POLICY_AUTHENTICODE      = cast(LPCSTR)2;
const LPCSTR CERT_CHAIN_POLICY_AUTHENTICODE_TS   = cast(LPCSTR)3;
const LPCSTR CERT_CHAIN_POLICY_SSL               = cast(LPCSTR)4;
const LPCSTR CERT_CHAIN_POLICY_BASIC_CONSTRAINTS = cast(LPCSTR)5;
const LPCSTR CERT_CHAIN_POLICY_NT_AUTH           = cast(LPCSTR)6;
const LPCSTR CERT_CHAIN_POLICY_MICROSOFT_ROOT    = cast(LPCSTR)7;
const LPCSTR CERT_CHAIN_POLICY_EV                = cast(LPCSTR)8;

struct AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA {
	DWORD cbSize;
	DWORD dwRegPolicySettings;
	PCMSG_SIGNER_INFO pSignerInfo;
}
alias AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA* PAUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA;

struct AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS {
	DWORD cbSize;
	BOOL fCommercial;
}
alias AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS* PAUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_STATUS;

struct AUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA{
	DWORD cbSize;
	DWORD dwRegPolicySettings;
	BOOL fCommercial;
}
alias AUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA* PAUTHENTICODE_TS_EXTRA_CERT_CHAIN_POLICY_PARA;

enum {
	AUTHTYPE_CLIENT = 1,
	AUTHTYPE_SERVER = 2,
}
struct HTTPSPolicyCallbackData {
	union {
		DWORD cbStruct;
		DWORD cbSize;
	}
	DWORD dwAuthType;
	DWORD fdwChecks;
	WCHAR* pwszServerName;
}
alias HTTPSPolicyCallbackData* PHTTPSPolicyCallbackData;
alias HTTPSPolicyCallbackData SSL_EXTRA_CERT_CHAIN_POLICY_PARA;
alias SSL_EXTRA_CERT_CHAIN_POLICY_PARA* PSSL_EXTRA_CERT_CHAIN_POLICY_PARA;

enum {
	BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_CA_FLAG            = 0x80000000,
	BASIC_CONSTRAINTS_CERT_CHAIN_POLICY_END_ENTITY_FLAG    = 0x40000000,
	MICROSOFT_ROOT_CERT_CHAIN_POLICY_ENABLE_TEST_ROOT_FLAG = 0x00010000,
}

struct EV_EXTRA_CERT_CHAIN_POLICY_PARA{
	DWORD cbSize;
	DWORD dwRootProgramQualifierFlags;
}
alias EV_EXTRA_CERT_CHAIN_POLICY_PARA* PEV_EXTRA_CERT_CHAIN_POLICY_PARA;

struct EV_EXTRA_CERT_CHAIN_POLICY_STATUS {
	DWORD cbSize;
	DWORD dwQualifiers;
	DWORD dwIssuanceUsageIndex;
}
alias EV_EXTRA_CERT_CHAIN_POLICY_STATUS* PEV_EXTRA_CERT_CHAIN_POLICY_STATUS;

export extern(Windows) BOOL CryptStringToBinaryA(LPCSTR pszString, DWORD cchString, DWORD dwFlags, BYTE* pbBinary, DWORD* pcbBinary, DWORD* pdwSkip, DWORD* pdwFlags);
export extern(Windows) BOOL CryptStringToBinaryW(LPCWSTR pszString, DWORD cchString, DWORD dwFlags, BYTE* pbBinary, DWORD* pcbBinary, DWORD* pdwSkip, DWORD* pdwFlags);
version(UNICODE)
	alias CryptStringToBinaryW CryptStringToBinary;
else
	alias CryptStringToBinaryA CryptStringToBinary;

export extern(Windows) BOOL CryptBinaryToStringA(const(BYTE)* pbBinary, DWORD cbBinary, DWORD dwFlags, LPSTR pszString, DWORD* pcchString);
export extern(Windows) BOOL CryptBinaryToStringW(const(BYTE)* pbBinary, DWORD cbBinary, DWORD dwFlags, LPWSTR pszString, DWORD* pcchString);
version(UNICODE)
	alias CryptBinaryToStringW CryptBinaryToString;
else
	alias CryptBinaryToStringA CryptBinaryToString;

enum {
	CRYPT_STRING_BASE64HEADER        = 0x00000000,
	CRYPT_STRING_BASE64              = 0x00000001,
	CRYPT_STRING_BINARY              = 0x00000002,
	CRYPT_STRING_BASE64REQUESTHEADER = 0x00000003,
	CRYPT_STRING_HEX                 = 0x00000004,
	CRYPT_STRING_HEXASCII            = 0x00000005,
	CRYPT_STRING_BASE64_ANY          = 0x00000006,
	CRYPT_STRING_ANY                 = 0x00000007,
	CRYPT_STRING_HEX_ANY             = 0x00000008,
	CRYPT_STRING_BASE64X509CRLHEADER = 0x00000009,
	CRYPT_STRING_HEXADDR             = 0x0000000a,
	CRYPT_STRING_HEXASCIIADDR        = 0x0000000b,
	CRYPT_STRING_HEXRAW              = 0x0000000c,
	CRYPT_STRING_HASHDATA            = 0x10000000,
	CRYPT_STRING_STRICT              = 0x20000000,
	CRYPT_STRING_NOCRLF              = 0x40000000,
	CRYPT_STRING_NOCR                = 0x80000000,
}

const char* szOID_PKCS_12_PbeIds = "1.2.840.113549.1.12.1";
const char* szOID_PKCS_12_pbeWithSHA1And128BitRC4 = "1.2.840.113549.1.12.1.1";
const char* szOID_PKCS_12_pbeWithSHA1And40BitRC4 = "1.2.840.113549.1.12.1.2";
const char* szOID_PKCS_12_pbeWithSHA1And3KeyTripleDES = "1.2.840.113549.1.12.1.3";
const char* szOID_PKCS_12_pbeWithSHA1And2KeyTripleDES = "1.2.840.113549.1.12.1.4";
const char* szOID_PKCS_12_pbeWithSHA1And128BitRC2 = "1.2.840.113549.1.12.1.5";
const char* szOID_PKCS_12_pbeWithSHA1And40BitRC2 = "1.2.840.113549.1.12.1.6";

struct CRYPT_PKCS12_PBE_PARAMS {
	int iIterations;
	ULONG cbSalt;
}

export extern(Windows) HCERTSTORE PFXImportCertStore(CRYPT_DATA_BLOB* pPFX, LPCWSTR szPassword, DWORD dwFlags);

enum {
	CRYPT_USER_KEYSET           = 0x00001000,
	PKCS12_PREFER_CNG_KSP       = 0x00000100,
	PKCS12_ALWAYS_CNG_KSP       = 0x00000200,
	PKCS12_ALLOW_OVERWRITE_KEY  = 0x00004000,
	PKCS12_NO_PERSIST_KEY       = 0x00008000,
	PKCS12_IMPORT_RESERVED_MASK = 0xffff0000,
}

export extern(Windows) BOOL PFXIsPFXBlob(CRYPT_DATA_BLOB* pPFX);
export extern(Windows) BOOL PFXVerifyPassword(CRYPT_DATA_BLOB* pPFX, LPCWSTR szPassword, DWORD dwFlags);
export extern(Windows) BOOL PFXExportCertStoreEx(HCERTSTORE hStore, CRYPT_DATA_BLOB* pPFX, LPCWSTR szPassword, void* pvReserved, DWORD dwFlags);

enum {
	REPORT_NO_PRIVATE_KEY                 = 0x0001,
	REPORT_NOT_ABLE_TO_EXPORT_PRIVATE_KEY = 0x0002,
	EXPORT_PRIVATE_KEYS                   = 0x0004,
	PKCS12_INCLUDE_EXTENDED_PROPERTIES    = 0x0010,
	PKCS12_EXPORT_RESERVED_MASK           = 0xffff0000,
}

export extern(Windows) BOOL PFXExportCertStore(HCERTSTORE hStore, CRYPT_DATA_BLOB* pPFX,  LPCWSTR szPassword, DWORD dwFlags);

//(NTDDI_VERSION >= _WIN32_WINNT_VISTA)
	enum HCERT_SERVER_OCSP_RESPONSE : VOID* {init = (VOID*).init}
	struct CERT_SERVER_OCSP_RESPONSE_CONTEXT {
		DWORD cbSize;
		BYTE* pbEncodedOcspResponse;
		DWORD cbEncodedOcspResponse;
	}
	alias CERT_SERVER_OCSP_RESPONSE_CONTEXT* PCERT_SERVER_OCSP_RESPONSE_CONTEXT;
	alias const(CERT_SERVER_OCSP_RESPONSE_CONTEXT)* PCCERT_SERVER_OCSP_RESPONSE_CONTEXT;

static if(NTDDI_VERSION >= _WIN32_WINNT_VISTA){
	export extern(Windows) HCERT_SERVER_OCSP_RESPONSE CertOpenServerOcspResponse(PCCERT_CHAIN_CONTEXT pChainContext, DWORD dwFlags, LPVOID pvReserved);
	export extern(Windows) VOID CertAddRefServerOcspResponse(HCERT_SERVER_OCSP_RESPONSE hServerOcspResponse);
	export extern(Windows) VOID CertCloseServerOcspResponse(HCERT_SERVER_OCSP_RESPONSE hServerOcspResponse, DWORD dwFlags);
	export extern(Windows) PCCERT_SERVER_OCSP_RESPONSE_CONTEXT CertGetServerOcspResponseContext(HCERT_SERVER_OCSP_RESPONSE hServerOcspResponse,  DWORD dwFlags,LPVOID pvReserved);
	export extern(Windows) VOID CertAddRefServerOcspResponseContext(PCCERT_SERVER_OCSP_RESPONSE_CONTEXT pServerOcspResponseContext);
	export extern(Windows) VOID CertFreeServerOcspResponseContext(PCCERT_SERVER_OCSP_RESPONSE_CONTEXT pServerOcspResponseContext);
}

export extern(Windows) BOOL CertRetrieveLogoOrBiometricInfo(PCCERT_CONTEXT pCertContext, LPCSTR lpszLogoOrBiometricType, DWORD dwRetrievalFlags, DWORD dwTimeout, DWORD dwFlags, void* pvReserved, BYTE** ppbData, DWORD* pcbData, LPWSTR* ppwszMimeType);

const LPCSTR CERT_RETRIEVE_ISSUER_LOGO                    = cast(LPCSTR)1;
const LPCSTR CERT_RETRIEVE_SUBJECT_LOGO                   = cast(LPCSTR)2;
const LPCSTR CERT_RETRIEVE_COMMUNITY_LOGO                 = cast(LPCSTR)3;
const LPCSTR CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE = cast(LPCSTR)1000;
const LPCSTR CERT_RETRIEVE_BIOMETRIC_PICTURE_TYPE         = (CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE + CERT_BIOMETRIC_PICTURE_TYPE);
const LPCSTR CERT_RETRIEVE_BIOMETRIC_SIGNATURE_TYPE       = (CERT_RETRIEVE_BIOMETRIC_PREDEFINED_BASE_TYPE + CERT_BIOMETRIC_SIGNATURE_TYPE);


//(NTDDI_VERSION >= NTDDI_WIN7)
	struct CERT_SELECT_CHAIN_PARA {
		HCERTCHAINENGINE hChainEngine;
		PFILETIME pTime;
		HCERTSTORE hAdditionalStore;
		PCERT_CHAIN_PARA pChainPara;
		DWORD dwFlags;
	}
	alias CERT_SELECT_CHAIN_PARA* PCERT_SELECT_CHAIN_PARA;
	alias const(CERT_SELECT_CHAIN_PARA)* PCCERT_SELECT_CHAIN_PARA;

	enum CERT_SELECT_MAX_PARA = 500;

	struct CERT_SELECT_CRITERIA {
		DWORD dwType;
		DWORD cPara;
		void** ppPara;
	}
	alias CERT_SELECT_CRITERIA* PCERT_SELECT_CRITERIA;
	alias const(CERT_SELECT_CRITERIA)* PCCERT_SELECT_CRITERIA;

	enum {
		CERT_SELECT_BY_ENHKEY_USAGE          = 1,
		CERT_SELECT_BY_KEY_USAGE             = 2,
		CERT_SELECT_BY_POLICY_OID            = 3,
		CERT_SELECT_BY_PROV_NAME             = 4,
		CERT_SELECT_BY_EXTENSION             = 5,
		CERT_SELECT_BY_SUBJECT_HOST_NAME     = 6,
		CERT_SELECT_BY_ISSUER_ATTR           = 7,
		CERT_SELECT_BY_SUBJECT_ATTR          = 8,
		CERT_SELECT_BY_ISSUER_NAME           = 9,
		CERT_SELECT_BY_PUBLIC_KEY            = 10,
		CERT_SELECT_BY_TLS_SIGNATURES        = 11,
		CERT_SELECT_LAST                     = CERT_SELECT_BY_TLS_SIGNATURES,
		CERT_SELECT_MAX                      = CERT_SELECT_LAST * 3,
		CERT_SELECT_ALLOW_EXPIRED            = 0x00000001,
		CERT_SELECT_TRUSTED_ROOT             = 0x00000002,
		CERT_SELECT_DISALLOW_SELFSIGNED      = 0x00000004,
		CERT_SELECT_HAS_PRIVATE_KEY          = 0x00000008,
		CERT_SELECT_HAS_KEY_FOR_SIGNATURE    = 0x00000010,
		CERT_SELECT_HAS_KEY_FOR_KEY_EXCHANGE = 0x00000020,
		CERT_SELECT_HARDWARE_ONLY            = 0x00000040,
		CERT_SELECT_ALLOW_DUPLICATES         = 0x00000080,
	}

static if(NTDDI_VERSION >= NTDDI_WIN7){
	export extern(Windows) BOOL CertSelectCertificateChains(LPCGUID pSelectionContext, DWORD dwFlags, PCCERT_SELECT_CHAIN_PARA pChainParameters, DWORD cCriteria, PCCERT_SELECT_CRITERIA rgpCriteria, HCERTSTORE hStore, PDWORD pcSelection, PCCERT_CHAIN_CONTEXT** pprgpSelection);
	export extern(Windows) VOID CertFreeCertificateChainList(PCCERT_CHAIN_CONTEXT* prgpSelection);
}

//(NTDDI_VERSION >= NTDDI_WIN7){
	enum TIMESTAMP_VERSION = 1;

	struct CRYPT_TIMESTAMP_REQUEST {
		DWORD dwVersion;
		CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
		CRYPT_DER_BLOB HashedMessage;
		LPSTR pszTSAPolicyId;
		CRYPT_INTEGER_BLOB Nonce;
		BOOL fCertReq;
		DWORD cExtension;
		PCERT_EXTENSION rgExtension;
	}
	alias CRYPT_TIMESTAMP_REQUEST* PCRYPT_TIMESTAMP_REQUEST;

	struct CRYPT_TIMESTAMP_RESPONSE {
		DWORD dwStatus;
		DWORD cFreeText;
		LPWSTR* rgFreeText;
		CRYPT_BIT_BLOB FailureInfo;
		CRYPT_DER_BLOB ContentInfo;
	}
	alias CRYPT_TIMESTAMP_RESPONSE* PCRYPT_TIMESTAMP_RESPONSE;

	enum {
		TIMESTAMP_STATUS_GRANTED            = 0,
		TIMESTAMP_STATUS_GRANTED_WITH_MODS  = 1,
		TIMESTAMP_STATUS_REJECTED           = 2,
		TIMESTAMP_STATUS_WAITING            = 3,
		TIMESTAMP_STATUS_REVOCATION_WARNING = 4,
		TIMESTAMP_STATUS_REVOKED            = 5,
	}

	enum {
		TIMESTAMP_FAILURE_BAD_ALG                 = 0,
		TIMESTAMP_FAILURE_BAD_REQUEST             = 2,
		TIMESTAMP_FAILURE_BAD_FORMAT              = 5,
		TIMESTAMP_FAILURE_TIME_NOT_AVAILABLE      = 14,
		TIMESTAMP_FAILURE_POLICY_NOT_SUPPORTED    = 15,
		TIMESTAMP_FAILURE_EXTENSION_NOT_SUPPORTED = 16,
		TIMESTAMP_FAILURE_INFO_NOT_AVAILABLE      = 17,
		TIMESTAMP_FAILURE_SYSTEM_FAILURE          = 25,
	}

	struct CRYPT_TIMESTAMP_ACCURACY {
		DWORD dwSeconds;
		DWORD dwMillis;
		DWORD dwMicros;
	}
	alias CRYPT_TIMESTAMP_ACCURACY* PCRYPT_TIMESTAMP_ACCURACY;

	struct CRYPT_TIMESTAMP_INFO {
		DWORD dwVersion;
		LPSTR pszTSAPolicyId;
		CRYPT_ALGORITHM_IDENTIFIER HashAlgorithm;
		CRYPT_DER_BLOB HashedMessage;
		CRYPT_INTEGER_BLOB SerialNumber;
		FILETIME ftTime;
		PCRYPT_TIMESTAMP_ACCURACY pvAccuracy;
		BOOL fOrdering;
		CRYPT_DER_BLOB Nonce;
		CRYPT_DER_BLOB Tsa;
		DWORD cExtension;
		PCERT_EXTENSION rgExtension;
	}
	alias CRYPT_TIMESTAMP_INFO* PCRYPT_TIMESTAMP_INFO;

	struct CRYPT_TIMESTAMP_CONTEXT {
		DWORD cbEncoded;
		BYTE* pbEncoded;
		PCRYPT_TIMESTAMP_INFO pTimeStamp;
	}
	alias CRYPT_TIMESTAMP_CONTEXT* PCRYPT_TIMESTAMP_CONTEXT;

	struct CRYPT_TIMESTAMP_PARA {
		LPCSTR pszTSAPolicyId;
		BOOL fRequestCerts;
		CRYPT_INTEGER_BLOB Nonce;
		DWORD cExtension;
		PCERT_EXTENSION rgExtension;
	}
	alias CRYPT_TIMESTAMP_PARA* PCRYPT_TIMESTAMP_PARA;

	enum {
		TIMESTAMP_DONT_HASH_DATA           = 0x00000001,
		TIMESTAMP_VERIFY_CONTEXT_SIGNATURE = 0x00000020,
		TIMESTAMP_NO_AUTH_RETRIEVAL        = 0x00020000,
	}

static if(NTDDI_VERSION >= NTDDI_WIN7){
	export extern(Windows) BOOL CryptRetrieveTimeStamp(LPCWSTR wszUrl, DWORD dwRetrievalFlags, DWORD dwTimeout,  LPCSTR pszHashId, const(CRYPT_TIMESTAMP_PARA)* pPara, const(BYTE)* pbData, DWORD cbData, PCRYPT_TIMESTAMP_CONTEXT* ppTsContext, PCCERT_CONTEXT* ppTsSigner, HCERTSTORE* phStore);
	export extern(Windows) BOOL CryptVerifyTimeStampSignature (const(BYTE)* pbTSContentInfo, DWORD cbTSContentInfo, const(BYTE)* pbData, DWORD cbData, HCERTSTORE hAdditionalStore, PCRYPT_TIMESTAMP_CONTEXT* ppTsContext, PCCERT_CONTEXT* ppTsSigner, HCERTSTORE* phStore);
}

}// extern(C)

