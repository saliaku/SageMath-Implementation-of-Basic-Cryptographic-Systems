#QUESTION 2 HILL CIPHER 

#alphatet set
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ,.'
#added comma fullstop and space and additional 3 alphabets to encrypt them also




#encryption function
def encrypt(plaintext, key_matrix):
    ciphertext = ''
    n = len(key_matrix)  # Size of the key matrix
    #n is also the block size 
    
    #removing characters which are not in alphabet 
    plaintext = ''.join(filter(lambda char: char in alphabet, plaintext)) 
    
    #adding space to make the length a multiple of n
    while len(plaintext) % n != 0:
        plaintext += ' '
    
    #plaintext to numeric values
    plaintext_numeric = [alphabet.index(char) for char in plaintext]
    
    #encryption
    for i in range(0, len(plaintext_numeric), n):
        block = plaintext_numeric[i:i + n]
        encrypted_block = [sum(key_matrix[j][k] * block[k] for k in range(n)) % 55 for j in range(n)]
        ciphertext += ''.join([alphabet[x] for x in encrypted_block])
        #text is divided in to blocks and matrix multiplication is done to encrypt the text
    
    return ciphertext

#decryption function
def decrypt(ciphertext, key_matrix):
    plaintext = ''
    n = len(key_matrix)  
    
    #modular multiplicative inverse of the determinant of the key matrix
    det_inverse = power_mod(matrix(key_matrix).det(), -1, 55 )
    
    #adjugate of the key matrix
    adjugate_matrix = (det_inverse * matrix(key_matrix).adjugate()) % 55
    
    #ciphertext to numeric values
    ciphertext_numeric = [alphabet.index(char) for char in ciphertext]
    
    #decryption
    for i in range(0, len(ciphertext_numeric), n):
        block = ciphertext_numeric[i:i + n]
        decrypted_block = [sum(adjugate_matrix[j][k] * block[k] for k in range(n)) % 55 for j in range(n)]
        plaintext += ''.join([alphabet[x] for x in decrypted_block])
    
    return plaintext






#Hill cipher
plaintext = input()
key_matrix = [[6, 24,1], [13, 16,10],[20,17,15]]  # Example key matrix
#size of key matrix is the size of one block 

# Encryption
encrypted_text = encrypt(plaintext, key_matrix)
print("Encrypted:", encrypted_text)

# Decryption
decrypted_text = decrypt(encrypted_text, key_matrix)
print("Decrypted:", decrypted_text)

