import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../api/exceptions.dart';
import '../../api/services.dart';
import '../../model/album_list.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc({required this.albumsRepo}) : super(AlbumsInitial()) {
    on<FetchAlbums>(_onFetchAlbums);
  }
  final AlbumsRepo albumsRepo;
  List<Album> albumsList = [];

   _onFetchAlbums(FetchAlbums event, Emitter<AlbumsState> emit) async{
    emit(AlbumsLoading());
    try {
      albumsList = await albumsRepo.getAlbumList();
      emit(AlbumsLoaded(albumsList));
    } on SocketException {
      emit(AlbumsListError(error: NoInternetException('No Internet')));
    } on HttpException {
      emit(AlbumsListError(error: NoInternetException('No Service Found')));
    } on FormatException {
      emit(AlbumsListError(
          error: NoInternetException('Invalid Response format')));
    } catch (e) {
      emit(
        AlbumsListError(error: UnknownException('Unknown Error')),
      );
    }
  }
}

// class MyBloc extends Bloc<MyEvent, MyState> {
//   MyBloc() : super(MyState.initial()) {
//     on<MyEvent>(_onEvent);
//   }

//   void _onEvent(MyEvent event, Emit<MyState> emit) async {
//     event.when(
//       a: () => emit(state.copyWith(...)),
//       b: () => emit(state.copyWith(...)),
//       ...
//   }
// }
