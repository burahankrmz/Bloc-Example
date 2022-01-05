import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/albums/albums_bloc.dart';
import '../model/album_list.dart';

class AlbumsScreen extends StatefulWidget {
  const AlbumsScreen({Key? key}) : super(key: key);

  @override
  _AlbumsScreenState createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends State<AlbumsScreen> {
  _loadAlbums() async {
    BlocProvider.of<AlbumsBloc>(context).add(FetchAlbums());
  }

  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

//? MAYBE ERROR
  _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder<AlbumsBloc, AlbumsState>(
          builder: (context, state) {
            if (state is AlbumsListError) {
              final error = state.error;
              String message = '${error.message}\nTap to Retry.';
              return Text(message);
            }
            if (state is AlbumsLoaded) {
              List<Album> albums = state.albums;
              return _list(albums);
            }
            //return const Center(child: CircularProgressIndicator());
            return const Loading();
          },
        ),
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (_, index) {
          Album album = albums[index];
          return ListTile(
            title: Text(album.title!),
          );
        },
      ),
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: SizedBox(child: Lottie.asset('assets/json/loading.json',fit: BoxFit.scaleDown)),);
  }
}
