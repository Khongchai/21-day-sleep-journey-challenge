//next() function acts like javascript generator's next()
class GenOnDemand {
  int i = 0;
  List<double> array;
  GenOnDemand(this.array);

  double next() {
    double num = array[i];
    i = (i + 1) % array.length;
    return num;
  }
}
