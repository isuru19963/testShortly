import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../bloc/shortenlinks_bloc.dart';
import '../../models/shortenlink_model.dart';

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final ShortenlinksBloc _newsBloc = ShortenlinksBloc();

  @override
  void initState() {
    _newsBloc.add(GetShortenLinkList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COVID-19 List')),
      // body: _buildListCovid(),
    );
  }

  // Widget _buildListCovid() {
  //   return Container(
  //     margin: EdgeInsets.all(8.0),
  //     child: BlocProvider(
  //       create: (_) => _newsBloc,
  //       child: BlocListener<ShortenLinkModel, ShortenlinksState>(
  //         listener: (context, state) {
  //           if (state is CovidError) {
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(
  //                 content: Text(state.message!),
  //               ),
  //             );
  //           }
  //         },
  //         child: BlocBuilder<ShortenlinksBloc, ShortenlinksState>(
  //           builder: (context, state) {
  //             if (state is ShortenlinksInitial) {
  //               return _buildLoading();
  //             } else if (state is ShortenlinksLoading) {
  //               return _buildLoading();
  //             } else if (state is ShortenlinksLoaded) {
  //               // return _buildCard(context, state.linkModel);
  //             } else if (state is CovidError) {
  //               return Container();
  //             } else {
  //               return Container();
  //             }
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildCard(BuildContext context, ShortenlinksBloc model) {
  //   return ListView.builder(
  //     itemCount: ,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         margin: EdgeInsets.all(8.0),
  //         child: Card(
  //           child: Container(
  //             margin: EdgeInsets.all(8.0),
  //             child: Column(
  //               children: <Widget>[
  //                 Text("Country: ${model.countries![index].country}"),
  //                 Text(
  //                     "Total Confirmed: ${model.countries![index].totalConfirmed}"),
  //                 Text("Total Deaths: ${model.countries![index].totalDeaths}"),
  //                 Text(
  //                     "Total Recovered: ${model.countries![index].totalRecovered}"),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  Widget _buildLoading() => Center(child: CircularProgressIndicator());
}