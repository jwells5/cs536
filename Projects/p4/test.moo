// Example provided on the course webpage...
struct Point {
    int x;
    int y;
};
int f(int x, bool b) { }
void g() {
    int a;
    bool b;
    struct Point p;
    p.x = a;
    b = a == 3;
    f(a + p.y*2, b);
    g();
}

// My own tests
struct Line {
    struct Point p1;
    struct Point p2;
};
int a;
bool b;

void main() {
    struct Point p1;
    struct Point p2;
    struct Line line;

    // Assign
    Line = 1;
    a = 1;
    b = true;

    // Inc/Dec
    a++;
    a--;

    // Read/Write
    cin >> f(a, b);
    cout << f(a, b);

    // If, If else, While
    // Operations are here too
    if (f(a, b) + f(a, b) - f(a, b) == 0) {
        int a;
        a = 1;
        b = 1;

        a = -a * b;
        a = a / -b;
        b = g() && f(a, b) || g();
    }
    if (true) {
        int a;
        a = a * b;
    }
    else {
        int a;
        b = a * b;
        return a >= 1 || a > 1 || a < 1 || a <= 1;
    }

    // Dot access
    p1.x = 1;
    p1.y = 1;
    p2.x = 5;
    p2.y = 5;

    line.p1 = p1;
    line.p2 = p2;

    line.p1.x = 2;
    line.p2.y = 5;

    return 1;
}

