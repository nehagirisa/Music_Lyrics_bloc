import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_bloc/Bloc/Track/track_bloc.dart';
import 'package:music_app_bloc/Models/Music.dart';
import 'package:music_app_bloc/Screens/Lyricsscreen.dart';

class DetailScreen extends StatefulWidget {
  TrackList trackList;
  DetailScreen(this.trackList);
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late TrackBloc trackBloc;

  @override
  void initState() {
    trackBloc = BlocProvider.of<TrackBloc>(context);
    trackBloc.add(Fetchtrack(trackid: (widget.trackList.track.trackId)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackState>(
      builder: (context, state) {
        if (state is Trackloding) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TrackLoded) {
          print(TrackLoded());
          var songlist = state.responcesong;
          return Container(
            child: LyricsScreen(widget.trackList),
          );
        }
        return Container();
      },
    );
  }
}
