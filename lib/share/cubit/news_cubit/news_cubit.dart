import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../api/api.dart';
import '../../remote/dio_helper.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];

  Future<List> getBusinessNews() async {
    emit(BusinessNewsLoading());
    DioHelper.getData(
      url: topHeaderQueryApi,
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': apiKey,
      },
    ).then((value) {
      business = value.data['articles'];
      print("Successful ✅");
      emit(GetBusinessNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessNewsError(error.toString()));
    });
    return business;
  }

  List<dynamic> world = [];

  Future<List> getWorldNews() async {
    emit(WorldNewsLoading());
    DioHelper.getData(
      url: topHeaderQueryApi,
      query: {
        'country': 'us',
        'apiKey': apiKey,
      },
    ).then((value) {
      world = value.data['articles'];
      print("Successful ✅");
      emit(GetWorldNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetWorldNewsError(error.toString()));
    });
    return world;
  }

  List<dynamic> arab = [];

  Future<List> getArabNews() async {
    print("object=========================");
    emit(ArabNewsLoading());
    DioHelper.getData(
      url: topHeaderQueryApi,
      query: {
        'country': 'eg',
        'apiKey': apiKey,
      },
    ).then((value) {
      arab = value.data['articles'];
      print("Successful ✅");
      emit(GetArabNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetArabNewsError(error.toString()));
    });

    return arab;
  }

  List<dynamic> science = [];

  Future<List> getScienceNews() async {
    emit(ScienceNewsLoading());
    DioHelper.getData(
      url: topHeaderQueryApi,
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': apiKey,
      },
    ).then((value) {
      science = value.data['articles'];
      print("Successful ✅");
      emit(GetScienceNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceNewsError(error.toString()));
    });
    return science;
  }

  List<dynamic> sport = [];

  Future<List> getSportNews() async {
    emit(SportNewsLoading());
    DioHelper.getData(
      url: everythingQueryApi,
      query: {
        'q': 'uefa',
        'sortBy': 'publishedAt',
        'apiKey': apiKey,
      },
    ).then((value) {
      sport = value.data['articles'];
      print("Successful ✅");
      emit(GetSportNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportNewsError(error.toString()));
    });
    return sport;
  }

  List<dynamic> health = [];

  Future<List> getHealthNews() async {
    emit(HealthNewsLoading());
    DioHelper.getData(
      url: topHeaderQueryApi,
      query: {
        'country': 'us',
        'category': 'health',
        'apiKey': apiKey,
      },
    ).then((value) {
      health = value.data['articles'];
      print("Successful ✅");
      emit(GetHealthNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetHealthNewsError(error.toString()));
    });
    return health;
  }

  List<dynamic> technology = [];

  Future<List> getTechnologyNews() async {
    emit(TechnoNewsLoading());
    DioHelper.getData(
      url: everythingQueryApi,
      query: {
        'domains': 'domains=techcrunch.com,thenextweb.com',
        'apiKey': apiKey,
      },
    ).then((value) {
      technology = value.data['articles'];
      print("Successful ✅");
      emit(GetTechnologyNewsSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetTechnologyNewsError(error.toString()));
    });
    return technology;
  }
}
