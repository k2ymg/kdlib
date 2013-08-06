/** schannel.d

Converted from 'schannel.h'.

Version: V7.0
Authors: Koji Kishita
*/
module c.windows.schannel;


import c.windows.windef;
import c.windows.wincrypt;
import c.windows.guiddef;


const char* UNISP_NAME_A = "Microsoft Unified Security Protocol Provider";
const char* UNISP_NAME_W = "Microsoft Unified Security Protocol Provider";
const char* SSL2SP_NAME_A = "Microsoft SSL 2.0";
const char* SSL2SP_NAME_W = "Microsoft SSL 2.0";
const char* SSL3SP_NAME_A = "Microsoft SSL 3.0";
const char* SSL3SP_NAME_W = "Microsoft SSL 3.0";
const char* TLS1SP_NAME_A = "Microsoft TLS 1.0";
const char* TLS1SP_NAME_W = "Microsoft TLS 1.0";
const char* PCT1SP_NAME_A = "Microsoft PCT 1.0";
const char* PCT1SP_NAME_W = "Microsoft PCT 1.0";
const char* SCHANNEL_NAME_A = "Schannel";
const char* SCHANNEL_NAME_W = "Schannel";
version(UNICODE){
	alias UNISP_NAME_W UNISP_NAME;
	alias PCT1SP_NAME_W PCT1SP_NAME;
	alias SSL2SP_NAME_W SSL2SP_NAME;
	alias SSL3SP_NAME_W SSL3SP_NAME;
	alias TLS1SP_NAME_W TLS1SP_NAME;
	alias SCHANNEL_NAME_W SCHANNEL_NAME;
}else{
	alias UNISP_NAME_A UNISP_NAME;
	alias PCT1SP_NAME_A PCT1SP_NAME;
	alias SSL2SP_NAME_A SSL2SP_NAME;
	alias SSL3SP_NAME_A SSL3SP_NAME;
	alias TLS1SP_NAME_A TLS1SP_NAME;
	alias SCHANNEL_NAME_A SCHANNEL_NAME;
}

enum eTlsSignatureAlgorithm {
	TlsSignatureAlgorithm_Anonymous = 0,
	TlsSignatureAlgorithm_Rsa = 1,
	TlsSignatureAlgorithm_Dsa = 2,
	TlsSignatureAlgorithm_Ecdsa = 3
}

enum eTlsHashAlgorithm {
	TlsHashAlgorithm_None = 0,
	TlsHashAlgorithm_Md5 = 1,
	TlsHashAlgorithm_Sha1 = 2,
	TlsHashAlgorithm_Sha224 = 3,
	TlsHashAlgorithm_Sha256 = 4,
	TlsHashAlgorithm_Sha384 = 5,
	TlsHashAlgorithm_Sha512 = 6
}

enum UNISP_RPC_ID = 14;

enum {
	SECPKG_ATTR_ISSUER_LIST          = 0x50,
	SECPKG_ATTR_REMOTE_CRED          = 0x51,
	SECPKG_ATTR_LOCAL_CRED           = 0x52,
	SECPKG_ATTR_REMOTE_CERT_CONTEXT  = 0x53,
	SECPKG_ATTR_LOCAL_CERT_CONTEXT   = 0x54,
	SECPKG_ATTR_ROOT_STORE           = 0x55,
	SECPKG_ATTR_SUPPORTED_ALGS       = 0x56,
	SECPKG_ATTR_CIPHER_STRENGTHS     = 0x57,
	SECPKG_ATTR_SUPPORTED_PROTOCOLS  = 0x58,
	SECPKG_ATTR_ISSUER_LIST_EX       = 0x59,
	SECPKG_ATTR_CONNECTION_INFO      = 0x5a,
	SECPKG_ATTR_EAP_KEY_BLOCK        = 0x5b,
	SECPKG_ATTR_MAPPED_CRED_ATTR     = 0x5c,
	SECPKG_ATTR_SESSION_INFO         = 0x5d,
	SECPKG_ATTR_APP_DATA             = 0x5e,
	SECPKG_ATTR_REMOTE_CERTIFICATES  = 0x5F,
	SECPKG_ATTR_CLIENT_CERT_POLICY   = 0x60,
	SECPKG_ATTR_CC_POLICY_RESULT     = 0x61,
	SECPKG_ATTR_USE_NCRYPT           = 0x62,
	SECPKG_ATTR_LOCAL_CERT_INFO      = 0x63,
	SECPKG_ATTR_CIPHER_INFO          = 0x64,
	SECPKG_ATTR_EAP_PRF_INFO         = 0x65,
	SECPKG_ATTR_SUPPORTED_SIGNATURES = 0x66,
}

struct SecPkgContext_RemoteCredentialInfo {
	DWORD cbCertificateChain;
	PBYTE pbCertificateChain;
	DWORD cCertificates;
	DWORD fFlags;
	DWORD dwBits;
}
alias SecPkgContext_RemoteCredentialInfo* PSecPkgContext_RemoteCredentialInfo;
alias SecPkgContext_RemoteCredentialInfo SecPkgContext_RemoteCredenitalInfo;
alias SecPkgContext_RemoteCredenitalInfo* PSecPkgContext_RemoteCredenitalInfo;

enum {
	RCRED_STATUS_NOCRED         = 0x00000000,
	RCRED_CRED_EXISTS           = 0x00000001,
	RCRED_STATUS_UNKNOWN_ISSUER = 0x00000002,
}

struct SecPkgContext_LocalCredentialInfo {
	DWORD cbCertificateChain;
	PBYTE pbCertificateChain;
	DWORD cCertificates;
	DWORD fFlags;
	DWORD dwBits;
}
alias SecPkgContext_LocalCredentialInfo* PSecPkgContext_LocalCredentialInfo;

alias SecPkgContext_LocalCredentialInfo SecPkgContext_LocalCredenitalInfo;
alias SecPkgContext_LocalCredenitalInfo* PSecPkgContext_LocalCredenitalInfo;

enum {
	LCRED_STATUS_NOCRED         = 0x00000000,
	LCRED_CRED_EXISTS           = 0x00000001,
	LCRED_STATUS_UNKNOWN_ISSUER = 0x00000002,
}

struct SecPkgCred_SupportedAlgs {
	DWORD cSupportedAlgs;
	ALG_ID* palgSupportedAlgs;
}
alias SecPkgCred_SupportedAlgs* PSecPkgCred_SupportedAlgs;

struct SecPkgCred_CipherStrengths {
	DWORD dwMinimumCipherStrength;
	DWORD dwMaximumCipherStrength;
}
alias SecPkgCred_CipherStrengths* PSecPkgCred_CipherStrengths;

struct SecPkgCred_SupportedProtocols {
	DWORD grbitProtocol;
}
alias SecPkgCred_SupportedProtocols* PSecPkgCred_SupportedProtocols;

struct SecPkgCred_ClientCertPolicy {
	DWORD dwFlags;
	GUID guidPolicyId;
	DWORD dwCertFlags;
	DWORD dwUrlRetrievalTimeout;
	BOOL fCheckRevocationFreshnessTime;
	DWORD dwRevocationFreshnessTime;
	BOOL fOmitUsageCheck;
	LPWSTR pwszSslCtlStoreName;
	LPWSTR pwszSslCtlIdentifier;
}
alias SecPkgCred_ClientCertPolicy* PSecPkgCred_ClientCertPolicy;

struct SecPkgContext_ClientCertPolicyResult {
	HRESULT dwPolicyResult;
	GUID guidPolicyId;
}
alias SecPkgContext_ClientCertPolicyResult* PSecPkgContext_ClientCertPolicyResult;

struct SecPkgContext_IssuerListInfoEx {
	PCERT_NAME_BLOB  aIssuers;
	DWORD cIssuers;
}
alias SecPkgContext_IssuerListInfoEx* PSecPkgContext_IssuerListInfoEx;

struct SecPkgContext_ConnectionInfo {
	DWORD dwProtocol;
	ALG_ID aiCipher;
	DWORD dwCipherStrength;
	ALG_ID aiHash;
	DWORD dwHashStrength;
	ALG_ID aiExch;
	DWORD dwExchStrength;
}
alias SecPkgContext_ConnectionInfo* PSecPkgContext_ConnectionInfo;

enum {
	SZ_ALG_MAX_SIZE             = 64,
	SECPKGCONTEXT_CIPHERINFO_V1 = 1,
}

struct SecPkgContext_CipherInfo {
	DWORD dwVersion;
	DWORD dwProtocol;
	DWORD dwCipherSuite;
	DWORD dwBaseCipherSuite;
	WCHAR[SZ_ALG_MAX_SIZE] szCipherSuite;
	WCHAR[SZ_ALG_MAX_SIZE] szCipher;
	DWORD dwCipherLen;
	DWORD dwCipherBlockLen;
	WCHAR[SZ_ALG_MAX_SIZE] szHash;
	DWORD dwHashLen;
	WCHAR[SZ_ALG_MAX_SIZE] szExchange;
	DWORD dwMinExchangeLen;
	DWORD dwMaxExchangeLen;
	WCHAR[SZ_ALG_MAX_SIZE] szCertificate;
	DWORD dwKeyType;
}
alias SecPkgContext_CipherInfo* PSecPkgContext_CipherInfo;

struct SecPkgContext_EapKeyBlock {
	BYTE[128] rgbKeys;
	BYTE[64] rgbIVs;
}
alias SecPkgContext_EapKeyBlock* PSecPkgContext_EapKeyBlock;

struct SecPkgContext_MappedCredAttr {
	DWORD dwAttribute;
	PVOID pvBuffer;
}
alias SecPkgContext_MappedCredAttr* PSecPkgContext_MappedCredAttr;

enum SSL_SESSION_RECONNECT = 1;

struct SecPkgContext_SessionInfo {
	DWORD dwFlags;
	DWORD cbSessionId;
	BYTE[32] rgbSessionId;
}
alias SecPkgContext_SessionInfo* PSecPkgContext_SessionInfo;

struct SecPkgContext_SessionAppData {
	DWORD dwFlags;
	DWORD cbAppData;
	PBYTE pbAppData;
}
alias SecPkgContext_SessionAppData* PSecPkgContext_SessionAppData;

struct SecPkgContext_EapPrfInfo {
	DWORD dwVersion;
	DWORD cbPrfData;
	PBYTE pbPrfData;
}
alias SecPkgContext_EapPrfInfo* PSecPkgContext_EapPrfInfo;

struct SecPkgContext_SupportedSignatures {
	WORD cSignatureAndHashAlgorithms;
	WORD* pSignatureAndHashAlgorithms;
}
alias SecPkgContext_SupportedSignatures* PSecPkgContext_SupportedSignatures;

struct SecPkgContext_Certificates {
	DWORD cCertificates;
	DWORD cbCertificateChain;
	PBYTE pbCertificateChain;
}
alias SecPkgContext_Certificates* PSecPkgContext_Certificates;

struct SecPkgContext_CertInfo {
	DWORD dwVersion;
	DWORD cbSubjectName;
	LPWSTR pwszSubjectName;
	DWORD cbIssuerName;
	LPWSTR pwszIssuerName;
	DWORD dwKeySize;
}
alias SecPkgContext_CertInfo* PSecPkgContext_CertInfo;

enum KERN_CONTEXT_CERT_INFO_V1 = 0x00000000;

enum {
	SCH_CRED_V1           = 0x00000001,
	SCH_CRED_V2           = 0x00000002,
	SCH_CRED_VERSION      = 0x00000002,
	SCH_CRED_V3           = 0x00000003,
	SCHANNEL_CRED_VERSION = 0x00000004,
}

struct _HMAPPER {}

struct SCHANNEL_CRED {
	DWORD dwVersion;
	DWORD cCreds;
	PCCERT_CONTEXT* paCred;
	HCERTSTORE hRootStore;
	DWORD cMappers;
	_HMAPPER** aphMappers;
	DWORD cSupportedAlgs;
	ALG_ID* palgSupportedAlgs;
	DWORD grbitEnabledProtocols;
	DWORD dwMinimumCipherStrength;
	DWORD dwMaximumCipherStrength;
	DWORD dwSessionLifespan;
	DWORD dwFlags;
	DWORD dwCredFormat;
}
alias SCHANNEL_CRED* PSCHANNEL_CRED;

enum {
	SCH_CRED_FORMAT_CERT_CONTEXT    = 0x00000000,
	SCH_CRED_FORMAT_CERT_HASH       = 0x00000001,
	SCH_CRED_FORMAT_CERT_HASH_STORE = 0x00000002,
	SCH_CRED_MAX_STORE_NAME_SIZE    = 128,
	SCH_CRED_MAX_SUPPORTED_ALGS     = 256,
	SCH_CRED_MAX_SUPPORTED_CERTS    = 100,
}

struct SCHANNEL_CERT_HASH {
	DWORD dwLength;
	DWORD dwFlags;
	HCRYPTPROV hProv;
	BYTE[20] ShaHash;
}
alias SCHANNEL_CERT_HASH* PSCHANNEL_CERT_HASH;

struct SCHANNEL_CERT_HASH_STORE {
	DWORD dwLength;
	DWORD dwFlags;
	HCRYPTPROV hProv;
	BYTE[20] ShaHash;
	WCHAR[SCH_CRED_MAX_STORE_NAME_SIZE] pwszStoreName;
}
alias SCHANNEL_CERT_HASH_STORE* PSCHANNEL_CERT_HASH_STORE;

enum {
	SCH_MACHINE_CERT_HASH                        = 0x00000001,
	SCH_CRED_NO_SYSTEM_MAPPER                    = 0x00000002,
	SCH_CRED_NO_SERVERNAME_CHECK                 = 0x00000004,
	SCH_CRED_MANUAL_CRED_VALIDATION              = 0x00000008,
	SCH_CRED_NO_DEFAULT_CREDS                    = 0x00000010,
	SCH_CRED_AUTO_CRED_VALIDATION                = 0x00000020,
	SCH_CRED_USE_DEFAULT_CREDS                   = 0x00000040,
	SCH_CRED_DISABLE_RECONNECTS                  = 0x00000080,
	SCH_CRED_REVOCATION_CHECK_END_CERT           = 0x00000100,
	SCH_CRED_REVOCATION_CHECK_CHAIN              = 0x00000200,
	SCH_CRED_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT = 0x00000400,
	SCH_CRED_IGNORE_NO_REVOCATION_CHECK          = 0x00000800,
	SCH_CRED_IGNORE_REVOCATION_OFFLINE           = 0x00001000,
	SCH_CRED_RESTRICTED_ROOTS                    = 0x00002000,
	SCH_CRED_REVOCATION_CHECK_CACHE_ONLY         = 0x00004000,
	SCH_CRED_CACHE_ONLY_URL_RETRIEVAL            = 0x00008000,
	SCH_CRED_MEMORY_STORE_CERT                   = 0x00010000,
	SCH_CRED_CACHE_ONLY_URL_RETRIEVAL_ON_CREATE  = 0x00020000,
	SCH_SEND_ROOT_CERT                           = 0x00040000,
}

enum {
	SCHANNEL_RENEGOTIATE = 0,
	SCHANNEL_SHUTDOWN    = 1,
	SCHANNEL_ALERT       = 2,
	SCHANNEL_SESSION     = 3,
}

struct SCHANNEL_ALERT_TOKEN {
	DWORD dwTokenType;
	DWORD dwAlertType;
	DWORD dwAlertNumber;
}

enum {
	TLS1_ALERT_WARNING             = 1,
	TLS1_ALERT_FATAL               = 2,
	TLS1_ALERT_CLOSE_NOTIFY        = 0,
	TLS1_ALERT_UNEXPECTED_MESSAGE  = 10,
	TLS1_ALERT_BAD_RECORD_MAC      = 20,
	TLS1_ALERT_DECRYPTION_FAILED   = 21,
	TLS1_ALERT_RECORD_OVERFLOW     = 22,
	TLS1_ALERT_DECOMPRESSION_FAIL  = 30,
	TLS1_ALERT_HANDSHAKE_FAILURE   = 40,
	TLS1_ALERT_BAD_CERTIFICATE     = 42,
	TLS1_ALERT_UNSUPPORTED_CERT    = 43,
	TLS1_ALERT_CERTIFICATE_REVOKED = 44,
	TLS1_ALERT_CERTIFICATE_EXPIRED = 45,
	TLS1_ALERT_CERTIFICATE_UNKNOWN = 46,
	TLS1_ALERT_ILLEGAL_PARAMETER   = 47,
	TLS1_ALERT_UNKNOWN_CA          = 48,
	TLS1_ALERT_ACCESS_DENIED       = 49,
	TLS1_ALERT_DECODE_ERROR        = 50,
	TLS1_ALERT_DECRYPT_ERROR       = 51,
	TLS1_ALERT_EXPORT_RESTRICTION  = 60,
	TLS1_ALERT_PROTOCOL_VERSION    = 70,
	TLS1_ALERT_INSUFFIENT_SECURITY = 71,
	TLS1_ALERT_INTERNAL_ERROR      = 80,
	TLS1_ALERT_USER_CANCELED       = 90,
	TLS1_ALERT_NO_RENEGOTIATION    = 100,
	TLS1_ALERT_UNSUPPORTED_EXT     = 110,
}

enum {
	SSL_SESSION_ENABLE_RECONNECTS  = 1,
	SSL_SESSION_DISABLE_RECONNECTS = 2,
}

struct SCHANNEL_SESSION_TOKEN {
	DWORD dwTokenType;
	DWORD dwFlags;
}

struct SCHANNEL_CLIENT_SIGNATURE {
	DWORD cbLength;
	ALG_ID aiHash;
	DWORD cbHash;
	BYTE[36] HashValue;
	BYTE[20] CertThumbprint;
}
alias SCHANNEL_CLIENT_SIGNATURE* PSCHANNEL_CLIENT_SIGNATURE;

enum {
	SP_PROT_PCT1_SERVER        = 0x00000001,
	SP_PROT_PCT1_CLIENT        = 0x00000002,
	SP_PROT_PCT1               = SP_PROT_PCT1_SERVER | SP_PROT_PCT1_CLIENT,
	SP_PROT_SSL2_SERVER        = 0x00000004,
	SP_PROT_SSL2_CLIENT        = 0x00000008,
	SP_PROT_SSL2               = SP_PROT_SSL2_SERVER | SP_PROT_SSL2_CLIENT,
	SP_PROT_SSL3_SERVER        = 0x00000010,
	SP_PROT_SSL3_CLIENT        = 0x00000020,
	SP_PROT_SSL3               = SP_PROT_SSL3_SERVER | SP_PROT_SSL3_CLIENT,
	SP_PROT_TLS1_SERVER        = 0x00000040,
	SP_PROT_TLS1_CLIENT        = 0x00000080,
	SP_PROT_TLS1               = SP_PROT_TLS1_SERVER | SP_PROT_TLS1_CLIENT,
	SP_PROT_SSL3TLS1_CLIENTS   = SP_PROT_TLS1_CLIENT | SP_PROT_SSL3_CLIENT,
	SP_PROT_SSL3TLS1_SERVERS   = SP_PROT_TLS1_SERVER | SP_PROT_SSL3_SERVER,
	SP_PROT_SSL3TLS1           = SP_PROT_SSL3 | SP_PROT_TLS1,
	SP_PROT_UNI_SERVER         = 0x40000000,
	SP_PROT_UNI_CLIENT         = 0x80000000,
	SP_PROT_UNI                = SP_PROT_UNI_SERVER | SP_PROT_UNI_CLIENT,
	SP_PROT_ALL                = 0xffffffff,
	SP_PROT_NONE               = 0,
	SP_PROT_CLIENTS            = SP_PROT_PCT1_CLIENT | SP_PROT_SSL2_CLIENT | SP_PROT_SSL3_CLIENT | SP_PROT_UNI_CLIENT | SP_PROT_TLS1_CLIENT,
	SP_PROT_SERVERS            = SP_PROT_PCT1_SERVER | SP_PROT_SSL2_SERVER | SP_PROT_SSL3_SERVER | SP_PROT_UNI_SERVER | SP_PROT_TLS1_SERVER,
	SP_PROT_TLS1_0_SERVER      = SP_PROT_TLS1_SERVER,
	SP_PROT_TLS1_0_CLIENT      = SP_PROT_TLS1_CLIENT,
	SP_PROT_TLS1_0             = SP_PROT_TLS1_0_SERVER | SP_PROT_TLS1_0_CLIENT,
	SP_PROT_TLS1_1_SERVER      = 0x00000100,
	SP_PROT_TLS1_1_CLIENT      = 0x00000200,
	SP_PROT_TLS1_1             = SP_PROT_TLS1_1_SERVER | SP_PROT_TLS1_1_CLIENT,
	SP_PROT_TLS1_2_SERVER      = 0x00000400,
	SP_PROT_TLS1_2_CLIENT      = 0x00000800,
	SP_PROT_TLS1_2             = SP_PROT_TLS1_2_SERVER | SP_PROT_TLS1_2_CLIENT,
	SP_PROT_TLS1_1PLUS_SERVER  = SP_PROT_TLS1_1_SERVER | SP_PROT_TLS1_2_SERVER,
	SP_PROT_TLS1_1PLUS_CLIENT  = SP_PROT_TLS1_1_CLIENT | SP_PROT_TLS1_2_CLIENT,
	SP_PROT_TLS1_1PLUS         = SP_PROT_TLS1_1PLUS_SERVER | SP_PROT_TLS1_1PLUS_CLIENT,
	SP_PROT_TLS1_X_SERVER      = SP_PROT_TLS1_0_SERVER | SP_PROT_TLS1_1_SERVER | SP_PROT_TLS1_2_SERVER,
	SP_PROT_TLS1_X_CLIENT      = SP_PROT_TLS1_0_CLIENT | SP_PROT_TLS1_1_CLIENT | SP_PROT_TLS1_2_CLIENT,
	SP_PROT_TLS1_X             = SP_PROT_TLS1_X_SERVER | SP_PROT_TLS1_X_CLIENT,
	SP_PROT_SSL3TLS1_X_CLIENTS = SP_PROT_TLS1_X_CLIENT | SP_PROT_SSL3_CLIENT,
	SP_PROT_SSL3TLS1_X_SERVERS = SP_PROT_TLS1_X_SERVER | SP_PROT_SSL3_SERVER,
	SP_PROT_SSL3TLS1_X         = SP_PROT_SSL3 | SP_PROT_TLS1_X,
	SP_PROT_X_CLIENTS          = SP_PROT_CLIENTS | SP_PROT_TLS1_X_CLIENT,
	SP_PROT_X_SERVERS          = SP_PROT_SERVERS | SP_PROT_TLS1_X_SERVER,
}

alias extern(Windows) BOOL function(LPSTR pszTargetName, DWORD dwFlags) SSL_EMPTY_CACHE_FN_A;
export extern(Windows) BOOL SslEmptyCacheA(LPSTR pszTargetName, DWORD dwFlags);
alias extern(Windows) BOOL function(LPWSTR pszTargetName, DWORD dwFlags) SSL_EMPTY_CACHE_FN_W;
export extern(Windows) BOOL SslEmptyCacheW(LPWSTR pszTargetName, DWORD dwFlags);
version(UNICODE){
	alias SSL_EMPTY_CACHE_FN_W SSL_EMPTY_CACHE_FN;
	alias SslEmptyCacheW SslEmptyCache;
}else{
	alias SSL_EMPTY_CACHE_FN_A SSL_EMPTY_CACHE_FN;
	alias SslEmptyCacheA SslEmptyCache;
}

struct SSL_CREDENTIAL_CERTIFICATE {
	DWORD cbPrivateKey;
	PBYTE pPrivateKey;
	DWORD cbCertificate;
	PBYTE pCertificate;
	PSTR pszPassword;
}
alias SSL_CREDENTIAL_CERTIFICATE* PSSL_CREDENTIAL_CERTIFICATE;

enum {
	SCHANNEL_SECRET_TYPE_CAPI = 0x00000001,
	SCHANNEL_SECRET_PRIVKEY   = 0x00000002,
	SCH_CRED_X509_CERTCHAIN   = 0x00000001,
	SCH_CRED_X509_CAPI        = 0x00000002,
	SCH_CRED_CERT_CONTEXT     = 0x00000003,
}

struct SCH_CRED {
	DWORD dwVersion;
	DWORD cCreds;
	PVOID* paSecret;
	PVOID* paPublic;
	DWORD cMappers;
	_HMAPPER** aphMappers;
}
alias SCH_CRED* PSCH_CRED;

struct SCH_CRED_SECRET_CAPI {
	DWORD dwType;
	HCRYPTPROV hProv;
}
alias SCH_CRED_SECRET_CAPI* PSCH_CRED_SECRET_CAPI;

struct SCH_CRED_SECRET_PRIVKEY {
	DWORD dwType;
	PBYTE pPrivateKey;
	DWORD cbPrivateKey;
	PSTR pszPassword;
}
alias SCH_CRED_SECRET_PRIVKEY* PSCH_CRED_SECRET_PRIVKEY;

struct SCH_CRED_PUBLIC_CERTCHAIN {
	DWORD dwType;
	DWORD cbCertChain;
	PBYTE pCertChain;
}
alias SCH_CRED_PUBLIC_CERTCHAIN* PSCH_CRED_PUBLIC_CERTCHAIN;

struct PctPublicKey {
	DWORD Type;
	DWORD cbKey;
	UCHAR[1] pKey;
}

struct X509Certificate {
	DWORD Version;
	DWORD[4] SerialNumber;
	ALG_ID SignatureAlgorithm;
	FILETIME ValidFrom;
	FILETIME ValidUntil;
	PSTR pszIssuer;
	PSTR pszSubject;
	PctPublicKey* pPublicKey;
}
alias X509Certificate* PX509Certificate;

export extern(Windows){
	BOOL SslGenerateKeyPair(PSSL_CREDENTIAL_CERTIFICATE pCerts, PSTR pszDN, PSTR pszPassword, DWORD Bits);
	VOID SslGenerateRandomBits(PUCHAR pRandomData, LONG cRandomData);
	BOOL SslCrackCertificate(PUCHAR pbCertificate, DWORD cbCertificate, DWORD dwFlags, PX509Certificate*ppCertificate);
	VOID SslFreeCertificate(PX509Certificate pCertificate);
	DWORD SslGetMaximumKeySize(DWORD Reserved);
	BOOL SslGetDefaultIssuers(PBYTE pbIssuers, DWORD* pcbIssuers);
}

const TCHAR* SSL_CRACK_CERTIFICATE_NAME = "SslCrackCertificate";
const TCHAR* SSL_FREE_CERTIFICATE_NAME = "SslFreeCertificate";

alias extern(Windows)	BOOL function(PUCHAR pbCertificate, DWORD cbCertificate, BOOL VerifySignature, PX509Certificate* ppCertificate) SSL_CRACK_CERTIFICATE_FN;
alias extern(Windows) VOID function(PX509Certificate pCertificate) SSL_FREE_CERTIFICATE_FN;
