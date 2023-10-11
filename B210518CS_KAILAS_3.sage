#QUESTION 3 SHIFT/CAESAR  CIPHER 

# Define the alphabet
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

#size of alphabet , useful if we are adding more alphabets to the alphabet list ...
m = len(alphabet)

#encryption code 
def shift_encrypt(plaintext, shift):
    ciphertext = ''
    for char in plaintext:
        if char in alphabet:
            #char to index
            char_index = alphabet.index(char)

            #applying shift encryption
            encrypted_char_index = (char_index + shift) % m

            #index to char 
            encrypted_char = alphabet[encrypted_char_index]

            ciphertext += encrypted_char
        else:
            ciphertext += char
            
            
    return ciphertext

#decryption code 
def shift_decrypt(ciphertext, shift):
    plaintext = ''
    for char in ciphertext:
        if char in alphabet:
            #char to index
            char_index = alphabet.index(char)

            #decryption 
            decrypted_char_index = (char_index - shift) % m

            #index to char 
            decrypted_char = alphabet[decrypted_char_index]

            plaintext += decrypted_char
        else:
            plaintext += char
            
    return plaintext



#Shift Cipher
plaintext = input()
shift = 3  # Shift key is 3 for caesar cipher

# Encryption
encrypted_text = shift_encrypt(plaintext, shift)
print("Encrypted:", encrypted_text)

# Decryption
decrypted_text = shift_decrypt(encrypted_text, shift)
print("Decrypted:", decrypted_text)
