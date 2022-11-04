class ApiConstants{
  
  final String _apiProductionUrl = 'https://naturalslim-api-idlpryysla-uc.a.run.app';
  final String _apiKeyQuizProduction = '1J8H-5HNPY-3VCTWE';
  final String _apiKeyAppMembersProduction = '0F5E-06U8V-3HNMOO';

  final String _apiDevelopUrl = 'https://dev-naturalslim-api-idlpryysla-uc.a.run.app';
  final String _apiKeyQuizDevelop = '1J8H-5HNPY-3VCTWE';
  final String _apiKeyAppMembersDevelop = '0F5E-06U8V-3HNMOO';

  final String _localhostUrl = "https://192.168.1.15:45455";
  
  // Add the remote url of the localhost of the computer that is running the backen project
  final bool _useDevelop = true;
  final bool _isAppMobile = true;
  final bool useLocalhost = false;
  
  // Please use the base url that understands which url to use depending on the 
  //compilation mode, in case of debug and realse you can use the localhost url 
  //and in production use the url of a deployed api
  
  String get baseUrl => useLocalhost ? _localhostUrl : _useDevelop ? _apiDevelopUrl : _apiProductionUrl;
  String get apiKey => _isAppMobile ? (_useDevelop ? _apiKeyAppMembersDevelop : _apiKeyAppMembersProduction) : (_useDevelop ? _apiKeyQuizDevelop : _apiKeyQuizProduction);
}