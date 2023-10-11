#QUESTION 1 Affine cipher
alphabet1 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
alphabet2 ='abcdefghijklmnopqrstuvwxyz'
#total number of alphabets is 26+26=52

#encryption function
def encrypt(plaintext, a, b):
    ciphertext = ''
    for char in plaintext:
        if char in alphabet1:
            #char to index
            char_index = alphabet1.index(char)
            
            #encryption 
            encrypted_char_index = (a * char_index + b) % 26
            
            #index to char 
            encrypted_char = alphabet1[encrypted_char_index]
            
            ciphertext += encrypted_char
        elif char in alphabet2:
            #char to index
            char_index = alphabet2.index(char)
            
            #encryption 
            encrypted_char_index = (a * char_index + b) % 26
            
            #index to char 
            encrypted_char = alphabet2[encrypted_char_index]
            
            ciphertext += encrypted_char
        	
        else:
            ciphertext += char
            
    return ciphertext

#decryption function
def decrypt(ciphertext, a, b):
    plaintext = ''
    a_inv = inverse_mod(a, 26)  #modular multiplicative inverse of  'a'
    
    for char in ciphertext:
        if char in alphabet1 :
            # char to index
            char_index = alphabet1.index(char)
            
            #decryption
            decrypted_char_index = (a_inv * (char_index - b)) % 26
            
            #index to char
            decrypted_char = alphabet1[decrypted_char_index]
            
            plaintext += decrypted_char
        elif char in alphabet2:
            # char to index
            char_index = alphabet2.index(char)
            
            #decryption
            decrypted_char_index = (a_inv * (char_index - b)) % 26
            
            #index to char
            decrypted_char = alphabet2[decrypted_char_index]
            
            plaintext += decrypted_char
        else:
            plaintext += char
            
    return plaintext

#Affine cipher
#for both small letters and capital letters
plaintext = input()
a = 5  # Multiplicative key
b = 7  # Additive key


# Encryption
# E(x) = (ax + b) % m
encrypted_text = encrypt(plaintext, a, b)
print("Affine Encrypted:", encrypted_text)

# Decryption
# D(y) = a_inv * (y - b) % m
decrypted_text = decrypt(encrypted_text, a, b)
print("Affine Decrypted:", decrypted_text)
