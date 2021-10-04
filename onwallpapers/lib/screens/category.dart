import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final List<String> _category = ['Nature', 'Cars', 'Game', 'Planet', 'Ocean'];
  final List<String> _categoryImage = [
    'https://wallpapercave.com/wp/Clqad3A.jpg',
    'https://wallpapercave.com/wp/wp1845354.jpg',
    'https://wallpapercave.com/wp/wp4013111.png',
    'https://wallpapercave.com/uwp/uwp420679.jpeg',
    'https://i.pinimg.com/originals/00/aa/e7/00aae7cd6cbae92d0f5d00baab3fe289.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 2;
    return Container(
        color: Theme.of(context).primaryColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\nCategories',
                        style: Theme.of(context).textTheme.bodyText2),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: _width,
                            height: _width - 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(_categoryImage[index]),
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Text(_category[index],
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
