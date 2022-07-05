

enum RequestType { Post, Get, PostWithAuth, GetWithAuth }

class ApiUtil {
  /*----------------- Fpr development server -----------------*/
  static const String IP_ADDRESS = "127.0.0.1/";

  static const String PORT = "8000";
  static const String API_VERSION = "v1";
  static const String USER_MODE = "user/";

  // static const String BASE_URL = "http://" + IP_ADDRESS + ":" + PORT + "/";

  /*------------ For Production server ----------------------*/
  static const String BASE_URL = "https://silakarang.tugas-akhir.web.id/";
  static const String BASE_URL_API = BASE_URL + "api-services/";
  static const String BASE_URL_API_NGANTRE = "https://ngantre.com/si/APIs/";
  static const String ID_POINT_NGANTRE = "291";

  static const String MAIN_API_URL_DEV =
      BASE_URL + "api/" + API_VERSION + "/" + USER_MODE;
  static const String MAIN_API_URL_PRODUCTION =
      BASE_URL + "api/" + API_VERSION + "/" + USER_MODE;

  //Main Url for production and testing
  static const String MAIN_API_URL = MAIN_API_URL_PRODUCTION;

  // ------------------ Status Code ------------------------//
  static const int SUCCESS_CODE = 200;
  static const int ERROR_CODE = 400;
  static const int UNAUTHORIZED_CODE = 401;

  //Custom codes
  static const int INTERNET_NOT_AVAILABLE_CODE = 500;
  static const int SERVER_ERROR_CODE = 501;
  static const int MAINTENANCE_CODE = 503;

  //------------------ Header ------------------------------//

  static Map<String, String> getHeader(
      {RequestType requestType = RequestType.Get, String token = ""}) {
    switch (requestType) {
      case RequestType.Post:
        return {
          "Accept": "application/json",
          "Content-type": "application/json"
        };
      case RequestType.Get:
        return {
          "Accept": "application/json",
        };
      case RequestType.PostWithAuth:
        return {
          "Accept": "application/json",
          "Content-type": "application/json",
          "Authorization": "Bearer " + token
        };
      case RequestType.GetWithAuth:
        return {
          "Accept": "application/json",
          "Authorization": "Bearer " + token
        };
    }
    //Not reachable
    return {"Accept": "application/json"};
  }

  // ----------------------  Body --------------------------//
  static Map<String, dynamic> getPatchRequestBody() {
    return {'_method': 'PATCH'};
  }

  //------------------- API LINKS ------------------------//

  static bool isResponseSuccess(int responseCode) {
    return responseCode >= 200 && responseCode < 300;
  }
}
