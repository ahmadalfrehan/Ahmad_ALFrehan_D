#include <bits/stdc++.h>
using namespace std;
int main()
{
    int arr[10], brr[5], crr[10], arrr[10], crrr[10];
    for (int i = 0; i < 10; i++)
    {
        cin >> arr[i];
        arrr[i] = arr[i];
    }
    for (int i = 0; i < 10; i++)
    {
        if (i % 2 == 0)
            brr[i] = arr[i];
    }
    for (int i = 0; i < 10; i++)
    {
        cout << arr[i] << " ";
    }
    cout << endl;
    for (int i = 0; i < 5; i++)
    {
        cout << brr[i] << " ";
    }
    cout << endl;

    for (int i = 0; i < 10; i++)
    {
        cin >> crr[i];
        crrr[i] = crr[i];
    }
    sort(crrr, crrr + 10);
    sort(arrr, arrr + 10);
    cout << "highest value of arr is: " << arrr[9] << endl;

    cout<<"lowest value of crr is: "<<crrr[0]<<endl;
    for (int i = 0; i < 10; i++)
    {
        cout << arr[i] << endl
             << "  " << crr[i] << endl
             << " ";
    }
    return 0;
}
