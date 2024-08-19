// ignore_for_file: prefer_interpolation_to_compose_strings

class EndPoint {
  static const String baseUrl = 'http://ashal.runasp.net';
  static const String apiUrl = '$baseUrl/api/';


  //////////////////////////////////////////////////////////////////////////////////////////////////

  static String register = "${apiUrl}Admins/register";
  static String login = apiUrl + "Accounts/login";
  static String addBlog = apiUrl + "Blogs";
  static String updateBlog = apiUrl + "Blogs?Id=";
  static String changeStatus = apiUrl + "Blogs/ChangeStatus?Id=";

  static String getGoverMent = apiUrl + "Governments";

  static String accomandtionType = apiUrl + "AccomodationType/Types";

  static String changeStatusAccomAccepted = apiUrl + "Accomodation/AcceptAccomodation?AccomidtionId=";
  static String changeStatusAccomRejected = apiUrl + "Accomodation/RejectAccomodation?AccomidtionId=";









}
