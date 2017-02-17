int i;
bool b;

void newLine() {
  cout << "\n";
}

void printB() {
  cout << " is ";
  cout << b;
  newLine();
}

void main() {
  i = 13;
  b = true;

  cout << "Enter an int: ";
  cin >> i;
  newLine();

  cout << "Got: ";
  cout << i;
  newLine();

  b = i > 5;
  cout << ">5";
  printB();

  b = i == 5;
  cout << "=5?";
  printB();

  b = i < 5;
  cout << "<5?";
  printB();

  b = i <= 5;
  cout << "<=5?";
  printB();

  b = i >= 5;
  cout << ">=5?";
  printB();

  if (b) {
    cout << "the last condition was true";
    if (b) {
      cout << " (for sure)";
    }
    else {
      cout << " ERROR";
    }
    newLine();
  }

  while (b && i <= 100) {
    cout << "Enter 0 to stop... ";
    cin >> b;
    cout << i;
    cout << "\n";
    i++;
  }

  if ("a" == "abc") {
    cout << "a == abc???";
  }

  if ("a" != "a") {
    cout << "a != a???";
  } 

  if (true && !false) {
    cout << "wow";
  }
}
