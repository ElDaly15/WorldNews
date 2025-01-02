import 'package:bloc/bloc.dart';
import 'package:daily_news/core/helper/api/dio_consumer.dart';
import 'package:daily_news/core/models/news_model.dart';
import 'package:daily_news/core/repos/get_all_news_repo/get_all_news_repo_impl.dart';
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_latest_news_state.dart';

class GetLatestNewsCubit extends Cubit<GetLatestNewsState> {
  GetLatestNewsCubit() : super(GetLatestNewsInitial());
  void getNews({required String q}) async {
    emit(GetLatestNewsLoading());
    var response =
        await GetAllNewsRepoImpl(apiConsumer: DioConsumer(dio: Dio()))
            .getAllNews(q: q);
    response.fold((l) => emit(GetLatestNewsFailuer(l.message)),
        (r) => emit(GetLatestNewsSuccess(r)));
  }
}
