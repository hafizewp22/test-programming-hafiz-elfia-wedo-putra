#include <iostream>
using namespace std;

int main()
{

    int spasi, a = 5;

    for (int i = a; i >= 1; i--)
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