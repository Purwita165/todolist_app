import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';

import 'pages/todo_page.dart';

void main() async {
  // ============================================================
  // FLUTTER BINDING
  // ============================================================
  // WAJIB sebelum async + plugin (SQLite, path, dll)
  WidgetsFlutterBinding.ensureInitialized();

  // ============================================================
  // SQLITE INIT (DESKTOP ONLY)
  // ============================================================
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();

    // Override database engine ke versi desktop
    databaseFactory = databaseFactoryFfi;
  }

  // ============================================================
  // RUN APP
  // ============================================================
  runApp(const MyApp());
}

// ============================================================
// ROOT APP
// ============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // ========================================================
      // APP INFO
      // ========================================================
      title: 'WorkTracker',

      // ========================================================
      // THEME (SIAP SCALING)
      // ========================================================
      theme: ThemeData(
        primarySwatch: Colors.blue,

        // Visual lebih modern
        useMaterial3: true,

        // Konsistensi UI global
        scaffoldBackgroundColor: Colors.grey[50],
      ),

      // ========================================================
      // HOME
      // ========================================================
      home: const TodoPage(),
    );
  }
}