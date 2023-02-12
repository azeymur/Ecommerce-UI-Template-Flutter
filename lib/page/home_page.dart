import 'package:ecommerce_template/cubit/home_cubit.dart';
import 'package:ecommerce_template/localization/locals.dart';
import 'package:ecommerce_template/model/poster.dart';
import 'package:ecommerce_template/widget/category_tile.dart';
import 'package:ecommerce_template/widget/loading.dart';
import 'package:ecommerce_template/widget/showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    final locals = Locals.of(context);

    cubit.load();

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.appName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed("/search")
                  .then((_) => cubit.load());
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is InitialHomeState) {
            return const Loading();
          } else {
            state as LoadedHomeState;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _bannerSection(state.posters),
                    SizedBox(
                      height: 126.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return CategoryTile(category: category);
                        },
                      ),
                    ),
                    Showcase(
                      title: locals.featuredItems,
                      products: state.featuredItems,
                      callback: () {},
                    ),
                    Showcase(
                      title: locals.popularItems,
                      products: state.popularItems,
                      callback: () {},
                    ),
                    Showcase(
                      title: locals.newItems,
                      products: state.newItems,
                      callback: () {},
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Padding _bannerSection(List<Poster> posters) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
        child: AspectRatio(
          aspectRatio: 2.5,
          child: PageView.builder(
            pageSnapping: true,
            itemCount: posters.length,
            itemBuilder: (context, index) {
              final poster = posters[index];
              return GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/${poster.image}.jpg",
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
