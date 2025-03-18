import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() => runApp(const MyApp());

String js = '''
const modelViewerVariants = document.querySelector("model-viewer#shoe");
const select = document.querySelector('#variant');

modelViewerVariants.addEventListener('load', () => {
  const names = modelViewerVariants.availableVariants;
  for (const name of names) {
    const option = document.createElement('option');
    option.value = name;
    option.textContent = name;
    select.appendChild(option);
  }
  // Adds a default option.
  const option = document.createElement('option');
    option.value = 'default';
    option.textContent = 'Default';
    select.appendChild(option);
});

select.addEventListener('input', (event) => {
  modelViewerVariants.variantName = event.target.value === 'default' ? null : event.target.value;
});
''';

String html = '''
  <div class="controls">
    <div>Variant: <select id="variant"></select></div>
  </div>
''';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Model Viewer')),
        body: ModelViewer(
          id: 'shoe',
          src:
              'https://modelviewer.dev/shared-assets/models/glTF-Sample-Assets/Models/MaterialsVariantsShoe/glTF-Binary/MaterialsVariantsShoe.glb',
          alt: 'A 3D model of a Shoe',
          ar: true,
          arModes: const ['scene-viewer', 'webxr', 'quick-look'],
          relatedJs: js,
          innerModelViewerHtml: html,
        ),
      ),
    );
  }
}
