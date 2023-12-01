import 'package:flutter/material.dart';
import 'package:miniproject/models/articlemodel.dart';
import 'package:miniproject/provider/articleprovider.dart';
import 'package:miniproject/style.dart';
import 'package:miniproject/widget/menu.dart';

class ArticleDetailPage extends StatefulWidget {
  final String articleId;

  const ArticleDetailPage({
    Key? key,
    required this.articleId,
  }) : super(key: key);
  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late ArticleProvider _articleProvider;
  Article? article;

  @override
  void initState() {
    _articleProvider = new ArticleProvider();
    fetchArticle();
    super.initState();
  }

  Future<void> fetchArticle() async {
    try {
      dynamic response =
          await _articleProvider.getarticledetail(widget.articleId);
      if (response != null && response['message'] == 'Success') {
        print("success");
        Map<String, dynamic> articleData = response['data'];
        setState(() {
          article = Article.fromJson(articleData);
        });
      } else {
        print("Error fetching article: Invalid response format");
        // Handle error appropriately, e.g., show an error message to the user
      }
    } catch (error) {
      print("Error fetching article: $error");
      // Handle error appropriately, e.g., show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          backgroundColor: Styles.whiteblue,
          key: scaffoldKey,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Image.asset(
              "assets/metrodataacademy.png",
              width: 150,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  print("object");
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeEndDrawer();
                    //close drawer, if drawer is open
                  } else {
                    scaffoldKey.currentState!.openEndDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                icon: Icon(
                  Icons.menu,
                  size: 30,
                ),
                color: Styles.black,
              )
            ],
          ),
          endDrawer: Menu(),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    // Button width
                    height: 20, // Button height
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          disabledBackgroundColor:
                              Color.fromRGBO(225, 239, 254, 1)),
                      child: Text("Artikel",
                          style: TextStyle(
                            color: Color.fromRGBO(30, 66, 159, 1),
                            fontSize: 10,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    // Button width
                    height: 20, // Button height
                    child: ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          disabledBackgroundColor:
                              Color.fromRGBO(254, 250, 236, 1)),
                      child: Text(article!.categories![0]["name"].toString(),
                          style: const TextStyle(
                            color: Color.fromRGBO(205, 122, 18, 1),
                            fontSize: 10,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    article!.title.toString(),
                    style: Styles.titlearticledetail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: Styles.detailTextStyle,
                              children: <TextSpan>[
                            TextSpan(text: "by "),
                            TextSpan(
                              text: article!.author!.name,
                              style: TextStyle(color: Styles.black),
                            ),
                            TextSpan(text: " in "),
                            TextSpan(text: "Mii")
                          ])),
                      Text(
                        article!.createdAt.toString(),
                        style: Styles.detailTextStyle,
                      ),
                      Text(
                        "${article!.counter} Views",
                        style: Styles.detailLinkTextStyle,
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        article!.imageUrl.toString(), // URL gambar artikel
                        height: 190, // Tinggi gambar
                        width: 333, // Lebar gambar mengisi seluruh kartu
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.green),
                              ),
                            );
                          }
                        },
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          // Handle error loading image
                          return Container(
                            color:
                                Colors.grey, // Warna latar belakang alternatif
                            height: 190,
                            width: 333,
                            child: Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                              ),
                            ),
                          );
                        },
                        // Mengatur bagaimana gambar mengisi ruang yang tersedia
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet",
                      style: Styles.detailTextStyle,
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      article!.body.toString(),
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(107, 114, 128, 1)),
                      textAlign: TextAlign.justify,
                    )),
              ])));
    }
  }
}
