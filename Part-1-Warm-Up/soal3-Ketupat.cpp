#include <iostream>

int main()
{
    int n = 5;
    int space = n - 1;

    for (int i = 1; i <= n; i++)
    {
        for (int j = 1; j <= space; j++)
        {
            std::cout << " ";
        }
        space--;

        for (int j = 1; j <= 2 * i - 1; j++)
        {
            std::cout << "*";
        }
        std::cout << std::endl;
    }

    space = 1;
    for (int i = 1; i <= n - 1; i++)
    {
        for (int j = 1; j <= space; j++)
        {
            std::cout << " ";
        }
        space++;

        for (int j = 1; j <= 2 * (n - i) - 1; j++)
        {
            std::cout << "*";
        }
        std::cout << std::endl;
    }

    return 0;
}