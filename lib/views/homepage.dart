import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/services/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "DENS",
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
            Text(
              "NEWS",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w800),
            )
          ]),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTiles(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              )
            ],
          ),
        ));
  }
}

class CategoryTiles extends StatelessWidget {
  final image, categoryName;
  const CategoryTiles({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: Stack(
        children: [
          Image.asset(
            image,
            width: 120,
            height: 60,
            
          ),
        ],
      ),
    );
  }
}
