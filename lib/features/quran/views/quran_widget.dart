import 'package:flutter/material.dart';

class QuranWidget extends StatelessWidget {
  const QuranWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) => Card(
          semanticContainer: true,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin:const EdgeInsets.all(5),
          child:const Row(children: [Text('data')] ),),
        separatorBuilder: (context, index) => const SizedBox(height: 10,), 
        itemCount: 10),
    );
  }
}