import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app_bloc/Models/Music.dart';
import 'package:music_app_bloc/Repository/LyricsRepo.dart';
import 'package:music_app_bloc/Repository/SongRepo.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  LyricsRepo lyricsRepo;
  late SongRepo songRepo;
  MusicBloc({required this.lyricsRepo}) : super(MusicInitial());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is Fetchmusic) {
      yield MusicLoding();
      try {
        final Music responseUsers = await lyricsRepo.gettrack();
        yield MusicLoded(responseUsers: responseUsers);
      } catch (e) {
        print(e);
      }
    }
  }
}
