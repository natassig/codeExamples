# quersumme.py - finds the solution to this riddle:
# In the year 1898, a woman realizes that her age equals exactly the digit sum of her birth year. How old is she?

def quersumme(myInteger): # Calculates digit sum
    sum = 0
    for i in str(myInteger):
        sum+=int(i)
    return sum

# Iterate over all years from 0-1898, calculate her age and the digit sum and check if theyre the same.
for birthyear in range(1899):
    age = 1898-birthyear
    if quersumme(birthyear) == age:
        print(birthyear, age)
