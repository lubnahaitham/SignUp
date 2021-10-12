import 'package:flutter/material.dart';
import 'package:form/pages/home.dart';

void main() => runApp(
  MaterialApp(
    routes: {
      '/': (context) => const Home(),
    },
  ),
);

