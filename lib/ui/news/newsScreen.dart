import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swdprojectbackup/ui/news/newsListViewModel.dart';
import 'package:swdprojectbackup/ui/newsdetail/newsDetailScreen.dart';
import 'package:swdprojectbackup/ui/newsdetail/newsDetailViewModel.dart';


class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    Provider.of<NewsListViewModel>(context,listen: false).topHeadlines();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    var listViewModel =  Provider.of<NewsListViewModel>(context);
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 40,
                right: 20,
                bottom: 40,
              ),
              child: Text (
                  'Hi, Test1, ${listViewModel.articlesList.length}',
                style: TextStyle(fontSize: 50.0),
              ),
            ),

            Expanded(

              child: DefaultTabController(
                length: 3,
                child: Scaffold(

                    appBar: AppBar(
                      backgroundColor: Colors.white70,
                      toolbarHeight: 50,
                      bottom: TabBar(
                        labelColor: Colors.black,
                        tabs: [
                          Tab(text: 'All'),
                          Tab(text: 'Your Saved'),
                          Tab(icon: Icon(Icons.search,color: Colors.black,)),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        _newsViews(),
                        Icon(Icons.directions_transit),
                        Icon(Icons.search),
                      ],
                    )
                ),
              ),
            ),
          ],
        )
    );
  }

  Widget _newsViews() {
    var listViewModel = Provider.of<NewsListViewModel>(context);
    return ListView.builder(
        itemCount: listViewModel.articlesList.length,
        itemBuilder: (context, index) {
          return _buildRow(
              listViewModel.articlesList[index].name
              + ' need '
              + listViewModel.articlesList[index].quantity.toString()
              + ' in '
              + listViewModel.articlesList[index].position,
              listViewModel.articlesList[index].id
          );
        }
    );
  }

  Widget _buildRow(String title,int id){
    return ListTile(
      title: Text(
        title + id.toString(),
        style: const TextStyle(fontSize: 18.0),
      ),
      trailing: new Icon(
        Icons.read_more,
        color: Colors.red,
      ),
      onTap: () {
        print('tap tap');
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => NewsDetailViewModel(),
                ),
              ],
              child: new NewsDetailScreen(idNews: id,)
          )),
        );
      },
    );
  }
}

