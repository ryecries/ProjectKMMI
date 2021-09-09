import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends SearchDelegate<String> {
  List<String> searchHistory = [];

  void addSearchHistory(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchHistory = prefs.getStringList('searchHistory') ?? [];
    searchHistory.insert(0, value);
    await prefs.setStringList('searchHistory', searchHistory);
  }

  void getSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchHistory = prefs.getStringList('searchHistory') ?? [];
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != '') addSearchHistory(query);
    return Center(
      child: Text(
        'No Result',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    getSearchHistory();
    final count = searchHistory.length > 10 ? 10 : searchHistory.length;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.history),
          title: Text(searchHistory.elementAt(index)),
          trailing: Icon(Icons.north_west),
        );
      },
    );
  }
}
