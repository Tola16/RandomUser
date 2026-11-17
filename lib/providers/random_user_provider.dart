import 'package:flutter/cupertino.dart';
import 'package:randomuser/models/user_model.dart';
import 'package:randomuser/services/random_user_service.dart';

class RandomUserProvider extends ChangeNotifier {
  Users? user;
  Future<void> requestusers() async {
    user = await RandomUserService.GetUsers();
    notifyListeners();
  }
}
