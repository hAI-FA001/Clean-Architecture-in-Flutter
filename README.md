# Flutter Clean Architecture

Learning Clean architecture by building a project in Flutter

<a href="https://www.youtube.com/watch?v=7V_P6dovixg">Tutorial</a> followed.

<br>

Core concepts:
 - Separate domain, presentation and data layers for each feature
 - Keep domain independent from implementation (e.g. ArticleModel contains actual functionality, while ArticleEntity is the domain entity that is used where you want independence from the data layer)

<br>

Flutter packages:
 - Bloc for state management
 - GetIt for dependency injection and service locator pattern
 - Floor and Sqflite as local DB
 - Equatable
 - Intl
 - Dio
 - Retrofit
 - Flutter Hooks
 - Cached Network Image
 - Flutter Dotenv
 - Ionicons
