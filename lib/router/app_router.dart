import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/cubit/news_cubit.dart';
import 'package:news_app/constants/strings.dart';
import 'package:news_app/data_layer/model/news_model.dart';
import 'package:news_app/data_layer/service/news_service.dart';
import 'package:news_app/presentation_layer/details_screens/general_details.dart';
import 'package:news_app/presentation_layer/details_screens/health_details.dart';
import 'package:news_app/presentation_layer/details_screens/sports_details.dart';

import 'package:news_app/presentation_layer/screens/home_screen.dart';


class AppRouter {

  Route? generateRoute(RouteSettings settings){
    switch (settings.name) {
      case homeScreen :
      return MaterialPageRoute(builder: (_)=>BlocProvider(
        create: (BuildContext context) => NewsCubit(NewsService()),
        child:const HomeScreen(),
      ));
      
      case generalScreen:
      final generalNes=settings.arguments as Articles;
      return MaterialPageRoute(builder: (_)=>BlocProvider(
        create: (context) => NewsCubit(NewsService()),
        child: GenralDetails(articles: generalNes,),
      ));

      case sportsScreen:
      final sportsNews=settings.arguments as Articles;
      return MaterialPageRoute(builder: (_)=>BlocProvider(create: (BuildContext contest)=>NewsCubit(NewsService()),
      child: SportsDetaild(articles: sportsNews,) ,));

      case healthScreen:
      final healthNews=settings.arguments as Articles;
      return MaterialPageRoute(builder: (_)=>BlocProvider(
        create: (context) => NewsCubit(NewsService()),
        child: HealthDeatails(articles: healthNews,),
      ));
  }
}
}