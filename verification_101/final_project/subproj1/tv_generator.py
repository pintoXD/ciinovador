import random


def generate_sum_value():
    """
    Generates a test vector for the addition operation.

    Returns:
        tuple: A tuple containing hexadecimal representations of:
            - mock_a (str): The first operand.
            - mock_b (str): The second operand.
            - sum_value (str): The result of the addition.
            - carry (str): The carry-out of the addition.
    """
    # function implementation
    mock_a = random.randint(0, 255)
    mock_b = random.randint(0, mock_a)
    result = mock_a + mock_b
    carry = (result >> 8) & 1
    sum_value = result & 0xFF
    return generate_hex_value(mock_a, mock_b, sum_value, carry)

def generate_sub_value():
    """
    Generates a test vector for the subtraction operation.

    Returns:
        tuple: A tuple containing hexadecimal representations of:
            - mock_a (str): The first operand.
            - mock_b (str): The second operand.
            - sub_value (str): The result of the subtraction.
            - carry (str): The carry-out of the subtraction.
    """
    # function implementation
    mock_a = random.randint(0, 255)
    mock_b = random.randint(0, mock_a) # Fix this, mock_a should be greater than mock_b
    result = mock_a - mock_b
    carry = (result >> 8) & 1
    sub_value = result & 0xFF
    return generate_hex_value(mock_a, mock_b, sub_value, carry)


# def multiply_8bit_integers():
#     """
#     Multiplies two random 8-bit integers and stores the result in an 8-bit integer variable.

#     Returns:
#         tuple: A tuple containing:
#             - mock_a (int): The first operand.
#             - mock_b (int): The second operand.
#             - result (int): The result of the multiplication, truncated to 8 bits.
#     """
#     mock_a = random.randint(0, 255)
#     mock_b = random.randint(0, 255)
#     result = (mock_a * mock_b) & 0xFF  # Truncate to 8 bits
#     return mock_a, mock_b, result



def generate_multiplication_value():
    """
    Generates a test vector for the multiplication operation.

    Returns:
        tuple: A tuple containing hexadecimal representations of:
            - mock_a (str): The first operand.
            - mock_b (str): The second operand.
            - multiplication_value (str): The result of the multiplication.
            - carry (str): The carry-out of the multiplication.
    """
    # function implementation
    mock_a = random.randint(0, 15)
    mock_b = random.randint(0, mock_a)
    result = mock_a * mock_b
    # carry = (result >> 8) & 0xFF
    # multiplication_value = result & 0xFF
    return generate_hex_value(mock_a, mock_b, result, 0)

def generate_division_value():
    """
    Generates a test vector for the division operation.

    Returns:
        tuple: A tuple containing hexadecimal representations of:
            - mock_a (str): The first operand.
            - mock_b (str): The second operand.
            - result (str): The quotient of the division.
            - remainder (str): The remainder of the division.
    """
    # function implementation
    mock_a = random.randint(0, 255)
    mock_b = random.randint(1, mock_a)  # from 1 to 255 to avoid division by zero
    result = mock_a // mock_b
    remainder = mock_a % mock_b
    return generate_hex_value(mock_a, mock_b, result, remainder)

def generate_hex_value(data_a, data_b, data_c, data_d):
    """
    Converts four integer values to their hexadecimal string representations.

    Args:
        data_a (int): The first integer value.
        data_b (int): The second integer value.
        data_c (int): The third integer value.
        data_d (int): The fourth integer value.

    Returns:
        tuple: A tuple containing the hexadecimal string representations of the input values.
    """
    # function implementation
    return format(data_a, 'x'), format(data_b, 'x'), format(data_c, 'x'), format(data_d, 'x')
    # return format(random.randint(0, 2**bits - 1), 'x')


def generate_tv_file(filename, num_vectors):
    """
    Generates a test vector file with specified number of vectors for different ALU operations.

    Args:
        filename (str): The name of the file to write the test vectors to.
        num_vectors (int): The number of test vectors to generate for each ALU operation.

    Writes:
        A file with the specified filename containing the generated test vectors.
    """
    # function implementation
    with open(filename, 'w') as f:
        print("####### Addition #######")
        for _ in range(num_vectors):
            A, B, Expected_ALU_Out, Expected_CarryOut = generate_sum_value()
            ALU_Sel = '0000'
            print(f"A: {int(A, 16)}, B: {int(B, 16)}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {int(Expected_ALU_Out, 16)}, Expected_CarryOut: {int(Expected_CarryOut, 16)}")
            f.write(f"{A} {B} {ALU_Sel} {Expected_ALU_Out} {Expected_CarryOut}\n")

        print("####### Subtraction #######")
        for _ in range(num_vectors):
            A, B, Expected_ALU_Out, Expected_CarryOut = generate_sub_value()
            ALU_Sel = '0001'
            # print(f"A: {A}, B: {B}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {Expected_ALU_Out}, Expected_CarryOut: {Expected_CarryOut}")
            print(f"A: {int(A, 16)}, B: {int(B, 16)}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {int(Expected_ALU_Out, 16)}, Expected_CarryOut: {int(Expected_CarryOut, 16)}")
            f.write(f"{A} {B} {ALU_Sel} {Expected_ALU_Out} {Expected_CarryOut}\n")

        print("###### Multiplication ######")
        for _ in range(num_vectors):
            A, B, Expected_ALU_Out, Expected_CarryOut = generate_multiplication_value()
            ALU_Sel = '0010'
            # print(f"A: {A}, B: {B}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {Expected_ALU_Out}, Expected_CarryOut: {Expected_CarryOut}")
            print(f"A: {int(A, 16)}, B: {int(B, 16)}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {int(Expected_ALU_Out, 16)}, Expected_CarryOut: {int(Expected_CarryOut, 16)}")
            f.write(f"{A} {B} {ALU_Sel} {Expected_ALU_Out} {Expected_CarryOut}\n")

        print("###### Division ######")
        for _ in range(num_vectors):
            A, B, Expected_ALU_Out, Expected_CarryOut = generate_division_value()
            ALU_Sel = '0011'
            # print(f"A: {A}, B: {B}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {Expected_ALU_Out}, Expected_CarryOut: {Expected_CarryOut}")
            print(f"A: {int(A, 16)}, B: {int(B, 16)}, ALU_Sel: {ALU_Sel}, Expected_ALU_Out: {int(Expected_ALU_Out, 16)}, Expected_CarryOut: {int(Expected_CarryOut, 16)}")
            f.write(f"{A} {B} {ALU_Sel} {Expected_ALU_Out} {Expected_CarryOut}\n")

if __name__ == "__main__":
    generate_tv_file("data2.tv", 5)
