import 'package:code_forge_web/code_forge_web.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_highlight/languages/dart.dart';
import 'package:re_highlight/styles/vs2015.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final CodeForgeWebController controller;

  @override
  void initState() {
    super.initState();
    controller = CodeForgeWebController(
      lspConfig: LspSocketConfig(
        workspacePath: "file:///workspace",
        languageId: "dart",
        serverUrl: "ws://localhost:9000",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: CodeForgeWeb(
            editorTheme: vs2015Theme,
            language: langDart,
            fileUrl:
                "https://raw.githubusercontent.com/heckmon/code_forge/refs/heads/main/lib/code_forge/syntax_highlighter.dart",
            controller: controller,
            textStyle: GoogleFonts.jetBrainsMono(),
            innerPadding: EdgeInsets.only(top: 10),
          ),
        ),
      ),
    );
  }
}
