import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsAPIBaseURL = 'https://newsapi.org/v2';
String newsApiKey = dotenv.env['API_KEY']!;
const String countryQuery = "us";
const String categoryQuery = "general";
