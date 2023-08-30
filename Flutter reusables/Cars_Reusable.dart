import 'package:flutter/material.dart';

class Car {
  final String numberPlate;
  final String color;
  final String engineNumber;

  Car({
    required this.numberPlate,
    required this.color,
    required this.engineNumber,
  });
}

class CarInformation extends StatelessWidget {
  const CarInformation({super.key, required this.car});
  final Car car;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.green[50],
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Number Plate:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(car.numberPlate),
          const SizedBox(height: 8.0),
          const Text(
            'Color:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(car.color),
          const SizedBox(height: 8.0),
          const Text(
            'Engine Number:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(car.engineNumber),
        ],
      ),
    );
  }
}
