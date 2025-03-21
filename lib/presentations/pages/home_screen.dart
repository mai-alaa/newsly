import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newslt/core/utils/cache_helper.dart';
import 'package:newslt/core/utils/common_helper.dart';

import 'package:newslt/presentations/cubits/get_news/get_news_cubit.dart';
import 'package:newslt/presentations/cubits/get_news/get_news_state.dart';
import 'package:newslt/presentations/widgets/category_taps.dart';
import 'package:newslt/presentations/widgets/custom_app_bar.dart';
import 'package:newslt/presentations/widgets/news_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoriesTaps = CacheHelper.getData(key: 'selected_interests') ;
    if (categoriesTaps.isEmpty) {
      categoriesTaps = ['']; 
    }

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: 'Explore',
                    ),
                    BlocBuilder<GetNewsCubit, GetNewsStates>(
                      builder: (context, state) {
                        final cubit = context.read<GetNewsCubit>();
                        String selectedCategory = cubit.selectedCategory ?? categoriesTaps.first;
                        return CategoryTabs(
                          categories: categoriesTaps,
                          selectedCategory: selectedCategory,
                          onCategoryTap: (category) {
                           cubit.changeCategory(category);
                          },
                        );
                      },
                    ),
                    const Divider(height: 2, color: Colors.grey),
                  ],
                ),
              ),
            ];
          },
          body: BlocBuilder<GetNewsCubit, GetNewsStates>(
            builder: (context, state) {
              if (state is GetNewsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is GetNewsSuccessState) {
                final articles = context.read<GetNewsCubit>().articles?.articles ?? [];
                if (articles.isEmpty) {
                  return const Center(child: Text('No news available'));
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return NewsCard(
                      category: article.source.name.toUpperCase(),
                      title: article.title,
                      subtitle: article.description ?? 'No description available',
                      date: formatDate(article.publishedAt.toIso8601String()),
                      readTime: estimateReadTime(article.content ?? ''),
                      urlToImage: article.urlToImage,
                      onTap: () {
                        print('Tapped: ${article.url}');
                      },
                    );
                  },
                );
              } else if (state is GetNewsFailureState) {
                return Center(child: Text('Error: ${state.error}'));
              }
              context.read<GetNewsCubit>().getNews(categoriesTaps.first.toLowerCase());
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}