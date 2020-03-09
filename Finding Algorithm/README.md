#Finding Algorithm (isPrime) Written In Assembly Language

The following Python code that finds whether each element of the input list is a prime number (if a number is prime, returns 1; otherwise, returns 0). 
In the MIPS code, a list A (array A) of integer numbers (each integer in 4-bytes) have been stored in memory. MIPS register $s0 hold the base address of list A, register $s1 stores the length of the list A.

``` python
def is_prime(x): 
  for i in range(2,x): 
    if (x%i==0): 
      return 0 
  return 1

a = [4, 8, 15, 16, 23, 42] 
index = 0 
for i in a: 
  a[index] = is_prime(i) 
  index += 1
```
For example:
input list: [4, 8, 15, 16, 23, 42] 
After running the code, the list is updated as follows:
list: [0, 0, 0, 0, 1, 0]
