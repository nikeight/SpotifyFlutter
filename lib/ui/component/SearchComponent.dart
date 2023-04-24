import 'package:flutter/material.dart';
import 'package:praxis_flutter/features/song_play/song_play_screen.dart';

/*
   Search Component : Delegates the work for a Search Screen
   Takes two Parameters :
   Param One : List of recent searches
   Param Two : Recent fetched Song List title.
   Todo : OnTouch Method on ListTitle to Open the `PlaySong` Screen.
   Todo : BetterWay of passing Data to the `Search Delegates`
   Todo : Improve Search Filter and usage of `FetchedSongTitleList`
 */

class SearchComponent extends StatelessWidget {
  final List<String>? recentSearchedCachedList;
  final List<String> fetchedSongTitleList;

  const SearchComponent(
      {Key? key,
      this.recentSearchedCachedList,
      required this.fetchedSongTitleList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
            context: context,
            delegate: MySearchCustomDelegate(
                recentSearchedCachedList, fetchedSongTitleList));
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
  final List<String>? recentSearchedCachedList;
  final List<String> fetchedSongTitleList;

  MySearchCustomDelegate(
      this.recentSearchedCachedList, this.fetchedSongTitleList);

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
    return const SongPlayScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = fetchedSongTitleList.where((element) {
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
