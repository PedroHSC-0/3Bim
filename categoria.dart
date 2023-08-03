import 'package:flutter/material.dart';

class Categoria {
    final String id;
    final String titulo;
    final Colors color;
    
    const Categoria({
        super.key, 
        required this.id, 
        required this.titulo, 
        required this.color});
}