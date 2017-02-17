int i;
bool b;
struct a_struct {
  int a;
};
struct a_struct s;

void void_func(int i1, bool b2) {
  // e12 (unexpected return value)
  return 1;
}

int int_func(int i1) {
  // e11 (no return)
  return;
}

bool bool_func() {
  // e13 (wrong return type)
  return 0;
}

void main() {
  // Tests every statement case (roughly 1-2 per line)
  cout << void_func; // e1
  cout << a_struct; // e2
  cout << s; // e3
  cout << void_func(i, b); // e4
  cin >> int_func; // e5
  cin >> a_struct; // e6
  cin >> s; // e7
  i(); // e8
  b(); // e8
  s(); // e8
  void_func(i); // e9
  void_func(i, b, b); // e9
  int_func(i, b); // e9
  bool_func(i); // e9
  void_func(b, i); // e10
  int_func(s); // e10
  int_func(b); // e10
  void_func(i, s); // e10
  b++; // e14
  s++; // e14
  i = b + s; // e14
  i = s * b; // e14
  i = i / s; // e14
  b = b > s; // e15
  b = i < s; // e15
  b = b >= s; // e15
  b = i <= s; // e15
  b = i && s; // e16
  b = i || s; // e16
  b = !s; // e16
  if (s) { // e17

  }
  while (i) { // e18

  }
  while (s) { // e18

  }
  b = i == true; // e19
  b = s != i; // e19
  b = true == i; // e19
  b = s == i; // e19
  b = i; // e19
  s = i; // e19
  i = s; // e19
  s = "str"; // e19
  i = "str"; // e19
  b = "str"; // e19
  b = void_func(i, b) == void_func(i, b); // e20
  b = int_func == int_func || void_func != bool_func; // e21
  b = a_struct == a_struct; // e22
  b = a_struct != a_struct; // e22
  b = s == s || s != s; // e23
  void_func = bool_func; // e24
  bool_func = int_func; // e24
  a_struct = a_struct; // e25
  s = s; // e26
}

void withinIf() {
    if (true) {
        // Tests every statement case (roughly 1-2 per line)
        cout << void_func; // e1
        cout << a_struct; // e2
        cout << s; // e3
        cout << void_func(i, b); // e4
        cin >> int_func; // e5
        cin >> a_struct; // e6
        cin >> s; // e7
        i(); // e8
        b(); // e8
        s(); // e8
        void_func(i); // e9
        void_func(i, b, b); // e9
        int_func(i, b); // e9
        bool_func(i); // e9
        void_func(b, i); // e10
        int_func(s); // e10
        int_func(b); // e10
        void_func(i, s); // e10
        b++; // e14
        s++; // e14
        i = b + s; // e14
        i = s * b; // e14
        i = i / s; // e14
        b = b > s; // e15
        b = i < s; // e15
        b = b >= s; // e15
        b = i <= s; // e15
        b = i && s; // e16
        b = i || s; // e16
        b = !s; // e16
        if (s) { // e17

        }
        while (i) { // e18

        }
        while (s) { // e18

        }
        b = i == true; // e19
        b = s != i; // e19
        b = true == i; // e19
        b = s == i; // e19
        b = i; // e19
        s = i; // e19
        i = s; // e19
        s = "str"; // e19
        i = "str"; // e19
        b = "str"; // e19
        b = void_func(i, b) == void_func(i, b); // e20
        b = int_func == int_func || void_func != bool_func; // e21
        b = a_struct == a_struct; // e22
        b = a_struct != a_struct; // e22
        b = s == s || s != s; // e23
        void_func = bool_func; // e24
        bool_func = int_func; // e24
        a_struct = a_struct; // e25
        s = s; // e26
    }
}

void withinIfElse() {
    if (true) {
        // Tests every statement case (roughly 1-2 per line)
        cout << void_func; // e1
        cout << a_struct; // e2
        cout << s; // e3
        cout << void_func(i, b); // e4
        cin >> int_func; // e5
        cin >> a_struct; // e6
        cin >> s; // e7
        i(); // e8
        b(); // e8
        s(); // e8
        void_func(i); // e9
        void_func(i, b, b); // e9
        int_func(i, b); // e9
        bool_func(i); // e9
        void_func(b, i); // e10
        int_func(s); // e10
        int_func(b); // e10
        void_func(i, s); // e10
        b++; // e14
        s++; // e14
        i = b + s; // e14
        i = s * b; // e14
        i = i / s; // e14
        b = b > s; // e15
        b = i < s; // e15
        b = b >= s; // e15
        b = i <= s; // e15
        b = i && s; // e16
        b = i || s; // e16
        b = !s; // e16
        if (s) { // e17

        }
        while (i) { // e18

        }
        while (s) { // e18

        }
        b = i == true; // e19
        b = s != i; // e19
        b = true == i; // e19
        b = s == i; // e19
        b = i; // e19
        s = i; // e19
        i = s; // e19
        s = "str"; // e19
        i = "str"; // e19
        b = "str"; // e19
        b = void_func(i, b) == void_func(i, b); // e20
        b = int_func == int_func || void_func != bool_func; // e21
        b = a_struct == a_struct; // e22
        b = a_struct != a_struct; // e22
        b = s == s || s != s; // e23
        void_func = bool_func; // e24
        bool_func = int_func; // e24
        a_struct = a_struct; // e25
        s = s; // e26
    }
    else {
        // Tests every statement case (roughly 1-2 per line)
        cout << void_func; // e1
        cout << a_struct; // e2
        cout << s; // e3
        cout << void_func(i, b); // e4
        cin >> int_func; // e5
        cin >> a_struct; // e6
        cin >> s; // e7
        i(); // e8
        b(); // e8
        s(); // e8
        void_func(i); // e9
        void_func(i, b, b); // e9
        int_func(i, b); // e9
        bool_func(i); // e9
        void_func(b, i); // e10
        int_func(s); // e10
        int_func(b); // e10
        void_func(i, s); // e10
        b++; // e14
        s++; // e14
        i = b + s; // e14
        i = s * b; // e14
        i = i / s; // e14
        b = b > s; // e15
        b = i < s; // e15
        b = b >= s; // e15
        b = i <= s; // e15
        b = i && s; // e16
        b = i || s; // e16
        b = !s; // e16
        if (s) { // e17

        }
        while (i) { // e18

        }
        while (s) { // e18

        }
        b = i == true; // e19
        b = s != i; // e19
        b = true == i; // e19
        b = s == i; // e19
        b = i; // e19
        s = i; // e19
        i = s; // e19
        s = "str"; // e19
        i = "str"; // e19
        b = "str"; // e19
        b = void_func(i, b) == void_func(i, b); // e20
        b = int_func == int_func || void_func != bool_func; // e21
        b = a_struct == a_struct; // e22
        b = a_struct != a_struct; // e22
        b = s == s || s != s; // e23
        void_func = bool_func; // e24
        bool_func = int_func; // e24
        a_struct = a_struct; // e25
        s = s; // e26
    }
}

void withinWhile() {
    while (true) {
        // Tests every statement case (roughly 1-2 per line)
        cout << void_func; // e1
        cout << a_struct; // e2
        cout << s; // e3
        cout << void_func(i, b); // e4
        cin >> int_func; // e5
        cin >> a_struct; // e6
        cin >> s; // e7
        i(); // e8
        b(); // e8
        s(); // e8
        void_func(i); // e9
        void_func(i, b, b); // e9
        int_func(i, b); // e9
        bool_func(i); // e9
        void_func(b, i); // e10
        int_func(s); // e10
        int_func(b); // e10
        void_func(i, s); // e10
        b++; // e14
        s++; // e14
        i = b + s; // e14
        i = s * b; // e14
        i = i / s; // e14
        b = b > s; // e15
        b = i < s; // e15
        b = b >= s; // e15
        b = i <= s; // e15
        b = i && s; // e16
        b = i || s; // e16
        b = !s; // e16
        if (s) { // e17

        }
        while (i) { // e18

        }
        while (s) { // e18

        }
        b = i == true; // e19
        b = s != i; // e19
        b = true == i; // e19
        b = s == i; // e19
        b = i; // e19
        s = i; // e19
        i = s; // e19
        s = "str"; // e19
        i = "str"; // e19
        b = "str"; // e19
        b = void_func(i, b) == void_func(i, b); // e20
        b = int_func == int_func || void_func != bool_func; // e21
        b = a_struct == a_struct; // e22
        b = a_struct != a_struct; // e22
        b = s == s || s != s; // e23
        void_func = bool_func; // e24
        bool_func = int_func; // e24
        a_struct = a_struct; // e25
        s = s; // e26
    }
}

