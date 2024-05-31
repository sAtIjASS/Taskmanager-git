import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sf_p/NewApp/Newappmainapi.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyAppnewsapp());
}

// It is a list that stores like list data of the news
RxList<dynamic> datastoreoflike = [].obs;

// It is the list that contains the data of the like
RxList<dynamic> likedata = [].obs;

RxList<dynamic> storelikedata = [].obs;

class MyAppnewsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
TextEditingController _searchController = TextEditingController();
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NewsList(),
    LikeScreen(storelikedata: storelikedata),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'News App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Liked',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),          SizedBox(height: 16), // Space between the container and ListView
          Expanded(
            child: FutureBuilder(
              future: getdataofnew(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length, // Number of items in the list
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "TITLE :-  ${snapshot.data![index].title}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 13),
                              Card(
                                elevation: 5,
                                child: Container(
                                  width: 300,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 10,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ) // changes position of shadow
                                      ],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${snapshot.data![index].urlToImage == null ? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" : snapshot.data![index].urlToImage}"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(height: 13),
                              Text(
                                "CONTENT :-  ${snapshot.data![index].content}",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              Text(
                                "DESCRIPTION :-  ${snapshot.data![index].description == null ? " Not Mentioned" : snapshot.data![index].description}",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              Text(
                                "DATE when Published :-  ${snapshot.data![index].publishedAt}",
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              Text(
                                "SOURCE :-  ${snapshot.data![index].source.name}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              Text(
                                "AUTHOR :-  ${snapshot.data![index].author == null ? " Not Mentioned" : snapshot.data![index].author}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              Text(
                                "SOURCE-ID :-  ${snapshot.data![index].source.id == null ? " Not Mentioned" : snapshot.data![index].author}",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Divider(color: Colors.black),
                              InkWell(
                                onTap: () {
                                  String store = snapshot.data![index].url;
                                  calltheurl(store);
                                },
                                child: Text(
                                  "Link :-  ${snapshot.data![index].url == null ? " Not Mentioned" : snapshot.data![index].url}",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                children: [
                                  Center(
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.black),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ShowNewDetails(
                                                url: snapshot.data![index].url == null ? "Not Available" : snapshot.data![index].url,
                                                urlToImage: snapshot.data![index].urlToImage == null ? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" : snapshot.data![index].urlToImage,
                                                content: snapshot.data![index].content == null ? "Not Available" : snapshot.data![index].content,
                                                description: snapshot.data![index].description == null ? "Not Available" : snapshot.data![index].description,
                                                publishedAt: snapshot.data![index].publishedAt == null ? "Not Available" : snapshot.data![index].publishedAt,
                                                title: snapshot.data![index].title == null ? "Not Available" : snapshot.data![index].title,
                                                author: snapshot.data![index].author == null ? "Not Available" : snapshot.data![index].author,
                                                source: snapshot.data![index].source.name == null ? "Not Available" : snapshot.data![index].source.name,
                                                sourceid: snapshot.data![index].source.id == null ? "Not Available" : snapshot.data![index].source.name,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "See Details",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                  SizedBox(width: 30),
                                  InkWell(
                                      onTap: () {
                                        // The data store in like list
                                        storelikedata.add({
                                          "url": snapshot.data![index].url == null ? "Not Available" : snapshot.data![index].url,
                                          "urlToImage": snapshot.data![index].urlToImage == null ? "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg" : snapshot.data![index].urlToImage,
                                          "content": snapshot.data![index].content == null ? "Not Available" : snapshot.data![index].content,
                                          "description": snapshot.data![index].description == null ? "Not Available" : snapshot.data![index].description,
                                          "publishedAt": snapshot.data![index].publishedAt == null ? "Not Available" : snapshot.data![index].publishedAt,
                                          "title": snapshot.data![index].title == null ? "Not Available" : snapshot.data![index].title,
                                          "author": snapshot.data![index].author == null ? "Not Available" : snapshot.data![index].author,
                                          "source": snapshot.data![index].source.name == null ? "Not Available" : snapshot.data![index].source.name,
                                          "sourceid": snapshot.data![index].source.id == null ? "Not Available" : snapshot.data![index].source.name,
                                        });
                                        if (likedata[index] == 0) {
                                          likedata[index] = 1;
                                          Get.snackbar(
                                              "Thanks ",
                                              "Thanks for your feedback",
                                              duration: Duration(milliseconds: 1000),
                                              snackPosition: SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor: Colors.black);
                                        } else {
                                          likedata[index] = 0;
                                          Get.snackbar(
                                              "Thanks ",
                                              "Thanks for your feedback",
                                              duration: Duration(milliseconds: 1000),
                                              snackPosition: SnackPosition.BOTTOM,
                                              colorText: Colors.white,
                                              backgroundColor: Colors.black);
                                        }
                                      },
                                      child: like(index)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

// This is the code responsible for the link functionality
Widget like(index) {
  likedata.insert(index, 0);

  return Obx(() => Icon(
    Icons.thumb_up,
    size: 30,
    color: likedata[index] == 1 ? Colors.blue : Colors.black,
  ));
}

// This is for the URL LAUNCHER FOR THE WEBSITE
void calltheurl(String store) async {
  launchUrl(Uri.parse("$store"), mode: LaunchMode.externalApplication);
}

// This is another class which is responsible for showing the news when the user clicks on the button
class ShowNewDetails extends StatelessWidget {
  final dynamic url;
  final dynamic urlToImage;
  final dynamic content;
  final dynamic description;
  final dynamic publishedAt;
  final dynamic title;
  final dynamic author;
  final dynamic source;
  final dynamic sourceid;
  const ShowNewDetails({
    Key? key,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.author,
    required this.source,
    required this.sourceid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(urlToImage),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'By $author, $publishedAt',
                    style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Source: $source',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      calltheurl(url);
                    },
                    child: Text('Read Full Article'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This is the like screen
class LikeScreen extends StatelessWidget {
  final RxList<dynamic> storelikedata;
  LikeScreen({Key? key, required this.storelikedata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liked Articles'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: storelikedata.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(storelikedata[index]['urlToImage']),
                    SizedBox(height: 8),
                    Text(
                      storelikedata[index]['title'],
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'By ${storelikedata[index]['author']}, ${storelikedata[index]['publishedAt']}',
                      style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 8),
                    Text(
                      storelikedata[index]['content'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      storelikedata[index]['description'],
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Source: ${storelikedata[index]['source']}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Source ID: ${storelikedata[index]['sourceid']}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Divider(color: Colors.black),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
