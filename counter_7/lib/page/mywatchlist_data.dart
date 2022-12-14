import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlist_page.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class MyWatchListDataPage extends StatelessWidget {
  const MyWatchListDataPage({ super.key, required this.watchList });

  final MyWatchList watchList;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: const Text('Detail'),
          ),
          drawer: Drawer(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('counter_7'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Tambah Budget'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyFormPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('Data Budget'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyDataPage()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text('My Watchlist'),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                      );
                    },
                  ),
                ],
              ),
          ),
          body: Container( 
            margin: const EdgeInsets.fromLTRB(5, 10, 5, 15),
            child: Stack(
              children: [
                ListView(
                  children: [
                    Center(
                      child:Text(
                        watchList.fields.itemTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        )
                      )
                    ),                  
                    const SizedBox(height: 8,),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          height: 1.9,
                        ),
                        
                        children: [
                          const TextSpan(text: 'Release Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: DateFormat.yMMMd().format(watchList.fields.releaseDate)),

                          const TextSpan(text: '\nRating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${watchList.fields.rating.toString()}/5'),

                          const TextSpan(text: '\nStatus: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: watchList.fields.itemWatched ? 'watched' : 'not watched'),

                          const TextSpan(text: '\nReview:\n', style: TextStyle(fontWeight: FontWeight.bold,)),
                          TextSpan(text: watchList.fields.itemReview, style: const TextStyle(height: 0)),
                        ],
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Back'),
                    ),
                  ),
                )
              ],
            ),
          )
      );
  }
}