// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data_layer/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthDeatails extends StatelessWidget {
   HealthDeatails({ Key? key,required this.articles }) : super(key: key);
  final Articles articles;
  var url =
      'https://cdn.dribbble.com/users/251873/screenshots/9288094/13539-sign-for-error-or-explanation-alert.gif';

       Widget nullDiscription() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(
                Icons.error_outline,
                color: Colors.grey[200],
                size: 35,
              ),
              const SizedBox(
                height: 5,
              ),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 20.0,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Some Thing Went Wrong',
                        textStyle: TextStyle(color: Colors.grey[200])),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override

 

  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.grey[200],
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: articles.urlToImage != null
                              ? NetworkImage('${articles.urlToImage}')
                              : NetworkImage(url),
                          fit: BoxFit.cover)),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        articles.title.toString(),
                        overflow: TextOverflow.visible,
                        maxLines: 7,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    articles.description != null
                        ? Text(
                            articles.description.toString(),
                            overflow: TextOverflow.visible,
                            maxLines: 7,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(color: Colors.grey[200]),
                          )
                        : nullDiscription()
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                await launch('${articles.url}');
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo[700]),
                child: const Center(
                  child: Text(
                    'Read More',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}