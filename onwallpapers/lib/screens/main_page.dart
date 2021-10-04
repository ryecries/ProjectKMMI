import 'package:onwallpapers/screens/wallpaper.dart';
import 'package:onwallpapers/utils/widgets.dart';
import 'package:onwallpapers/animations/FadeAnimation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MainBody extends StatelessWidget {
  final List<String> _trendingImages = [
    'https://wallpapercave.com/wp/wp4013111.png?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260',
    'https://images2.alphacoders.com/104/thumb-1920-1041382.png?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
        'https://images.alphacoders.com/108/thumb-1920-1086194.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
  ];
  final List<String> _popularImages = [
    'https://wallpapercave.com/uwp/uwp1458031.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://wallpapercave.com/wp/wp9990695.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
    'https://wallpapercave.com/wp/wp9985706.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ShowMore(text: 'Trending', onTap: () {}),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                height: 200.0,
              ),
              items: _trendingImages.map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WallpaperPage(
                                          heroId: 'trending$index',
                                          imageUrl: index,
                                          themeData: _themeData,
                                        )));
                          },
                          child: Hero(
                            tag: 'trending$index',
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage(
                                  image: NetworkImage(index),
                                  fit: BoxFit.cover,
                                  placeholder:
                                      AssetImage('assets/images/loading.gif'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(
                      1, makeCategory(isActive: true, title: 'Popular')),
                  FadeAnimation(
                      1.2, makeCategory(isActive: false, title: 'Game')),
                  FadeAnimation(
                      1.3, makeCategory(isActive: false, title: 'Anime')),
                  FadeAnimation(
                      1.4, makeCategory(isActive: false, title: 'Dessert')),
                  FadeAnimation(
                      1.5, makeCategory(isActive: false, title: 'City')),
                ],
              ),
            ),
            ShowMore(text: '\nPopular', onTap: () {}),
            ListView.builder(
              itemCount: _popularImages.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WallpaperPage(
                                    heroId: 'popular$index',
                                    imageUrl: _popularImages[index],
                                    themeData: _themeData,
                                  )));
                    },
                    child: Hero(
                      tag: 'popular$index',
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage(
                            image: NetworkImage(_popularImages[index]),
                            fit: BoxFit.cover,
                            placeholder:
                                AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget makeCategory({isActive, title}) {
  return AspectRatio(
    aspectRatio: isActive ? 3 : 2.5 / 1,
    child: Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue[700] : Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Align(
        child: Text(
          title,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[500],
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100),
        ),
      ),
    ),
  );
}
