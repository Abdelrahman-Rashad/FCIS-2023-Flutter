class UserModel  {
  String? userid, email, firstname, lastname;

  UserModel({this.userid, this.email, this.firstname, this.lastname});

  UserModel.fromjson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    userid = map['userid'];
    email = map['email'];
    firstname = map['firstname'];
    lastname = map['lastname'];
  }

  toJson() {
    return {
      'userid': userid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname
    };
  }
}
