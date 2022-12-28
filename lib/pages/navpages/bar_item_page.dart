import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BarPage extends StatefulWidget {
  const BarPage({super.key});

  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  @override
  Widget build(BuildContext context) {
     return Center(
      child: Text("bar page"),
    );;
  }
}