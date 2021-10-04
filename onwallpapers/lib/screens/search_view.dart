import 'package:flutter/material.dart';

class WallpaperSearch extends SearchDelegate<String> {
  final List<String> wallpapers;
  List<String> filteredwallpapers = [];
  WallpaperSearch({this.wallpapers});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(
        primaryColor: Color(0xff323639),
        accentColor: Colors.blue,
        canvasColor: Colors.white,
        primaryIconTheme: IconThemeData(color: Colors.black),
        hintColor: Theme.of(context).primaryColor,
        textTheme: TextTheme(
          headline6: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ));
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).accentColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Theme.of(context).canvasColor,
              ),
            ),
            Text(
              'Enter a wallpaper to search.',
              style: TextStyle(color: Theme.of(context).canvasColor),
            )
          ],
        )),
      );
    } else {
      filteredwallpapers = [];
      getFilteredList(wallpapers);
      if (filteredwallpapers.length == 0) {
        return Container(
          color: Theme.of(context).primaryColorDark,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Theme.of(context).canvasColor,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Theme.of(context).canvasColor),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: filteredwallpapers.length == null
                ? 0
                : filteredwallpapers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.wallpaper,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  filteredwallpapers[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  close(context, filteredwallpapers[index]);
                },
              );
            },
          ),
        );
      }
    }
  }

  List<String> getFilteredList(List<String> wallpaper) {
    for (int i = 0; i < wallpaper.length; i++) {
      if (wallpaper[i].toLowerCase().startsWith(query)) {
        filteredwallpapers.add(wallpaper[i]);
      }
    }
    return filteredwallpapers;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Container(
        color: Theme.of(context).primaryColor,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              height: 50,
              child: Icon(
                Icons.search,
                size: 50,
                color: Theme.of(context).primaryColor, //accentColor
              ),
            ),
            Text(
              'Enter a wallpaper to search.',
              style: TextStyle(color: Theme.of(context).accentColor),
            )
          ],
        )),
      );
    } else {
      filteredwallpapers = [];
      getFilteredList(wallpapers);
      if (filteredwallpapers.length == 0) {
        return Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 50,
                height: 50,
                child: Icon(
                  Icons.sentiment_dissatisfied,
                  size: 50,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Text(
                'No results found',
                style: TextStyle(color: Theme.of(context).accentColor),
              )
            ],
          )),
        );
      } else {
        return Container(
          color: Theme.of(context).primaryColor,
          child: ListView.builder(
            itemCount: filteredwallpapers.length == null
                ? 0
                : filteredwallpapers.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(
                  Icons.wallpaper,
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  filteredwallpapers[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Theme.of(context).accentColor),
                ),
                onTap: () {
                  close(context, filteredwallpapers[index]);
                },
              );
            },
          ),
        );
      }
    }
  }
}
