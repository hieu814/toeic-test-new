class AccountModel {}

class ToeicScore {
  int listeningScore;
  int readingScore;
  Map<int, double> percentCorrect = {
    1: 0.0,
    2: 0.0,
    3: 0.0,
    5: 0.0,
    4: 0.0,
    6: 0.0,
    7: 0.0,
  };

  ToeicScore({this.listeningScore = 0, this.readingScore = 0});
  double getPercentCorrect(int type) {
    return percentCorrect[type] ?? 0.0;
  }

  void setPercentCorrect(int type, double value) {
    percentCorrect[type] = value;
  }

  Map<String, dynamic> toJson() {
    return {
      'listeningScore': listeningScore,
      'readingScore': readingScore,
      'percentCorrect': percentCorrect,
    };
  }
}
