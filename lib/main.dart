import 'package:flutter/material.dart';
import 'package:test_app_gallery/src/json_model.dart';
import 'package:test_app_gallery/src/theme.dart';
import 'package:test_app_gallery/src/values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: primeTheme(),
      home: MyHomePage(title: appBarTitleText),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<SomeImageList> someImageList;

  @override
  void initState() {
    someImageList = getImagesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<SomeImageList>(
          future: someImageList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.someImageList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          leading: Image.network(
                            snapshot.data.someImageList[index].urls.thumb,
                          ),
                          title: Text(
                              '${snapshot.data.someImageList[index].alt_description}'),
                          subtitle: Text(
                              '${snapshot.data.someImageList[index].user.name}'),
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ImageViewPage(
                                        title: snapshot
                                            .data
                                            .someImageList[index]
                                            .alt_description,
                                        url: snapshot.data.someImageList[index]
                                            .urls.full,
                                      )))),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                errorMessage,
                style: Theme.of(context).textTheme.bodyText1,
              ));
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}

class ImageViewPage extends StatelessWidget {
  final url;
  final title;

  ImageViewPage({this.title, this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Center(child: CircularProgressIndicator()),
          Center(child: Image.network(url))
        ]));
  }
}
