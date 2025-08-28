import 'package:flutter/material.dart';
import 'package:task_doc/core/di/dependency_injection.dart';
import 'package:task_doc/doc_app.dart';
import 'core/routing/app_router.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
