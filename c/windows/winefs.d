/** winefs.d

Converted from 'winefs.h'.

Version: V7.1
Authors: Koji Kishita
*/
module c.windows.winefs;


import c.windows.windef;
import c.windows.winbase;
import c.windows.winnt;


extern(C){

enum WINEFS_SETUSERKEY_SET_CAPABILITIES = 0x00000001;

//(NTDDI_VERSION >= NTDDI_WINXP)
	alias uint ALG_ID;

struct EFS_CERTIFICATE_BLOB {
	DWORD dwCertEncodingType;
	DWORD cbData;
	PBYTE pbData;
}
alias EFS_CERTIFICATE_BLOB* PEFS_CERTIFICATE_BLOB;

struct EFS_HASH_BLOB {
	DWORD cbData;
	PBYTE pbData;
}
alias EFS_HASH_BLOB* PEFS_HASH_BLOB;

//(NTDDI_VERSION >= NTDDI_WINXP)
	struct EFS_RPC_BLOB {
		DWORD cbData;
		PBYTE pbData;
	}
	alias EFS_RPC_BLOB* PEFS_RPC_BLOB;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct EFS_PIN_BLOB {
		DWORD cbPadding;
		DWORD cbData;
		PBYTE pbData;
	}
	alias EFS_PIN_BLOB* PEFS_PIN_BLOB;

//(NTDDI_VERSION >= NTDDI_WINXP)
	struct EFS_KEY_INFO {
		DWORD dwVersion;
		ULONG Entropy;
		ALG_ID Algorithm;
		ULONG KeyLength;
	}
	alias EFS_KEY_INFO* PEFS_KEY_INFO;

//(NTDDI_VERSION >= NTDDI_WIN7)
	struct EFS_COMPATIBILITY_INFO {
		DWORD EfsVersion;
	}
	alias EFS_COMPATIBILITY_INFO* PEFS_COMPATIBILITY_INFO;

//(NTDDI_VERSION >= NTDDI_VISTA)
	struct EFS_DECRYPTION_STATUS_INFO {
		DWORD dwDecryptionError;
		DWORD dwHashOffset;
		DWORD cbHash;
	}
	alias EFS_DECRYPTION_STATUS_INFO* PEFS_DECRYPTION_STATUS_INFO;

	struct EFS_ENCRYPTION_STATUS_INFO {
		BOOL bHasCurrentKey;
		DWORD dwEncryptionError;
	}
	alias EFS_ENCRYPTION_STATUS_INFO* PEFS_ENCRYPTION_STATUS_INFO;

struct ENCRYPTION_CERTIFICATE {
	DWORD cbTotalLength;
	SID* pUserSid;
	PEFS_CERTIFICATE_BLOB pCertBlob;
}
alias ENCRYPTION_CERTIFICATE* PENCRYPTION_CERTIFICATE;

enum MAX_SID_SIZE = 256;

struct ENCRYPTION_CERTIFICATE_HASH {
	DWORD cbTotalLength;
	SID* pUserSid;
	PEFS_HASH_BLOB pHash;
	LPWSTR lpDisplayInformation;
}
alias ENCRYPTION_CERTIFICATE_HASH* PENCRYPTION_CERTIFICATE_HASH;

struct ENCRYPTION_CERTIFICATE_HASH_LIST {
	DWORD nCert_Hash;
	PENCRYPTION_CERTIFICATE_HASH* pUsers;
}
alias ENCRYPTION_CERTIFICATE_HASH_LIST* PENCRYPTION_CERTIFICATE_HASH_LIST;

struct ENCRYPTION_CERTIFICATE_LIST {
	DWORD nUsers;
	PENCRYPTION_CERTIFICATE* pUsers;
}
alias ENCRYPTION_CERTIFICATE_LIST* PENCRYPTION_CERTIFICATE_LIST;

//(NTDDI_VERSION >= NTDDI_VISTA)
	enum {
		EFS_METADATA_ADD_USER     = 0x00000001,
		EFS_METADATA_REMOVE_USER  = 0x00000002,
		EFS_METADATA_REPLACE_USER = 0x00000004,
		EFS_METADATA_GENERAL_OP   = 0x00000008,
	}

	struct ENCRYPTED_FILE_METADATA_SIGNATURE {
		DWORD dwEfsAccessType;
		PENCRYPTION_CERTIFICATE_HASH_LIST pCertificatesAdded;
		PENCRYPTION_CERTIFICATE pEncryptionCertificate;
		PEFS_RPC_BLOB pEfsStreamSignature;
	}
	alias ENCRYPTED_FILE_METADATA_SIGNATURE* PENCRYPTED_FILE_METADATA_SIGNATURE;

export extern(Windows){
	DWORD QueryUsersOnEncryptedFile(LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST* pUsers);
	DWORD QueryRecoveryAgentsOnEncryptedFile(LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST* pRecoveryAgents);
	DWORD RemoveUsersFromEncryptedFile(LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_HASH_LIST pHashes);
	DWORD AddUsersToEncryptedFile(LPCWSTR lpFileName, PENCRYPTION_CERTIFICATE_LIST pEncryptionCertificates);
	DWORD SetUserFileEncryptionKey(PENCRYPTION_CERTIFICATE pEncryptionCertificate);
	//(NTDDI_VERSION >= NTDDI_VISTA)
		DWORD SetUserFileEncryptionKeyEx(PENCRYPTION_CERTIFICATE pEncryptionCertificate, DWORD dwCapabilities, DWORD dwFlags, LPVOID pvReserved);
	VOID FreeEncryptionCertificateHashList(PENCRYPTION_CERTIFICATE_HASH_LIST pUsers);
	BOOL EncryptionDisable(LPCWSTR DirPath, BOOL Disable);
	DWORD DuplicateEncryptionInfoFile(LPCWSTR SrcFileName, LPCWSTR DstFileName, DWORD dwCreationDistribution, DWORD dwAttributes, const(SECURITY_ATTRIBUTES)* lpSecurityAttributes);
	//(NTDDI_VERSION >= NTDDI_VISTA)
		deprecated DWORD GetEncryptedFileMetadata(LPCWSTR lpFileName, PDWORD pcbMetadata, PBYTE* ppbMetadata);
		deprecated DWORD SetEncryptedFileMetadata(LPCWSTR lpFileName, PBYTE pbOldMetadata, PBYTE pbNewMetadata, PENCRYPTION_CERTIFICATE_HASH pOwnerHash, DWORD dwOperation, PENCRYPTION_CERTIFICATE_HASH_LIST pCertificatesAdded);
		deprecated VOID FreeEncryptedFileMetadata(PBYTE pbMetadata);
}

}// extern(C)
