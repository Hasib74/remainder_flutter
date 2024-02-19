class AppUrls {
  static String _baseUrl = "https://bina-api-dev.neuropolis.io/api/v1/";

  // user
  static String registration = "${_baseUrl}user/register";
  static String login = "${_baseUrl}user/login";
  static String profile = "${_baseUrl}user/profile";
  static String update = "${_baseUrl}user/update";
  static String delete = "${_baseUrl}user/delete";

  static String crops = "${_baseUrl}crops";
  static String cropsSearch = "${_baseUrl}crops/search";
  static String cropsByIs(int id) => "${_baseUrl}crops/$id";
  static String cropsUpdate(int id) => "${_baseUrl}crops/$id";
  static String cropsDelete(int id) => "${_baseUrl}crops/$id";



}
