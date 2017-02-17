// This is used in several places to test declaration list
// It encapsulates all errors possible there.
int a;
bool a;             // Multiply
void b;             // Void
void a;             // Void & Multiply
struct Node a;      // Struct name & Multiply

// Struct body issues
struct Person {
    int a;
    bool a;         // Multiply
    void b;         // Void
    void a;         // Void & Multiply
    struct Node a;  // Struct name & Multiply
};

struct Person {     // Multiply
    int a;
};

struct City {
    struct Person person;
    struct City city; // Struct name
};

struct Country {
    struct City city;
};

// Function var declaration and stmt issues
int countryFunc(int a, bool a, void b, void a) {  // Multiply, Void, Void & Multiply
    int x;
    bool x;             // Multiply
    void y;             // Void
    void x;             // Void & Multiply
    struct Node x;      // Struct name & Multiply

    struct Person person;
    person.x = 1;               // Struct field
}

int countryFunc(int a, bool a, void b, void a) {  // Multiply, Multiply, Void, Void & Multiply
    int a;              // Multiply
    bool a;             // Multiply
    void b;             // Multiply & Void
    void a;             // Multiply & Void
    struct Node a;      // Struct name & Multiply
}

int main() {
    struct Person person;
    struct City city;
    struct Country country;
    int num;


    // Operations
    Country.city = 1;           // Dot access
    country.x = 1;              // Struct field
    country.city.y++;           // Struct field
    country.city.person.z--;    // Struct field
    city.x = city.y + city.z;   // 3x Struct field

    undeclared = 1;             // Undeclared
    undeclared.x = 1;           // Undeclared, Dot access
    num.x = 1;                  // Dot access

    // Comparators + if then statement
    if (!x && y || (x == y) != (x < y)) {  // 6x undeclared
        int a;
        bool a;             // Multiply
        void b;             // Void
        void a;             // Multiply & Void
        struct Node a;      // Struct name & Multiply

        int x;

        undeclared.x = 1;   // Undeclared, dot access
        country.x = 1;      // Struct field
        num.x = 1;          // Dot access
    }

    // If then else statement
    if (country.x) {  // Struct field

    }
    else {
        int a;
        bool a;             // Multiply
        void b;             // Void
        void a;             // Multiply & Void
        struct Node a;      // Struct name & Multiply

        undeclared.x = 1;   // Undeclared, dot access
        country.x = 1;      // Struct field
        num.x = 1;          // Dot access
    }

    while (z) {             // Undeclared
        int a;
        bool a;             // Multiply
        void b;             // Void
        void a;             // Multiply & Void
        struct Node a;      // Struct name & Multiply

        undeclared.x = 1;   // Undeclared, dot access
        country.x = 1;      // Struct field
        num.x = 1;          // Dot access
    }

    return undeclared.x || country.x == num.x; // Undeclared, dot access, Struct field, dot access
}

