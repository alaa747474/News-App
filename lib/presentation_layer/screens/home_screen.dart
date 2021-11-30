

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic_layer/cubit/news_cubit.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: BlocProvider.of<NewsCubit>(context).screens[BlocProvider.of<NewsCubit>(context).myIndex],
           bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          
          currentIndex:BlocProvider.of<NewsCubit>(context).myIndex ,
          onTap: (index) {
            BlocProvider.of<NewsCubit>(context).changeIndex(index);
          },
          unselectedItemColor: Colors.grey[700],
          selectedItemColor: Colors.grey[200],
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sports_soccer_outlined,
                  size: 30,
                ),
                label: 'Sports'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_hospital,
                  size: 30,
                ),
                label: 'Health',backgroundColor: Colors.white),
          ]),
        );
      },
    );
  }
}
