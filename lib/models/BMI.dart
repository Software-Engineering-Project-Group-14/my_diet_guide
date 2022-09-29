class BMIModel{
  late double currentHeight;
  late double currentWeight;

  BMIModel(this.currentHeight, this.currentWeight);

  double calculateBMI(){
    double height = currentHeight / 100;
    double weight = currentWeight;
    // We dived height by 100 because we are taking the height in centimeter
    // and formula takes height in meter.

    double heightSquare = height * height;
    double result = weight / heightSquare;
    print('bmi model : ' + '${result}');
    return result;

  }

}