import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:music_app_bloc/Models/Song.dart';
import 'package:music_app_bloc/Repository/SongRepo.dart';
part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongRepo songRepo;

  SongBloc({required this.songRepo}) : super(SongInitial());

  @override
  Stream<SongState> mapEventToState(
    SongEvent event,
  ) async* {
    if (event is FetchSong) {
      yield SongLoding();
      try {
        final Lyrics responcesong = await songRepo.getsong(event.songid);
        yield SongLoded(responcesong: responcesong);
      } catch (e) {
        print(e);
      }
    }
  }
}
