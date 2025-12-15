import 'package:cinetopia/app/model/movie.dart';
import 'package:cinetopia/app/services/releases_service.dart';

class ReleasesViewmodel {
  List<Movie> _movieList = <Movie>[];

  Future<List<Movie>> getReleasesMovies() async {
    final RelasesService service = SearchRelasesMovies();
    _movieList = await service.getMovies();
    return _movieList;
  }

  List<Movie> get movieList => _movieList;
}
