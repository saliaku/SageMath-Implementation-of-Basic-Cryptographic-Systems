#QUESTION 5 TRANSPOSITION CIPHER

#encryption function for Columnar Transposition Cipher
def columnar_transposition_encrypt(plaintext, key):
    #key length is the number of columns 
    num_columns = len(key)

    #rows=this formula
    num_rows = len(plaintext) // num_columns
    if len(plaintext) % num_columns != 0:
        num_rows += 1

    #empty grid (2D list) for the transposition
    transposition_grid = [[' ' for _ in range(num_columns)] for _ in range(num_rows)]

    # Fill in the grid with characters from the plaintext, including spaces
    index = 0
    for row in range(num_rows):
        for col in range(num_columns):
            if index < len(plaintext):
                transposition_grid[row][col] = plaintext[index]
                index += 1

    # Create the ciphertext by reading columns row by row
    ciphertext = ''
    for col in key:
        col_index = int(col) - 1  
        for row in range(num_rows):
            ciphertext += transposition_grid[row][col_index]

    return ciphertext

#decryption function for Columnar Transposition Cipher
def columnar_transposition_decrypt(ciphertext, key):
    num_columns = len(key)
    num_rows = len(ciphertext) // num_columns
    
    if len(ciphertext) % num_columns != 0:
        num_rows += 1

    # Create an empty grid (2D list) for the transposition
    transposition_grid = [[' ' for _ in range(num_columns)] for _ in range(num_rows)]

    # Fill in the grid with characters from the ciphertext
    index = 0
    for col in key:
        col_index = int(col) - 1  # Convert column number from key to 0-based index
        for row in range(num_rows):
            transposition_grid[row][col_index] = ciphertext[index]
            index += 1

    # Reconstruct the plaintext by reading columns in the order specified by the key
    plaintext = ''
    for row in range(num_rows):
        for col in range(num_columns):
            plaintext += transposition_grid[row][col]

    return plaintext

#Columnar Transposition Cipher
plaintext = input()
key = "3142"

# Encryption
encrypted_text = columnar_transposition_encrypt(plaintext, key)
print("Encrypted:", encrypted_text)

# Decryption
decrypted_text = columnar_transposition_decrypt(encrypted_text, key)
print("Decrypted:", decrypted_text)

