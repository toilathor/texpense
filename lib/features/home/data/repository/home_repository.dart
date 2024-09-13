import 'package:texpense/features/home/data/api/home_api.dart';

class HomeRepository {
  final HomeApi _homeApi;

  HomeRepository(this._homeApi);

// Future<JokeModel> fetchJoke() async {
//   try {
//     final res = await _homeApi.fetchJokesApiRequest();
//     final jokeModel = JokeModel.fromJson(res);
//     return jokeModel;
//   } on DioException catch (e) {
//     final errorMessage = DioExceptions.fromDioError(e);
//     log(errorMessage.toString());
//     rethrow;
//   }
// }
}
