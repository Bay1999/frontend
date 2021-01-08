import 'package:flutter/material.dart';

class Soal extends StatelessWidget {
  final String pertanyaan;
  final String jawaban1;

  Soal(this.pertanyaan, this.jawaban1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(pertanyaan + ' ' + jawaban1),
    );
  }
}
