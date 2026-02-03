import 'dart:convert';

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
    print(result);
  } catch(e, s) {
    print('xato');
    print('error: $e');
    print('stuck track: $s');
  }

  print('Finish app');

}