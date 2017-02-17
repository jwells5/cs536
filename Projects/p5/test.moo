int i1;
int i2;
bool b1;
bool b2;
struct a_struct {
  int a;
};
struct a_struct s1;
struct a_struct s2;

void void_func(int i1, bool b2) {
  return;
}

int int_func(int i1) {
  // e11
  return 1;
}

bool bool_func() {
  // e13
  return true;
}

void main() {
    cout << "writing";
    cout << i1;
    cout << b1;
    cout << s1.a;
    cout << int_func(1);
    cout << bool_func();
    cin >> i1;
    cin >> b1;
    cin >> s1.a;
    void_func(i1, b1);
    int_func(i2);
    bool_func();
    int_func(123);
    void_func(123, true);
    i1 = i1 * i2;
    i1 = i1 / 2;
    i1++;
    i2--;
    i1 = i1 + i2;
    i1 = 4 - i2;
    b1 = i1 > i2;
    b1 = i1 < i2;
    b1 = i1 >= 2;
    b1 = i2 <= 100;
    b1 = b1 && b2;
    b1 = b2 || b1;
    b1 = !true || false && b2;
    if (true) {

    }
    if (b1 && b2 || true) {

    }
    while (i1 >= 2 || s1.a == 5) {

    }
    b1 = i1 == i2;
    b1 = b2 == true;
    b2 = i1 != i2;
    b2 = int_func(1) == int_func(91);
    b2 = bool_func() || bool_func();
}

void withinIf() {
    if (true) {
        cout << "writing";
        cout << i1;
        cout << b1;
        cout << s1.a;
        cout << int_func(1);
        cout << bool_func();
        cin >> i1;
        cin >> b1;
        cin >> s1.a;
        void_func(i1, b1);
        int_func(i2);
        bool_func();
        int_func(123);
        void_func(123, true);
        i1 = i1 * i2;
        i1 = i1 / 2;
        i1++;
        i2--;
        i1 = i1 + i2;
        i1 = 4 - i2;
        b1 = i1 > i2;
        b1 = i1 < i2;
        b1 = i1 >= 2;
        b1 = i2 <= 100;
        b1 = b1 && b2;
        b1 = b2 || b1;
        b1 = !true || false && b2;
        if (true) {

        }
        if (b1 && b2 || true) {

        }
        while (i1 >= 2 || s1.a == 5) {

        }
        b1 = i1 == i2;
        b1 = b2 == true;
        b2 = i1 != i2;
        b2 = int_func(1) == int_func(91);
        b2 = bool_func() || bool_func();
    }
}

void withinElse() {
    if (false) {
    }
    else {
        cout << "writing";
        cout << i1;
        cout << b1;
        cout << s1.a;
        cout << int_func(1);
        cout << bool_func();
        cin >> i1;
        cin >> b1;
        cin >> s1.a;
        void_func(i1, b1);
        int_func(i2);
        bool_func();
        int_func(123);
        void_func(123, true);
        i1 = i1 * i2;
        i1 = i1 / 2;
        i1++;
        i2--;
        i1 = i1 + i2;
        i1 = 4 - i2;
        b1 = i1 > i2;
        b1 = i1 < i2;
        b1 = i1 >= 2;
        b1 = i2 <= 100;
        b1 = b1 && b2;
        b1 = b2 || b1;
        b1 = !true || false && b2;
        if (true) {

        }
        if (b1 && b2 || true) {

        }
        while (i1 >= 2 || s1.a == 5) {

        }
        b1 = i1 == i2;
        b1 = b2 == true;
        b2 = i1 != i2;
        b2 = int_func(1) == int_func(91);
        b2 = bool_func() || bool_func();
    }
}

void withinWhile() {
    while (i1 < 0) {
        cout << "writing";
        cout << i1;
        cout << b1;
        cout << s1.a;
        cout << int_func(1);
        cout << bool_func();
        cin >> i1;
        cin >> b1;
        cin >> s1.a;
        void_func(i1, b1);
        int_func(i2);
        bool_func();
        int_func(123);
        void_func(123, true);
        i1 = i1 * i2;
        i1 = i1 / 2;
        i1++;
        i2--;
        i1 = i1 + i2;
        i1 = 4 - i2;
        b1 = i1 > i2;
        b1 = i1 < i2;
        b1 = i1 >= 2;
        b1 = i2 <= 100;
        b1 = b1 && b2;
        b1 = b2 || b1;
        b1 = !true || false && b2;
        if (true) {

        }
        if (b1 && b2 || true) {

        }
        while (i1 >= 2 || s1.a == 5) {

        }
        b1 = i1 == i2;
        b1 = b2 == true;
        b2 = i1 != i2;
        b2 = int_func(1) == int_func(91);
        b2 = bool_func() || bool_func();
    }
}

