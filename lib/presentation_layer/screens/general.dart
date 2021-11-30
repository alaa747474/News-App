import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/cubit/news_cubit.dart';
import 'package:news_app/data_layer/model/news_model.dart';

import 'package:news_app/presentation_layer/widgets/each_item.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  late List<Articles> genralNews;
  bool isSearching = false;
  List<Articles> searchedItems = [];
  final searchController = TextEditingController();
  Widget loading() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.white,
    ));
  }

 

  Widget emptySearch(){
    return Padding(
            padding: const EdgeInsets.only(top: 100,),
            child: Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 40.0,
                ),
                child: Column(
                  children: [
                    Icon(Icons.search_off,color: Colors.grey[200],size: 120,),
                    const SizedBox(height: 50,),
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

  Widget searchField() {
    return TextField(
      style:const TextStyle(color: Colors.white,fontSize: 18),
      cursorColor: Colors.blue[800],
      cursorHeight: 30,
      controller: searchController,
      decoration: InputDecoration(
        
        hintText: 'General News ...',
        hintStyle: TextStyle(color: Colors.grey[500],fontSize: 18),
        
            
        border: InputBorder.none,
      ),
      onChanged: (elNewsEllyH3mlSearch3leh) {
        addSearchNewsToSearchedItems(elNewsEllyH3mlSearch3leh);
      },
    );
  }

  List<Widget>appBarActions(){
    if (isSearching) {
      return[
         IconButton(
                  onPressed: () {
                    clearSearch();
                    stopSearch();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey[500],
                  )),
      ];
    } else {
      return[IconButton(
                  onPressed: () {
                    startSearch();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey[500],
                  )),];
    }
  }

  void addSearchNewsToSearchedItems(elNewsEllyH3mlSearch3leh) {
    searchedItems = genralNews
        .where((element) =>
            element.title!.toLowerCase().contains(elNewsEllyH3mlSearch3leh))
        .toList();
    setState(() {});
  }

 

  void startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

 void clearSearch() {
    setState(() {
      searchController.clear();
    });
  }

  void stopSearch() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  Widget myhome() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           
          
          searchController.text.isNotEmpty&&searchedItems.isEmpty?Container():const Padding(
             padding: EdgeInsets.only(left: 15,right: 15,top: 25,bottom: 5),
             child: Text('Breaking News',style: TextStyle(color: Colors.white,fontSize: 30),),
           ),
          searchController.text.isNotEmpty&&searchedItems.isEmpty? emptySearch():listOfNews(),
        ],
      ),
    );
  }

  Widget listOfNews() {
    return ListView.builder(
        itemCount: searchController.text.isEmpty
            ? genralNews.length
            : searchedItems.length,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return EachItem(
            articles: searchController.text.isEmpty
                ? genralNews[index]
                : searchedItems[index],
          );
        });
  }

  Widget buildBloc() {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        if (state is GeneralNews) {
          genralNews = (state).gneralNews;
          return myhome();
        } else {
          return loading();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsCubit>(context).getGeneralNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        leading: isSearching?BackButton(color: Colors.grey[500],):null,
        actions: appBarActions(),
        backgroundColor: Colors.grey.shade800.withOpacity(0.5),
        title:isSearching?searchField(): Text('General News ...',style: TextStyle(color: Colors.grey[500]),),
      ),
      backgroundColor: Colors.grey.shade900,
      body: buildBloc(),
    );
  }
}
