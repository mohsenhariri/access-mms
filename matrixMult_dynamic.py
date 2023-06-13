import random
import resourcelimit

def matrix_multiplication(a, b):
    if len(a[0]) != len(b):
        raise ValueError("The number of columns in the first matrix must match the number of rows in the second matrix")

    result = [[0 for _ in range(len(b[0]))] for _ in range(len(a))]

    for i in range(len(a)):
        for j in range(len(b[0])):
            for k in range(len(b)):
                result[i][j] += a[i][k] * b[k][j]

    return result

resourcelimit.set_max_runtime(15)

# Get matrix size from user input
rows_a = int(input("Enter the number of rows for matrix A: "))
cols_a = int(input("Enter the number of columns for matrix A: "))
rows_b = cols_a  # Number of rows in matrix B must match the number of columns in matrix A
cols_b = int(input("Enter the number of columns for matrix B: "))

# Generate random matrices based on the input size
a = [[random.randint(0, 9) for _ in range(cols_a)] for _ in range(rows_a)]
b = [[random.randint(0, 9) for _ in range(cols_b)] for _ in range(rows_b)]

result = matrix_multiplication(a, b)
#print(result)

# Print matrices A, B, and the result
print("Matrix A:")
for row in a:
    print(row)

print("\nMatrix B:")
for row in b:
    print(row)

print("\nResult:")
for row in result:
    print(row)
