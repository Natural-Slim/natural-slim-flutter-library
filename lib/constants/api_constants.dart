class ApiConstants{
  // static String url = 'https://backend-lyndi7d3wa-uc.a.run.app'; // Developt url for deployed api
  static String productionUrl = 'https://naturalslim-api-idlpryysla-uc.a.run.app';
  
  // Add the remote url of the localhost of the computer that is running the backen project
  static String developmentUrl = "https://192.168.0.3:45455";
  static bool useLocalhost = false;
  
  // Please use the base url that understands which url to use depending on the 
  //compilation mode, in case of debug and realse you can use the localhost url 
  //and in production use the url of a deployed api
  
  static String baseUrl = !useLocalhost ? productionUrl : developmentUrl;
  static String apiKey = '1J8H-5HNPY-3VCTWE';
  
  static String preferencesKeyToken = 'token';
  static String preferencesUsername = 'username';
  static String preferencesPassword = 'password';
  static String preferencesTokenExpiration = 'tokenExpiration';
  static String preferencesStateLogin = 'stateLogin';

  static String keyEncryptDecrypt = 'NSA@NaturalSl¡m';
}