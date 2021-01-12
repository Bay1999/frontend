import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class VisualisasiBencana extends StatefulWidget {
  @override
  _VisualisasiBencanaState createState() => _VisualisasiBencanaState();
}

class _VisualisasiBencanaState extends State<VisualisasiBencana> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InteractiveViewer(
      panEnabled: false, // Set it to false
      boundaryMargin: EdgeInsets.all(100),
      minScale: 0.5,
      maxScale: 2,
      child: Image.asset(
        'assets/images/peta.jpg',
        fit: BoxFit.cover,
      ),
    ));
  }
}
