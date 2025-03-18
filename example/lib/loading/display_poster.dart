import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

String css = '''
model-viewer#reveal {
  --poster-color: transparent;
}
''';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: ModelViewer(
          id: 'revea',
          loading: Loading.eager,
          autoRotate: true,
          poster: 'https://modelviewer.dev/assets/poster-shishkebab.webp',
          src: 'https://modelviewer.dev/shared-assets/models/shishkebab.glb',
          alt: 'A 3D model of a shishkebab',
          relatedCss: css,
        ),
      ),
    );
  }
}
