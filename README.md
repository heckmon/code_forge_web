This is the web version of the powerful [code_forge](https://github.com/heckmon/code_Forge) package.

This package can load files from raw URLs and the `LspSocketConfig()` class can be used to enable [LSP](https://microsoft.github.io/language-server-protocol/) features, which makes the code_forge_web the ideal choice for browser based code editors.

## Difference from code_forge

Almost all features in the [code_forge](https://github.com/heckmon/code_Forge) are same in this package except the file handling and the LSP initialization.
The `CodeForgeWeb` has a `fileUrl` parameter instead of the `filePath` parameter of the `CodeForge`, where the user can pass raw file URLs.

```dart
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
        workspacePath: "file:///workspace", // Virtual workspace name
        languageId: "dart", // Language id
        serverUrl: "ws://localhost:9000" // The LSP server url.
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: SafeArea(
          child: CodeForgeWeb(
            // Working url of any file.
            fileUrl: "https://raw.githubusercontent.com/heckmon/code_forge/main/lib/code_forge/controller.dart",
            controller: controller,
            textStyle: GoogleFonts.jetBrainsMono(fontSize: 20),
            innerPadding: EdgeInsets.only(top: 10),
          )
        ),
      ),
    );
  }
}
```

To host a LSP server, you can use the [lsp-ws-proxy](https://github.com/qualified/lsp-ws-proxy) package.<br>
Here is an example of running dart language server via websocket:

```bash
./lsp-ws-proxy --listen 0.0.0.0:9000 -- dart language-server --protocol=lsp

```

This will start and run the LSP server on the `localhost:9000`. You can pass the link `ws://localhost:9000` to the `LspSocketConfig()` to enable LSP features like in the above example.

<p align="center">
  <img src="https://raw.githubusercontent.com/heckmon/code_forge_web/refs/heads/main/scrnshots/example.png" alt="CodeForgeWeb Demo" width="800"/>
</p>