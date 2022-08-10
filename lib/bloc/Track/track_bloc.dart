import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:music_app_bloc/Models/Song.dart';
import 'package:music_app_bloc/Models/Trackdetail.dart';
import 'package:music_app_bloc/Repository/Trackdetailrepo.dart';
part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackdetailRepo trackdetailRepo;
   TrackdetailRepo songRepo;
  TrackBloc({required this.trackdetailRepo,required this.songRepo}) : super(TrackInitial());

  @override
  Stream<TrackState> mapEventToState(
    TrackEvent event,
  ) async* {
    if (event is Fetchtrack) {
      yield Trackloding();
      try {
        final Trackdetail responcetrack =
            await trackdetailRepo.gettrackdetail(event.trackid);
        // yield TrackLoded(responcetrack: responcetrack, responcesong: responcesong);
         final Lyrics responcesong = await songRepo.gettrackdetail(event.trackid);
       yield TrackLoded(responcetrack: responcetrack,responcesong: responcesong);
      } catch (e) {}
    }
  }
}
