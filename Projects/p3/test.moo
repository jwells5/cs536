int x;
int y;

struct city {
    int students;
    int population;
    struct city subcity;
};

void printHello() {
    cout << "Hello, " + "World!";
    cin >> input;
    // return nothing...
    return;
}

bool is_two(int num1, int num2) {
    return num1 == 2 && !(num2 != 2);
}

int main() {
    // Decls first...
    struct city madison;
    bool b;
    int a;
    int y;

    // Example given to us for unparse method...
    if (a == -1) { x = 4+3*5-y; while (c) { y = y*2+x; } } else { x = 0; }

    // Complex dot operator assoc
    a = madison.subcity.subcity.population;
    a = (b.c);
    b.c = a();
    
    if (madison.population > 0) {
        b = true;
        a = -madison.population;
    }
    else {
        b = false;
        a = madison.population;
    }

    while (a > 0 && b == !false) {
        a++;
        while (-a >= -20) {
            a++;
            b = is_two(madison.students, madison.population);
            if (b) {
                y = madison.students * 2;
            }
        }
        a = a - -y;
        a--;
    }

    b = a + 1;
    b = a - 1;
    b = a * 1;
    b = a / 1;
    b = !a;
    b = a && a;
    b = a || a;
    b = a == 0;
    b = a != 0;
    b = a < 0;
    b = a > 0;
    b = a <= 0;
    b = a >= 0;
    b = -a;
    b = 1;
    b = "Test";
    b = true;
    b = false;
    b = ((a >= 0 || a < 0) || !b && a < 2);
    

    return 0;
}

