import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gg/bloc/hh_bloc.dart';
import 'package:gg/fetch.dart';
import 'package:gg/model.dart';
// main method that runs the runApp.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    mList? listofitems;
    listofitems = load();
    return MaterialApp(
      // MaterialApp with debugShowCheckedModeBanner false and home
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        // Scaffold with appbar ans body.
        appBar: AppBar(
          title: Text('Simple Data Table'),
          actions: [
            IconButton(
                onPressed: () async {
                  // BlocProvider.of<HhBloc>(context).add(FecthData());
                  var ff = await fetch();
                  log(ff.toString());
                  listofitems = ff;
                },
                icon: Icon(Icons.interests_outlined))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: BlocBuilder<HhBloc, HhState>(
            builder: (context, state) {
              return DataTable(
                  // Datatable widget that have the property columns and rows.
                  columns: [
                    // Set the name of the column
                    DataColumn(
                      label: Text('ID'),
                    ),
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('LastName'),
                    ),
                    DataColumn(
                      label: Text('Age'),
                    ),
                  ], rows: [
                // Set the values to the columns
                DataRow(cells: [
                  DataCell(Text("${state.itemList.sName}")),
                  DataCell(Text("${listofitems!.iCreatedAt}")),
                  DataCell(Text("Anderson")),
                  DataCell(Text("18")),
                ]),
                DataRow(cells: [
                  DataCell(Text("2")),
                  DataCell(Text("John")),
                  DataCell(Text("Anderson")),
                  DataCell(Text("24")),
                ]),
              ]);
            },
          ),
        ),
      ),
    );
  }

  load() async {
    var ff = await fetch();
    log(ff.toString());
    return ff;
  }
}
