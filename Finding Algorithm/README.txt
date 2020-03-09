#Finding Algorithm (isPrime) Written In Assembly Language

The following Python code that finds whether each element of the input list is a prime number (if a number is prime, returns 1; otherwise, returns 0). 
In the MIPS code, a list A (array A) of integer numbers (each integer in 4-bytes) have been stored in memory. MIPS register $s0 hold the base address of list A, register $s1 stores the length of the list A.
1. 	def is_prime(x): 
2. 		for i in range(2,x): 
3. 			if (x%i==0): 
4. 				return 0 
5. 		return 1 
6. 
7. 	a = [4, 8, 15, 16, 23, 42] 
8. 	index = 0 
9. 	for i in a: 
10. 		a[index] = is_prime(i) 
11. 		index += 1


For example:
input list: [4, 8, 15, 16, 23, 42] .
After running the code, the list is updated as follows:
list: [0, 0, 0, 0, 1, 0]