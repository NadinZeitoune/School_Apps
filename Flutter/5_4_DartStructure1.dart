typedef MyCallBack = int Function(int n1, int n2);

void main() {
  int n1 = 2;
  int n2 = 2;
  //print(addNumbers(n1, n2));
  //print("do $n1 + ${n2} = ${addNumbers(n2, n2)}");
  //print("lambda => ${manipulation(n1, n2, (n1, n2) => n1 + n2)}");
  //print("lambda2lines {} ${manipulation(n1, n2, (n1, n2) { return n1 + n2;})}");
  MyCallBack myCallBack = (n1, n2) {
    return n1 + n2;
  };
  print("typedef Function ${manipulation(n1, n2, myCallBack)}");
}

int manipulation(int n1, int n2, Function callback) {
  return callback(n1, n2);
}

int addNumbers(int n1, int n2) {
  return n1 + n2;
}
