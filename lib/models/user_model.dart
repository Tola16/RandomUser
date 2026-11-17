class UserModel {
  final String name;
  final String email;
  final String Phone;
  final String Address;
  final String url;
  final num age;

  UserModel({
    required this.age,
    required this.name,
    required this.email,
    required this.Phone,
    required this.Address,
    required this.url,
  });
}

class Users {
  final List<UserModel> users;

  Users({required this.users});

  factory Users.FromJson(Map<String, dynamic> json) {
    final List<UserModel> templist = json["results"]
        .map<UserModel>(
          (user) => UserModel(
            age: user["dob"]["age"],
            name: "${user["name"]["first"] + user["name"]["last"]}",
            email: user["email"],
            Phone: user["phone"],
            Address:
                "${user["location"]["street"]["name"] + user["location"]["city"]}",
            url: user["picture"]["large"],
          ),
        )
        .toList();
    return Users(users: templist);
  }
}
