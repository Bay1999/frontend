import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/api/getFoto.dart';

class FotoKekeringan extends StatefulWidget {
  @override
  _FotoKekeringanState createState() => _FotoKekeringanState();
}

class _FotoKekeringanState extends State<FotoKekeringan> {
  GetFoto getHome;
  @override
  void initState() {
    getHome = GetFoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GetFoto().getFoto({"type": "1", "bencana": "2"}).then(
        (value) => print("value: $value"));

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Foto Kekeringan'),
        ),
        body: FutureBuilder(
          future: getHome.getFoto({"type": "1", "bencana": "2"}),
          builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                    "Something wrong with message: ${snapshot.error.toString()}"),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Data> profiles = snapshot.data;
              return _buildListView(profiles);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildListView(List<Data> profiles) {
    return profiles.length != 0
        ? RefreshIndicator(
            child: ListView.builder(
              itemBuilder: (context, index) {
                Data profile = profiles[index];
                return Container(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Card(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  alignment: Alignment.bottomCenter,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(6),
                                          bottomLeft: Radius.circular(6))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            profile.gambar,
                                            height: 310,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          )),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      ExpandablePanel(
                                        header: Text(profile.namagaleri),
                                        collapsed: Text(
                                          profile.keterangan,
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: profiles.length,
            ),
            onRefresh: () => getHome.getFoto({"type": "1", "bencana": "2"}),
          )
        : Center(child: CircularProgressIndicator());
  }
}
