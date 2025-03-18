import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

String js = '''
(() => {
  const modelViewer = document.querySelector('#orbit-demo');
  const orbitCycle = [
    '45deg 55deg 4m',
    '-60deg 110deg 2m',
    modelViewer.cameraOrbit
  ];

  setInterval(() => {
    const currentOrbitIndex = orbitCycle.indexOf(modelViewer.cameraOrbit);
    modelViewer.cameraOrbit =
        orbitCycle[(currentOrbitIndex + 1) % orbitCycle.length];
  }, 3000);
})();
''';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: ModelViewer(
          id: 'orbit-demo',
          interpolationDecay: 200,
          src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
          alt: 'A 3D model of an astronaut',
          relatedJs: js,
        ),
      ),
    );
  }
}
