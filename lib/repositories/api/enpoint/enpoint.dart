// ignore_for_file: prefer_interpolation_to_compose_strings

class EndPoint {
  static const String baseUrl = 'http://ashal.runasp.net';
  static const String apiUrl = '$baseUrl/api/';


  //////////////////////////////////////////////////////////////////////////////////////////////////

  static String register = "${apiUrl}Admins/register";
  static String login = apiUrl + "Accounts/login";
  static String uploadImage = apiUrl + "Accomodation/Accomodation/UploadImage";

  static String addBlog = apiUrl + "Blogs";
  static String addActivity = apiUrl + "Activities/AddActivity";
  static String updateBlog = apiUrl + "Blogs?Id=";
  static String changeStatus = apiUrl + "Blogs/ChangeStatus?Id=";

  static String getGoverMent = apiUrl + "Governments";
  static String getCompany = apiUrl + "Companies/GetCompaniesforSelect";
  static String getServicesCompany = apiUrl + "ApplicationServices";
  static String getCategory = apiUrl + "Product/Product/GetAllProductCategory";

  static String accomandtionType = apiUrl + "AccomodationType/Types";

  static String changeStatusAccomAccepted = apiUrl + "Accomodation/AcceptAccomodation?AccomidtionId=";
  static String changeStatusAccomRejected = apiUrl + "Accomodation/RejectAccomodation?AccomidtionId=";
  static String activeTrips = apiUrl + "AdminTrips/ActiveAndInActiveTrip?id=";
  static String deleteTrips = apiUrl + "AdminTrips/DeleteTrip?id=";
  static String addTrips = apiUrl + "AdminTrips/AddCompanyTrip";









}
