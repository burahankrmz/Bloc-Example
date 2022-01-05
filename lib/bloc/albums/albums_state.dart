part of 'albums_bloc.dart';

abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<Album> albums;
  AlbumsLoaded(this.albums);
}

class AlbumsListError extends AlbumsState {
  dynamic error;
  AlbumsListError({this.error});
}
