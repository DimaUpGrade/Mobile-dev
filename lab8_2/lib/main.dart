import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:intl/intl.dart' as intl;

class MyHttpOverride extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

Future<List<NewNote>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://kubsau.ru/api/getNews.php?key=6df2f5d38d4e16b5a923a6d4873e2ee295d0ac90'));
  return compute(parseNews, response.body);
}

List<NewNote> parseNews(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<NewNote>((json) => NewNote.fromJson(json)).toList();
}

class NewNote {
  final String activeFrom;
  final String title;
  final String previewText;
  final String previewPictureSrc;

  const NewNote({
    required this.activeFrom,
    required this.title,
    required this.previewText,
    required this.previewPictureSrc,
});

  factory NewNote.fromJson(Map<String, dynamic> json){
    return NewNote(
      activeFrom: json['ACTIVE_FROM'] as String,
      title: json['TITLE'] as String,
      previewText: json['PREVIEW_TEXT'] as String,
      previewPictureSrc: json['PREVIEW_PICTURE_SRC'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  const NewsList({Key? key, required this.news}) : super(key: key);
  
  final List<NewNote> news;
  
  @override
  Widget build(BuildContext context){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: double.infinity,
          child: Card(
            child: Column(
              children: [
                Image.network(news[index].previewPictureSrc),
                ListTile(
                  title: Text(news[index].title),
                  subtitle: Text(news[index].activeFrom),
                ),
                ListTile(
                  //Почему не работает Bidi???
                  title: Text(intl.Bidi.stripHtmlIfNeeded(news[index].previewText)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

void main() {
  HttpOverrides.global = MyHttpOverride();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Лента новостей КубГАУ'),
      ),
      body: FutureBuilder<List<NewNote>>(
          future: fetchPhotos(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError){
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            else if (snapshot.hasData){
              return NewsList(news: snapshot.data!);
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
    );
  }
}