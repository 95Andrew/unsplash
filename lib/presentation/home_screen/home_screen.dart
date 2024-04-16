import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash/core/unsplash_router.dart';
import 'home_cubit/home_cubit.dart';
import 'widgets/photo_info_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeRedirectToDetailState) {
               Navigator.pushNamed(
                    context,
                    UnsplashRouter.detail,
                    arguments: state.unsplashPhoto,
                  );
            }
          },
          builder: (context, state) {
            if (state is HomeContentState) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  final photo = state.photoList[index];

                  return GestureDetector(
                    onTap: () => context.read<HomeCubit>().goToDetail(photo),
                    child: PhotoInfoButton(unsplashPhoto: photo),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: state.photoList.length,
              );
            } else if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeErrorState) {
              return Center(
                child: OutlinedButton(
                  child: const Text('Seems something went wrong'),
                  onPressed: () => context.read<HomeCubit>().fetchData(),
                ),
              );
            }

            return const SizedBox.shrink();
          },
          buildWhen: (previous, current) => _isBuildState(current),
        ),
      ),
    );
  }
  bool _isBuildState(HomeState state) {
    return state is HomeContentState || state is HomeLoadingState || state is HomeErrorState;
  }
}
