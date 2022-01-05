import '../model/album_list.dart';
import 'package:http/http.dart' as http;

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  @override
  Future<List<Album>> getAlbumList() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
