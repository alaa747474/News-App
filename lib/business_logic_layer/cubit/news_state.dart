part of 'news_cubit.dart';


abstract class NewsState {}

class NewsInitial extends NewsState {}


class SportsNews extends NewsState{
  List<Articles>sportsNews;
  SportsNews(this.sportsNews); 
}

class HealthNews extends NewsState{
  List<Articles>healthNews;
  HealthNews(this.healthNews);
}
class GeneralNews extends NewsState{
  List<Articles>gneralNews;
  GeneralNews(this.gneralNews);
}

class BottomNavState extends NewsState{}