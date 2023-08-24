class AppUrls {
  /// this is the base url of the api
  static const String baseUrl = "http://localhost:3109/api";

  // api for getting products by list and search
  static const String allProducts = "/products/";
  static const String searchProduct = "/products/search/";

  // for authentication and getting user info
  static const String logIn = "/login";
  static const String register = "/register";
  static const String logOut = "/users";
}
