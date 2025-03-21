import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:newslt/core/utils/common_helper.dart';
import 'package:newslt/core/utils/constants.dart';
import 'package:newslt/data/models/data_model.dart';
import 'package:newslt/presentations/cubits/get_news/get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsStates> {
  GetNewsCubit() : super(GetNewsInitilState());
  
  Dio dio = Dio();
  NewsDataModel? articles;
  String? selectedCategory;
  
  void changeCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      emit(GetNewsLoadingState()); 
      getNews(category);
    }
  }

  Future<void> getNews(String? category) async {
    String apiKey = dotenv.get('API_KEY');
    log('API_KEY: $apiKey');
    String url = '$baseApi/top-headlines?country=us&category=$category&apiKey=$apiKey';
    
    if (selectedCategory != category) {
      selectedCategory = category;
    }
    
    emit(GetNewsLoadingState());
    try {
      checkConnection();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        log("API Response: ${response.data}");
        articles = NewsDataModel.fromJson(response.data);
        emit(GetNewsSuccessState());
      } else {
        emit(GetNewsFailureState(response.data.toString()));
        log(response.statusCode.toString());
      }
    } catch (e) {
      emit(GetNewsFailureState(e.toString()));
      throw Exception(e.toString());
    }
  }
}