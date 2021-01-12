import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_box/video.controller.dart';
import 'package:video_box/video_box.dart';
import 'package:better_player/better_player.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class VideoKekeringan extends StatefulWidget {
  @override
  _VideoKekeringanState createState() => _VideoKekeringanState();
}

class _VideoKekeringanState extends State<VideoKekeringan> {
  List<VideoController> vcs = [];
  List dataSourceList = List<BetterPlayerDataSource>();
  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  @override
  void initState() {
    loadPositifData();
    super.initState();
    // for (var i = 0; i < 4; i++) {
    //   vcs.add(VideoController(source: VideoPlayerController.network(src1))
    //     ..initialize());
    // }
  }

  Future loadPositifData() async {
    final jsonResponse1 = await http.post(
        'https://mitigasi-bencana-api.herokuapp.com/api/apps/galeri',
        body: jsonEncode({"type": "2", "bencana": "1"}),
        headers: setHeaders());
    final myJson1 = json.decode(jsonResponse1.body);
    // print(myJson1);
    setState(() {
      for (Map n in myJson1) {
        print(n['gambar']);
        dataSourceList.add(
          BetterPlayerDataSource(
            BetterPlayerDataSourceType.network,
            n['gambar'],
          ),
        );
      }
    });
  }

  // @override
  // void dispose() {
  //   for (var vc in vcs) {
  //     vc.dispose();
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    if (dataSourceList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayerPlaylist(
            betterPlayerConfiguration: BetterPlayerConfiguration(),
            betterPlayerPlaylistConfiguration:
                BetterPlayerPlaylistConfiguration(),
            betterPlayerDataSourceList: dataSourceList),
      );
    }
  }
}
