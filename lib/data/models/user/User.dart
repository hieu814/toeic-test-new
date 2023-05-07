class UserSchema {
  String? username;
  String? password;
  String? email;
  String? name;
  String? gender;
  String? id;
  String? phone;
  String? intro;
  String? mobileNo;
  String? avatar;
  bool? isDeleted;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? addedBy;
  String? updatedBy;
  List<ScoreStatistic>? scoreStatistics;
  int? userType;
  int? loginRetryLimit;
  DateTime? loginReactiveTime;

  UserSchema(
      {this.username,
      this.password,
      this.email,
      this.name,
      this.gender,
      this.phone,
      this.intro,
      this.mobileNo,
      this.avatar,
      this.isDeleted,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.addedBy,
      this.updatedBy,
      this.scoreStatistics,
      this.userType,
      this.loginRetryLimit,
      this.loginReactiveTime,
      this.id});

  factory UserSchema.fromJson(Map<String, dynamic> json) {
    return UserSchema(
      id: json['id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      intro: json['intro'] as String?,
      mobileNo: json['mobileNo'] as String?,
      avatar: json['avatar'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isActive: json['isActive'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      addedBy: json['addedBy'] as String?,
      updatedBy: json['updatedBy'] as String?,
      scoreStatistics: (json['score_statistics'] as List<dynamic>?)
          ?.map((e) => ScoreStatistic.fromJson(e as Map<String, dynamic>))
          .toList(),
      userType: json['userType'] as int?,
    );
  }
}

class ScoreStatistic {
  int? type;
  int? totalCorrect;
  int? count;

  ScoreStatistic({this.type, this.totalCorrect, this.count});

  factory ScoreStatistic.fromJson(Map<String, dynamic> json) {
    return ScoreStatistic(
      type: json['type'] as int?,
      totalCorrect: json['total_correct'] as int?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['total_correct'] = totalCorrect;
    data['count'] = count;
    return data;
  }
}
