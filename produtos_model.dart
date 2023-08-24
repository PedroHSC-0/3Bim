import 'package:flutter/material.dart';

class Produto {
  final String id;
  final List categories;
  final String title;
  final int cost;
  final String imageUrl;
  final int duration;
  final bool isGluttenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree; 

  const Produtos ({
    required this.id,
    required this.categories,
    required this.cost,
    required this.imageUrl,
    required this.duration,
    required this.isGluttenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree
  });

}
