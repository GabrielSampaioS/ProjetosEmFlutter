import 'package:cinetopia/app/viewmodels/releases_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:cinetopia/ui/screens/movie_details.dart';
import 'package:flutter/material.dart';

class Releases extends StatelessWidget {
  final ReleasesViewmodel viewmodel = ReleasesViewmodel();

  Releases({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getReleasesMovies(),
      builder: (context, snaphot) {
        if (snaphot.hasData) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/image/upcoming.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Proximos lançamentos",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetails(movie: viewmodel.movieList[index]),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: MovieCard(movie: viewmodel.movieList[index]),
                  ),
                ),
                itemCount: viewmodel.movieList.length,
              ),
            ],
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
