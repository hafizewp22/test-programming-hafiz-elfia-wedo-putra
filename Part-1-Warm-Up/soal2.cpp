#include <iostream>

void fizzBuzz(int angka)
{
    if (angka % 3 == 0 && angka % 5 == 0)
    {
        std::cout << "FizzBuzz" << std::endl;
    }
    else if (angka % 3 == 0)
    {
        std::cout << "Fizz" << std::endl;
    }
    else if (angka % 5 == 0)
    {
        std::cout << "Buzz" << std::endl;
    }
    else
    {
        std::cout << angka << std::endl;
    }
}

int main()
{
    for (int i = 1; i <= 100; i++)
    {
        fizzBuzz(i);
    }

    return 0;
}
