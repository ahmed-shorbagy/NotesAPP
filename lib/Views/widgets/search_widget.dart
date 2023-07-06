import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:points_counter/Views/widgets/Note_result_page.dart';

import '../../models/note.dart';

class SearchWidget extends SearchDelegate<List<NoteModel>> {
  final Box<NoteModel> noteBox; // Hive box containing notes

  SearchWidget(this.noteBox);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
      ),
      onPressed: () {
        close(context, []);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _performSearch();
    return SearchResultsView(results: results);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _performSearch();
    return SearchResultsView(results: results);
  }

  List<NoteModel> _performSearch() {
    final allNotes = noteBox.values.toList();

    if (query.isEmpty) {
      return allNotes;
    }

    final lowerCaseQuery = query.toLowerCase();
    return allNotes.where((note) {
      final title = note.title?.toLowerCase() ?? '';
      final content = note.content?.toLowerCase() ?? '';
      return title.contains(lowerCaseQuery) || content.contains(lowerCaseQuery);
    }).toList();
  }
}

class SearchResultsView extends StatelessWidget {
  final List<NoteModel> results;

  const SearchResultsView({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final note = results[index];
        return ListTile(
          title: Text(note.title ?? ''),
          subtitle: Text(note.content ?? ''),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteResultPage(note: note),
              ),
            );
          },
        );
      },
    );
  }
}
