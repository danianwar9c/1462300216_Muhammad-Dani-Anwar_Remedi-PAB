import 'package:flutter/material.dart';

import '../models/article_model.dart';

import '../services/api_service.dart';

import '../widgets/article_card.dart';

import 'favorite_page.dart';

import 'notification_page.dart';

import 'profile_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override

  State<HomePage> createState() =>

      _HomePageState();

}

class _HomePageState

extends State<HomePage> {

  int currentIndex = 0;

  Widget dashboard(){

    return FutureBuilder<List<Article>>(

      future:

      ApiService().getArticles(),

      builder:(context,snapshot){

        if(snapshot.connectionState

        == ConnectionState.waiting){

          return const Center(

            child:

            CircularProgressIndicator(),

          );

        }

        if(snapshot.hasError){

          return const Center(

            child: Text(

              'Terjadi Error',

            ),

          );

        }

        final data = snapshot.data!;

        return ListView.builder(

          itemCount:data.length,

          itemBuilder:(context,index){

            return ArticleCard(

              article:data[index],

            );

          },

        );

      },

    );

  }

  @override

  Widget build(BuildContext context) {

    List pages=[

      dashboard(),

      const FavoritePage(),

      const NotificationPage(),

      const ProfilePage(),

    ];

    return Scaffold(

      appBar: AppBar(

        title: const Text(

          'SpaceNews Core',

        ),

      ),

      body: pages[currentIndex],

      bottomNavigationBar:

      BottomNavigationBar(

        currentIndex:

        currentIndex,

        onTap:(index){

          setState(() {

            currentIndex=index;

          });

        },

        items: const [

          BottomNavigationBarItem(

            icon: Icon(

              Icons.home,

            ),

            label:'Home',

          ),

          BottomNavigationBarItem(

            icon: Icon(

              Icons.favorite,

            ),

            label:'Favorite',

          ),

          BottomNavigationBarItem(

            icon: Icon(

              Icons.notifications,

            ),

            label:'Notification',

          ),

          BottomNavigationBarItem(

            icon: Icon(

              Icons.person,

            ),

            label:'Profile',

          ),

        ],

      ),

    );

  }

}