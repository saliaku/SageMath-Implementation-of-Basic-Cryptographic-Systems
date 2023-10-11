#QUESTION 4 SUBSTITUTION CIPHER
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

# Define the Atbash substitution table
atbash_substitution = {alphabet[i]: alphabet[51 - i] for i in range(52)}

#encryption function 
def atbash_encrypt(plaintext):
    ciphertext = ''
    for char in plaintext:
        if char in atbash_substitution:
            # Replace the character with their mirror 
            encrypted_char = atbash_substitution[char]
            ciphertext += encrypted_char
        else:
            ciphertext += char
    return ciphertext

#decryption function (same as encrypt)
def atbash_decrypt(ciphertext):
    return atbash_encrypt(ciphertext)

#Atbash Cipher
plaintext = input()

# Encryption
encrypted_text = atbash_encrypt(plaintext)
print("Encrypted:", encrypted_text)

# Decryption
decrypted_text = atbash_decrypt(encrypted_text)
print("Decrypted:", decrypted_text)
