import 'package:cinetopia/app/services/api_key.dart';

//SearchMovies
const String popularMovisUrl =
    "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

const String moviePrevixUrl =
    "https://api.themoviedb.org/3/search/movie?query=";
    
const String movieFilterSulfix = "&include_adult=false&language=en-US&page=1";

//SearchRealeasesMovies
const String releasesMoviesUrl =
    "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1";
const requestHeader = {
  'accept': 'application/json',
  'Authorization': 'Bearer $apiKey',
};

const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500";
