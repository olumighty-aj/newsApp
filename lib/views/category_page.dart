import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/show_category.dart';
import 'package:newsapp/services/category_news.dart';
import 'package:newsapp/views/arrticle_page.dart';

class CategoryPage extends StatefulWidget {
  final String appBarTitle;
  const CategoryPage({super.key, required this.appBarTitle});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ShowCategoryModel> categorynews = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCatNews();
  }

  getCatNews() async {
    ShowCategoryNews newsCategory = ShowCategoryNews();
    await newsCategory.getCategoryNews(widget.appBarTitle.toLowerCase());
    categorynews = newsCategory.categorynews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.appBarTitle,
            style: const TextStyle(
                fontSize: 22,
                color: Colors.purple,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: categorynews.length,
              itemBuilder: (context, index) {
                return ShowCategory(
                    image: categorynews[index].urlToImage!,
                    desc: categorynews[index].description!,
                    title: categorynews[index].title!);
              }),
        ));
  }
}

class ShowCategory extends StatelessWidget {
  final String image, desc, title;
  const ShowCategory(
      {super.key,
      required this.image,
      required this.desc,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: Navigator.push(context, MaterialPageRoute(builder: (context)=> AritclceView(blogUrl: blogUrl)))
         child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 7,),
            Text(
              title,
              maxLines: 2,
              style: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
             // textAlign: TextAlign.center,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
