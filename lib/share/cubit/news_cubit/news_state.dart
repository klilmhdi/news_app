part of 'news_cubit.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class WorldNewsLoading extends NewsState {}

class GetWorldNewsSuccess extends NewsState {}

class GetWorldNewsError extends NewsState {
  final String error;

  GetWorldNewsError(this.error);
}

class ArabNewsLoading extends NewsState {}

class GetArabNewsSuccess extends NewsState {}

class GetArabNewsError extends NewsState {
  final String error;

  GetArabNewsError(this.error);
}

class HealthNewsLoading extends NewsState {}

class GetHealthNewsSuccess extends NewsState {}

class GetHealthNewsError extends NewsState {
  final String error;

  GetHealthNewsError(this.error);
}

class TechnoNewsLoading extends NewsState {}

class GetTechnologyNewsSuccess extends NewsState {}

class GetTechnologyNewsError extends NewsState {
  final String error;

  GetTechnologyNewsError(this.error);
}

class SportNewsLoading extends NewsState {}

class GetSportNewsSuccess extends NewsState {}

class GetSportNewsError extends NewsState {
  final String error;

  GetSportNewsError(this.error);
}

class ScienceNewsLoading extends NewsState {}

class GetScienceNewsSuccess extends NewsState {}

class GetScienceNewsError extends NewsState {
  final String error;

  GetScienceNewsError(this.error);
}

class BusinessNewsLoading extends NewsState {}

class GetBusinessNewsSuccess extends NewsState {}

class GetBusinessNewsError extends NewsState {
  final String error;

  GetBusinessNewsError(this.error);
}
