import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniproject/provider/articleprovider.dart';
import 'package:miniproject/style.dart';
import 'package:miniproject/widget/custombutton.dart';
import 'package:miniproject/widget/imageutils.dart';
import 'package:miniproject/widget/menu.dart';
import 'package:miniproject/widget/popupoption.dart';

class CreateArticlePage extends StatefulWidget {
  const CreateArticlePage({Key? key}) : super(key: key);

  @override
  State<CreateArticlePage> createState() => _ArticleBaruPageState();
}

class _ArticleBaruPageState extends State<CreateArticlePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _title = TextEditingController();
  TextEditingController _body = TextEditingController();
  File? banner;
  String? _selectedCategory;

  late ArticleProvider _articleProvider;

  final List<String> categories = [
    'Academy Home',
    'IT Camp',
    'Internship',
    'Mengajar'
  ];

  @override
  void initState() {
    _articleProvider = new ArticleProvider();
    super.initState();
  }

  @override
  void dispose() {
    _title.dispose();
    _body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/metrodata.png",
          width: 150,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
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
        padding: EdgeInsets.all(20),
        child: Card(
          margin: EdgeInsets.all(8.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Membuat Artikel Baru",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Inter"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _title,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Judul",
                      hintStyle: Styles.inputTextHintDefaultTextStyle,
                      filled: true,
                      fillColor: Color.fromRGBO(249, 250, 251, 1)),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _body,
                  maxLines: 8,
                  maxLength: 180,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Tulis Postingan",
                      hintStyle: Styles.inputTextHintDefaultTextStyle,
                      filled: true,
                      fillColor: Color.fromRGBO(249, 250, 251, 1)),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Upload Gambar Banner',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Styles.lightgrey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // tempat gambar
                          banner != null
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Image.file(
                                    banner!,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Text('no file'),
                          IconButton(
                            padding: EdgeInsets.all(8),
                            color: Color(0xffF7F7FC),
                            onPressed: () async {
                              await ImageUtils.pickImage(context,
                                  (File selectedImage) {
                                // Handle the selected image
                                setState(() {
                                  banner = selectedImage;
                                });
                              });
                            },
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(209, 213, 219, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      hintText: "Kategori",
                      hintStyle: Styles.inputTextHintDefaultTextStyle,
                      filled: true,
                      fillColor: Color.fromRGBO(249, 250, 251, 1)),
                  style: Styles.inputTextDefaultTextStyle,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    // Checkbox(
                    //   value: _notif,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _notif = value!;
                    //     });
                    //   },
                    //   shape: const RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(3.0))),
                    // ),
                    // Text("Kirim notifikasi balasan topik anda",
                    //     style: Styles.detailTextStyle),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CustomButton(
                    style: TextStyle(
                      color: Styles.blue,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w500,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    label: "Batal",
                    bColor: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CustomButton(
                    onPressed: () {
                      PopupOption.alertDialog(context,
                          message: "Are you sure the article was created?",
                          onPressedNo: () {
                        Navigator.pop(context);
                      }, onPressedYes: () {
                        print("object");
                        onCreate(context);
                      });
                    },
                    label: "Post",
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  onCreate(BuildContext context) async {
    print("object");

    dynamic resultupload = await _articleProvider.uploadarticleimage(banner!);
    print(resultupload["data"]);
    dynamic resultcreate = await _articleProvider.createarticle(
        _title.text,
        _body.text,
        resultupload["data"],
        resultupload["data"],
        _selectedCategory!);
    if (resultcreate != null && resultcreate['message'] == "Success") {
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/article');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(resultcreate["message"]),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
