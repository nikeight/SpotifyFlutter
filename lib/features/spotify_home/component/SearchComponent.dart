import 'package:flutter/material.dart';
import 'package:praxis_flutter/models/SuggestionsUiModel.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: MySearchCustomDelegate());
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16),
            shape: BoxShape.rectangle),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.search),
            SizedBox(width: 20),
            Text("Search")
          ],
        ),
      ),
    );
  }
}

class MySearchCustomDelegate extends SearchDelegate {
  List<String> searchResult = [
    "Mera Yaar",
    "The Search",
    "Miss the Rage",
    "Jane woh Kaise log the",
    "Aao Chalein",
  ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Take User to the Home Screen
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(
      query,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResult.where((element) {
      final String result = element.toLowerCase();
      final String input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final currentSuggestion = suggestions[index];
          return ListTile(
            title: Text(currentSuggestion),
            onTap: () {
              query = currentSuggestion;
              showResults(context);
            },
          );
        });
  }
}
