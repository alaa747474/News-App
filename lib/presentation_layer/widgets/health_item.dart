import 'package:flutter/material.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data_layer/model/news_model.dart';

class HealthItem extends StatelessWidget {
  const HealthItem({ Key? key,required this.articles }) : super(key: key);
    final errorImage='https://cdn.dribbble.com/users/251873/screenshots/9288094/13539-sign-for-error-or-explanation-alert.gif';
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return  InkWell(onTap: (){
      Navigator.pushNamed(context, healthScreen,arguments: articles);
    },
      child: Container(margin:const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.grey.shade800.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)
            ),
            width: MediaQuery.of(context).size.width,
            height: 170,
            child:Row(
              children: [
                Container(
                  margin:const EdgeInsets.only(right: 10,left:10),
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: articles.urlToImage!=null?NetworkImage('${articles.urlToImage}'):NetworkImage(errorImage),fit: BoxFit.cover)
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25,right: 15,bottom: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(articles.title.toString(),style: TextStyle(color: Colors.grey[200]),overflow: TextOverflow.visible,textDirection: TextDirection.rtl,),
                        Text(articles.publishedAt.toString(),style: TextStyle(color: Colors.grey[600]),overflow: TextOverflow.visible,textDirection: TextDirection.ltr,)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}