import 'package:dio/dio.dart';
import 'package:randomuser/models/user_model.dart';

class RandomUserService {
  static Dio dio = Dio();

  static Future<Users> GetUsers() async {
    try {
      Response response = await dio.get(
        "https://randomuser.me/api/?results=50",
      );

      return Users.FromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (otherEception) {
      throw Exception("other Error: ${otherEception.toString()}");
    }
  }
}
