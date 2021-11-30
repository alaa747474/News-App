import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/cubit/news_cubit.dart';
import 'package:news_app/data_layer/model/news_model.dart';
import 'package:news_app/presentation_layer/widgets/health_item.dart';

class Health extends StatefulWidget {
  const Health({ Key? key }) : super(key: key);

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  late List<Articles>healthNews;
  final searchController=TextEditingController();
  late List<Articles>searchedList;


  emptySearch() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 100,
      ),
      child: Center(
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 40.0,
          ),
          child: Column(
            children: [
              Icon(
                Icons.search_off,
                color: Colors.grey[200],
                size: 120,
              ),
              const SizedBox(
                height: 50,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('No Results Found',
                      textStyle: TextStyle(color: Colors.grey[200])),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget search() {
    return Container(
      margin: const EdgeInsets.only(top: 20,left: 15, right: 15),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade800.withOpacity(0.5)),
      child: Center(
        child: TextField(
          style: const TextStyle(color: Colors.white, fontSize: 18),
          cursorColor: Colors.blue[800],
          cursorHeight: 30,
          controller: searchController,
          decoration: InputDecoration(
              prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  )),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      searchController.clear();
                    });
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey[500],
                  )),
              hintText: 'Search...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey[500], fontSize: 18)),
          onChanged: (value) {
            addToSearchedList(value);
          },
        ),
      ),
    );
  }
  void addToSearchedList(value){
    setState(() {
      searchedList=healthNews.where((element) => element.title!.toLowerCase().contains(value)).toList();
    });
  }


  Widget  myListViwe(){
    return ListView.builder(
      shrinkWrap: true,
      physics:const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount:searchController.text.isEmpty? healthNews.length:searchedList.length,
      itemBuilder: (context,index){
        return HealthItem(articles:searchController.text.isEmpty? healthNews[index]:searchedList[index]);
      });
  }

  Widget myHomeView(){
    return SingleChildScrollView(
      child: Column(
        children: [
          search(),
          searchController.text.isNotEmpty&&searchedList.isEmpty?emptySearch():myListViwe(),
        ],
      ),
    );
  }


  Widget progressIndicator(){
    return const Center(
      child:CircularProgressIndicator(
        color: Colors.white,
      )
    );
  }


   Widget buildBloc(){
     return BlocBuilder<NewsCubit, NewsState>(
       builder: (context, state) {
         if (state is HealthNews) {
           healthNews=(state).healthNews;
           return myHomeView();
         } else {
           return progressIndicator();
         }
       },
     ) ;
   }
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsCubit>(context).getHealthNews();
    return Scaffold(
    body: buildBloc(),
     appBar: AppBar(
        backgroundColor: Colors.grey.shade800.withOpacity(0.5),
        automaticallyImplyLeading: false,
        title: const Text(
          'Health News',
          style: TextStyle(color: Colors.white),
        ),
      ),
    backgroundColor: Colors.grey.shade900,
    );
  }
}