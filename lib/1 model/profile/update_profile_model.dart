class UpdateProfileModel {
  String? fullname;
  String? email;
  String? userId;
  String? message;

  // Constructor for request
  UpdateProfileModel({this.fullname, this.email, this.userId, this.message});

  // Constructor for response
  UpdateProfileModel.fromJson(Map<String, dynamic> json, {bool isResponse = false}) {
    if (isResponse) {
      message = json['message'];
      if (json['user'] != null) {
        userId = json['user']['userId'];
        email = json['user']['email'];
        fullname = json['user']['fullName'];
      }
    } else {
      fullname = json['fullName'];
      email = json['email'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fullname != null) data['fullName'] = fullname;
    if (email != null) data['email'] = email;
    if (userId != null) data['userId'] = userId;
    if (message != null) data['message'] = message;

    return data;
  }
}
