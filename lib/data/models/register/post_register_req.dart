class PostRegisterReq {
  String? username;
  String? password;
  String? email;
  String? name;
  int? role;

  PostRegisterReq(
      {this.username, this.password, this.email, this.name, this.role});

  PostRegisterReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.username != null) {
      data['username'] = this.username;
    }
    if (this.password != null) {
      data['password'] = this.password;
    }
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.role != null) {
      data['role'] = this.role;
    }
    return data;
  }
}
