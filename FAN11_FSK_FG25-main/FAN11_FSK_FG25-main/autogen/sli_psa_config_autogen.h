// This is an autogenerated config file, any changes to this file will be overwritten

#ifndef SLI_PSA_CONFIG_AUTOGEN_H
#define SLI_PSA_CONFIG_AUTOGEN_H

#define PSA_WANT_KEY_TYPE_AES 1
#define PSA_WANT_ALG_CCM 1
#define PSA_WANT_ALG_CBC_NO_PADDING 1
#define PSA_WANT_ALG_SHA_1 1
#define PSA_WANT_ALG_SHA_224 1
#define PSA_WANT_ALG_SHA_256 1
#define PSA_WANT_ALG_ECB_NO_PADDING 1
#define PSA_WANT_ALG_ECDSA 1
#define PSA_WANT_ALG_ECDH 1
#define PSA_WANT_KEY_TYPE_ECC_KEY_PAIR 1
#define PSA_WANT_KEY_TYPE_ECC_PUBLIC_KEY 1
#define PSA_WANT_ECC_SECP_R1_256 1
#define PSA_WANT_KEY_TYPE_ECC_KEY_PAIR_BASIC 1
#define PSA_WANT_KEY_TYPE_ECC_KEY_PAIR_IMPORT 1
#define PSA_WANT_KEY_TYPE_ECC_KEY_PAIR_EXPORT 1
#define PSA_WANT_KEY_TYPE_ECC_KEY_PAIR_GENERATE 1
#define PSA_WANT_ALG_HMAC 1
#define PSA_WANT_KEY_TYPE_HMAC 1
#define PSA_WANT_ALG_TLS12_PRF 1
#define MBEDTLS_PSA_CRYPTO_EXTERNAL_RNG

#define MBEDTLS_PSA_KEY_SLOT_COUNT (1 + 9 + SL_PSA_KEY_USER_SLOT_COUNT)
#ifndef SL_PSA_ITS_MAX_FILES
#define SL_PSA_ITS_MAX_FILES (1 + 9 + SL_PSA_ITS_USER_MAX_FILES)
#endif

#endif // SLI_PSA_CONFIG_AUTOGEN_H
