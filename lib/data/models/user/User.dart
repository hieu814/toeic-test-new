import 'package:toeic_test/core/app_export.dart';
import 'package:toeic_test/presentation/account_page/models/account_model.dart';

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
  List<ScoreStatistic> scoreStatistics;
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
      required this.scoreStatistics,
      this.userType,
      this.loginRetryLimit,
      this.loginReactiveTime,
      this.id});

  factory UserSchema.fromJson(Map<String, dynamic> json) {
    // print("hieu parse $json");
    List<dynamic> dataList = ((json['score_statistics'] ?? []) as List);
    List<ScoreStatistic> _scoreStatistics = dataList
        .map((e) => ScoreStatistic.fromJson(e as Map<String, dynamic>))
        .toList();
    if (_scoreStatistics.length == 0) {
      for (var i = 1; i <= 7; i++) {
        _scoreStatistics
            .add(ScoreStatistic(type: i, count: 0, totalCorrect: 0));
      }
    }
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
      scoreStatistics: _scoreStatistics,
      userType: json['userType'] as int?,
    );
  }
  // void addCorrectScore
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'id': id,
      'phone': phone,
      'intro': intro,
      'mobileNo': mobileNo,
      'avatar': avatar,
      'score_statistics': scoreStatistics?.map((e) => e.toJson()).toList(),
    };
  }

  ToeicScore getScoreStatics() {
    try {
      int listeningCount = 0;

      int readingCount = 0;

      ToeicScore toeicScore = ToeicScore();
      for (var score in scoreStatistics) {
        toeicScore.setPercentCorrect(score.type,
            score.count == 0 ? 0.0 : (score.totalCorrect / score.count));

        if (score.type < 5) {
          listeningCount += score.count == 0
              ? 0
              : ((score.totalCorrect / score.count) *
                      getToeicQuestionCount(score.type))
                  .round();
        } else {
          readingCount += score.count == 0
              ? 0
              : ((score.totalCorrect / score.count) *
                      getToeicQuestionCount(score.type))
                  .toInt();
        }
      }

      toeicScore.listeningScore =
          listeningCount == 0 ? 0 : toeicListeningScore[listeningCount] ?? 5;
      toeicScore.readingScore =
          readingCount == 0 ? 0 : toeicReadingScore[readingCount] ?? 5;
      return toeicScore;
    } catch (e) {}
    return ToeicScore();
  }

  int getToeicQuestionCount(int type) {
    final count = toeicSections[type];
    print("hieu $type :  $count");
    if (count != null && !count.isNaN && !count.isInfinite) {
      return count;
    }
    return 1;
  }
}

class ScoreStatistic {
  int type;
  int totalCorrect;
  int count;

  ScoreStatistic(
      {required this.type, required this.totalCorrect, required this.count});

  factory ScoreStatistic.fromJson(Map<String, dynamic> json) {
    return ScoreStatistic(
      type: json['type'] ?? 0,
      totalCorrect: json['total_correct'] ?? 0,
      count: json['count'] ?? 0,
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
