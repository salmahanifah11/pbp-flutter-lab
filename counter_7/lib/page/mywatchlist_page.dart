import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/mywatchlist_data.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({ super.key });

  @override
  _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {
    Future<List<MyWatchList>> fetchMyWatchList() async {
        var url = Uri.parse('https://pbp-tugas-app.herokuapp.com/mywatchlist/json');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        var data = jsonDecode(utf8.decode(response.bodyBytes));

        // melakukan konversi data json menjadi object MyWatchlist
        List<MyWatchList> listMyWatchList = [];
        for (var d in data) {
        if (d != null) {
            listMyWatchList.add(MyWatchList.fromJson(d));
        }
        }

        return listMyWatchList;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('My Watchlist'),
            ),
            drawer: Drawer(
                child: Column(
                  children: [
                    // Menambahkan clickable menu
                    ListTile(
                      title: const Text('counter_7'),
                      onTap: () {
                        // Route menu ke halaman utama
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Tambah Budget'),
                      onTap: () {
                        // Route menu ke halaman form
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyFormPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Data Budget'),
                      onTap: () {
                        // Route menu ke halaman data budget
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyDataPage()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('My Watchlist'),
                      onTap: () {
                        // Route menu ke halaman watchlist
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                        );
                      },
                    ),
                  ],
                ),
            ),
            body: FutureBuilder(
                future: fetchMyWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                    } else {
                    if (!snapshot.hasData) {
                        return Column(
                        children: const [
                            Text(
                            "Tidak ada watchlist :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index)=> InkWell(
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color:Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 2.0
                                      )
                                    ]
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(
                                        "${snapshot.data![index].fields.title}",
                                        style: const TextStyle(
                                        fontSize: 18.0,
                                        ),
                                    ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MyWatchListDataPage(watchList: snapshot.data[index]),
                                    ),
                                  );
                                },
                            )
                        );
                    }
                    }
                }
            )
        );
    }
}