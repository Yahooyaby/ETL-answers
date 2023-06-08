# Написать функцию is_prime,
# принимающую 1 аргумент — число от 0 до 1000,
# и возвращающую True, если оно простое, и False - иначе.

def is_prime(number):
    for i in range(2, number):
        if number % i == 0:
            return False
    return True
