class ApiConstant {
  static String baseApiUrl = "http://192.168.1.32:5000";
  static String examCategory = "/device/api/v1/exam_category/list";
  static String wordCategory = "/device/api/v1/word_category/list";
  static String wordTopics = "/device/api/v1/word_topic/list";
  static String exams = "/device/api/v1/exam";
  static String result = "/device/api/v1/result";
  static String user = "/device/api/v1/user";
  static String getFileUrl(String path) {
    if (path.contains("http")) {
      return path;
    }
    return baseApiUrl + path;
  }
}
