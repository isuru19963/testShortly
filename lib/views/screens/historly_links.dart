import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../bloc/shortenlinks_bloc.dart';
import '../../models/shortenlink_model.dart';

class LinkHistory extends StatefulWidget {
  @override
  _LazyLoadingWithBlocState createState() => _LazyLoadingWithBlocState();
}

class _LazyLoadingWithBlocState extends State<LinkHistory> {
  ScrollController _scrollController = ScrollController();
  late final ShortenlinksBloc dataBloc = ShortenlinksBloc();
  late String copiedCode = '';

  @override
  void initState() {
    super.initState();

    //initial data load
    dataBloc.add(GetShortenLinkList());


  }

  void _getMoreData() {
    print("load more date...");
    dataBloc.add(GetShortenLinkListMore());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Your Link History",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder(
        bloc: dataBloc,
        builder: (context, state) {
          if (state is DataLoaded) {
            return ListView.builder(
              controller: _scrollController,
              // itemExtent: 80,
              itemBuilder: (context, i) {
                if (i == state.myList.length) {
                  //showing loader at the bottom of list
                  return Center(child: CircularProgressIndicator());
                }
                // return ListTile(
                //   title: Text(state.myList[i].shortenUrl),
                // );
                return Container(
                  height: 170,
                  child: Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    text: state.myList[i].url),
                              ),
                            ),
                            SizedBox(
                              child: IconButton(
                                onPressed: () async {
                                  await remove(state.myList[i].id);
                                  (context as Element).reassemble();
                                },
                                icon: SvgPicture.asset(
                                  'assets/Images/del.svg',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        new Divider(
                          color: Colors.black,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff2ACFCF)),
                                    text: state.myList[i].shortenUrl),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Row contents vertically,

                          children: [
                            Material(
                              elevation: 0,
                              borderRadius: BorderRadius.circular(8),
                              color: copiedCode == state.myList[i].id
                                  ? Color(0xff3B3054)
                                  : Color(0xff2ACFCF),
                              child: MaterialButton(
                                onPressed: () async {
                                  FlutterClipboard.copy(
                                          state.myList[i].shortenUrl)
                                      .then((value) {
                                    setState(() {
                                      copiedCode = state.myList[i].id;
                                    });

                                    final snackBar = SnackBar(
                                      content: Text('Copied to Clipboard'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {},
                                      ),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  });
                                },
                                height: 10.0,
                                minWidth: size.width * 0.6,
                                child: Text(
                                  copiedCode == state.myList[i].id
                                      ? "COPIED!"
                                      : "COPY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                  ),
                );
              },
              itemCount: state.myList.length,
            );
          }
          return Container();
        },
      ),
    );
  }

  remove(id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? shortenList = prefs.getString('shortenList');

    final List<ShortenLinkModel> linkHistory =
        ShortenLinkModel.decode(shortenList!);

    // loadMoreCount = initLoadCount;
    linkHistory.removeWhere((item) => item.id == id);

    // Encode and store data in SharedPreferences

    final String encodedData = json.encode(
      linkHistory
          .map<Map<String, dynamic>>((link) => ShortenLinkModel.toMap(link))
          .toList(),
    );
    print('done');
    await prefs.setString('shortenList', encodedData);
    setState(() {});
    (context as Element).reassemble();
    dataBloc.add(GetShortenLinkList());
  }
}
