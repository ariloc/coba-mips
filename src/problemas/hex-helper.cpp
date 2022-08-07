#include <iostream>
#include <string>
#include <iomanip>

using namespace std;

int main() {
    string s;
    getline(cin,s);

    cout << internal << setfill('0');

    while((int)s.size()%4) s.push_back(0);
    for (int i = 0; i < (int)s.size(); i += 4) {
        cout << "0x";
        for (int j = 3; j >= 0; j--)
            cout << hex << setw(2) << (int)s[i+j];
	cout << '\n';
    }

    return 0;
}
