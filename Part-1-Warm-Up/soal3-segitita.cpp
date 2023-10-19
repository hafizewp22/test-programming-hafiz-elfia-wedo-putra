#include <iostream>
using namespace std;

int main()
{
    int spasi, a = 5;

    for (int i = 1; i <= a; i++)
    {
        for (spasi = 1; spasi <= a - i; spasi++)
        {
            cout << " ";
        }
        for (int n = 1; n <= i; n++)
        {
            cout << "* ";
        }
        cout << endl;
    }

    return 0;
}