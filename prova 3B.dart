import 'package:flutter/material.dart';
import 'package:prova_tmnc/generations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenerationListScreen(generations: generations),
    );
  }
}

class GenerationList extends StatelessWidget {
  final List<Generation> generations;
  final ValueChanged<String> onGenerationSelected;

  GenerationList({
    required this.generations,
    required this.onGenerationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: generations.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(generations[index].title),
          onTap: () {
            onGenerationSelected(generations[index].title);
          },
        );
      },
    );
  }
}


class GenerationListScreen extends StatelessWidget {
  final List<Generation> generations;

  GenerationListScreen({required this.generations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerações de Pokémon'),
      ),
      body: GenerationList(
        generations: generations,
        onGenerationSelected: (selectedTitle) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GenerationDetailScreen(
                generationTitle: selectedTitle,
                generations: generations,
              ),
            ),
          );
        },
      ),
    );
  }
}


class GenerationDetailScreen extends StatelessWidget {
  final String generationTitle;
  final List<Generation> generations;

  GenerationDetailScreen({
    required this.generationTitle,
    required this.generations,
  });

  @override
  Widget build(BuildContext context) {
    // Encontre a geração correspondente com base no título selecionado
    Generation selectedGeneration = generations.firstWhere(
      (generation) => generation.title == generationTitle,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedGeneration.title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: selectedGeneration.pokemons.length,
        itemBuilder: (context, index) {
          return Image.asset(
            selectedGeneration.pokemons[index],
            width: 100,
            height: 100,
          );
        },
      ),
    );
  }
}