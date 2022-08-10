import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app_bloc/screens/Homescreen.dart';
import 'package:music_app_bloc/bloc/Music/music_bloc.dart';
import 'package:music_app_bloc/bloc/Network/network_bloc.dart';
import 'package:music_app_bloc/bloc/Song/song_bloc.dart';
import 'package:music_app_bloc/bloc/Track/track_bloc.dart';
import 'package:music_app_bloc/repository/LyricsRepo.dart';
import 'package:music_app_bloc/repository/SongRepo.dart';
import 'package:music_app_bloc/repository/Trackdetailrepo.dart';
import 'package:music_app_bloc/screens/Homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 final  LyrucsImpl = LyricsImpl();

      // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
        BlocProvider(
          create: (context) => MusicBloc(lyricsRepo: LyricsImpl),
           child: Homescreen(),
        ),
        BlocProvider(
          create: (context) => TrackBloc(trackdetailRepo: TrackdetailImpl(), songRepo:Songimpl() ),
        ),
        BlocProvider(create: (context) => SongBloc(songRepo: Songimpl())),
         BlocProvider(create: (context) => NetworkBloc())
      ],
      child: MaterialApp(
        home: Homescreen(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        
      ),
    );
  }
}