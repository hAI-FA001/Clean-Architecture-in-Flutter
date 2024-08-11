import 'package:flutter_dotenv/flutter_dotenv.dart';

const String newsAPIBaseURL = 'https://newsapi.org/v2';
String newsApiKey = dotenv.env['API_KEY']!;
const String countryQuery = "us";
const String categoryQuery = "general";
const String kDefaultImage =
    "https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg";
