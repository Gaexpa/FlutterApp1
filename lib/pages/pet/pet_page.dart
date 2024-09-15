import 'package:demo/widgets/pet_option_box_button.dart';
import 'package:flutter/material.dart';

class PetPage extends StatefulWidget {
  const PetPage({super.key});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PetOptionBoxButton(Icons.pets_outlined, (){}),
              PetOptionBoxButton(Icons.pets_outlined, (){}),
              PetOptionBoxButton(Icons.pets_outlined, (){}),
              PetOptionBoxButton(Icons.pets_outlined, (){}),
            ],
          ),
        ],
      ),
    );
  }
}
