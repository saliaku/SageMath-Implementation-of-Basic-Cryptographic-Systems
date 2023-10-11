#QUESTION 6 VIGENERE CIPHER

alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

#encryption function 
def encrypt(plaintext, key):
    ciphertext = ''
    key_length = len(key)
    for i in range(len(plaintext)):
        if plaintext[i] in alphabet:
            # Find the corresponding character in the key
            key_char = key[i % key_length]
            key_index = alphabet.index(key_char)
            
            # Encrypt the character using the VIGENERE cipher formula
            char_index = alphabet.index(plaintext[i])
            encrypted_char_index = (char_index + key_index) % 52
            encrypted_char = alphabet[encrypted_char_index]
            
            ciphertext += encrypted_char
        else:
            # If the character is not in the alphabet, leave it unchanged
            ciphertext += plaintext[i]
    return ciphertext

#decryption function 
def decrypt(ciphertext, key):
    plaintext = ''
    key_length = len(key)
    for i in range(len(ciphertext)):
        if ciphertext[i] in alphabet:
            # Find the corresponding character in the key
            key_char = key[i % key_length]
            key_index = alphabet.index(key_char)
            
            # Decrypt the character using the Vigenère cipher formula
            char_index = alphabet.index(ciphertext[i])
            decrypted_char_index = (char_index - key_index) % 52
            decrypted_char = alphabet[decrypted_char_index]
            
            plaintext += decrypted_char
        else:
            # If the character is not in the alphabet, leave it unchanged
            plaintext += ciphertext[i]
    return plaintext

#vigenere cipher
plaintext = input()
key = "B"

# Encryption
encrypted_text = encrypt(plaintext, key)
print("Encrypted:", encrypted_text)

# Decryption
decrypted_text = ecrypt(encrypted_text, key)
print("Decrypted:", decrypted_text)

