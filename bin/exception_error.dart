
void main(){
  final data = [79, 103, 97, 98, 101, 107];

  final buffer = StringBuffer();

  for(var item in data) {
      buffer.write(String.fromCharCode(item));
  }

  print(buffer.toString());


  final numbers = ['3', '1E+8', '1.25', 'four', '-0.01', 'NaN', 'Infinity'];

  try{
    final result = numbers.map(double.parse).toList();

    final max = result.reduce((a, b) => a > b ? a : b);
    final min = result.reduce((a, b) => a < b ? a : b);
    print('Min: $min');
    print('Max: $max');

  } on FormatException catch(e, s) {
    print('Invalid List');
    print('error: $e');
    print('stuck track: $s');
  }



  print('Finish app');




}

T firstWithDefault<T>(List<T> list, T defaultValue) {

  if(list.isEmpty) {
    return defaultValue;
  }
  return list.first;
}
