import 'package:miniproject/style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  final String imageUrl;

  final String postdate;
  final String jenispost;
  final String category;
  final String title;

  ArticleCard({
    required this.imageUrl,
    required this.title,
    required this.postdate,
    required this.category,
    required this.jenispost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0),
      elevation: 0, // Tingkat elevasi kartu
      // Margin di sekitar kartu
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageUrl, // URL gambar artikel
                  height: 190, // Tinggi gambar
                  width: 333, // Lebar gambar mengisi seluruh kartu
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    height: 190,
                    width: 333,
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                    ),
                  ), // Mengatur bagaimana gambar mengisi ruang yang tersedia
                ),
              ),
              Text(
                postdate,
                style: Styles.subheaderTextStyle,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Styles.Text16,
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // Button width
                        height: 20, // Button height
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(jenispost,
                              style: TextStyle(
                                color: Color.fromRGBO(30, 66, 159, 1),
                                fontSize: 6,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              )),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              disabledBackgroundColor:
                                  Color.fromRGBO(225, 239, 254, 1)),
                        ),
                      ),
                      Container(
                        // Button width
                        height: 20, // Button height
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text(category,
                              style: TextStyle(
                                color: Color.fromRGBO(205, 122, 18, 1),
                                fontSize: 6,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w400,
                              )),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              disabledBackgroundColor:
                                  Color.fromRGBO(254, 250, 236, 1)),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
