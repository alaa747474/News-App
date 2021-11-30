import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/data_layer/model/news_model.dart';
import 'package:news_app/data_layer/service/news_service.dart';
import 'package:news_app/presentation_layer/screens/general.dart';
import 'package:news_app/presentation_layer/screens/health.dart';
import 'package:news_app/presentation_layer/screens/sports.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(this.newsService) : super(NewsInitial());

    List screens = [const General(),  const Sports(), const Health()];
   int myIndex = 0;
   void changeIndex(int index){
     myIndex=index;
     emit(BottomNavState());
   }   

   
  List<Articles>sportsNews=[];
  List<Articles>healthNews=[];
  List<Articles>generalNews=[];
  final NewsService newsService;
   List<Articles>getSportsNews(){
     newsService.getAllNews('sports').then((sports) {
       emit(SportsNews(sports!));
       sportsNews=sports;
     });
       return sportsNews;
   }

   List<Articles>getHealthNews(){
     newsService.getAllNews('health').then((health) {
       emit(HealthNews(health!));
       healthNews=health;
     });
       return healthNews;
   }

   List<Articles>getGeneralNews(){
     newsService.getAllNews('general').then((genral) {
       emit(GeneralNews(genral!));
       generalNews=genral;
     });
     return generalNews;
   }


}
