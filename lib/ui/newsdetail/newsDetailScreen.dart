import 'package:flutter/material.dart';
import 'package:swdprojectbackup/ui/blank/blankScreen.dart';
import 'package:swdprojectbackup/ui/home/homeScreen.dart';
import 'package:swdprojectbackup/ui/news/newsListViewModel.dart';
import 'package:swdprojectbackup/ui/news/newsScreen.dart';
// import 'package:swdprojectbackup/ui/profile/profileScreen.dart';
import 'package:provider/provider.dart';
import 'package:swdprojectbackup/ui/newsdetail/newsDetailViewModel.dart';

class NewsDetailScreen extends StatelessWidget {
  final int idNews;
  NewsDetailScreen({Key key, @required this.idNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OJT PROJECT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => NewsListViewModel(),
          )
        ],
        child: NewsDetailPage(idNews: idNews),
      )
    );
  }
}

class NewsDetailPage extends StatefulWidget {
  final int idNews;
  NewsDetailPage({Key key, @required this.idNews}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NewsDetailPageState(idNews);
  }

}

class NewsDetailPageState extends State<NewsDetailPage> {
  final int idNews;
  NewsDetailPageState(this.idNews);

  @override
  void initState() {
    Provider.of<NewsDetailViewModel>(context,listen: false).getNewsDetailById(idNews);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<NewsDetailViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back,color: Colors.white),
            onPressed: (){
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
              );
            }
        ),

      ),
      body: viewModel.loadingStatus ? CircularProgressIndicator() : _newsDetailViews(),
    );
  }

  Widget _newsDetailViews() {
    var viewModel = Provider.of<NewsDetailViewModel>(context);
    return Column(
      children: <Widget>[
        Text('Deliver features faster'),
      ],
    );
  }

}

