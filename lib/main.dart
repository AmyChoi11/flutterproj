import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Procreate Helper',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Procreate Helper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = MethodChannel('procreate_helper_widget/navigation');
  String _lastAction = 'No action yet';

  @override
  void initState() {
    super.initState();
    _setupUrlHandling();
  }

  void _setupUrlHandling() {
    // Handle URL schemes from widget
    platform.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'handleUrl') {
        final String url = call.arguments;
        _handleIncomingUrl(url);
      }
    });
  }

  void _handleIncomingUrl(String url) {
    setState(() {
      if (url.contains('undo')) {
        _lastAction = 'Undo action triggered from widget';
        _performUndo();
      } else if (url.contains('redo')) {
        _lastAction = 'Redo action triggered from widget';
        _performRedo();
      } else if (url.contains('brush')) {
        _lastAction = 'Brush action triggered from widget';
        _performBrushAction();
      } else if (url.contains('eraser')) {
        _lastAction = 'Eraser action triggered from widget';
        _performEraserAction();
      }
    });
  }

  void _performUndo() {
    // Here you would implement the actual undo functionality
    // This could involve:
    // 1. Bluetooth communication with ESP32
    // 2. Accessibility API calls (requires special permissions)
    // 3. Integration with Procreate's API if available
    print('Performing Undo action');
    
    // For demonstration, show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Undo action performed!')),
    );
  }

  void _performRedo() {
    print('Performing Redo action');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Redo action performed!')),
    );
  }

  void _performBrushAction() {
    print('Switching to Brush');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Switched to Brush!')),
    );
  }

  void _performEraserAction() {
    print('Switching to Eraser');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Switched to Eraser!')),
    );
  }

  void _testUndo() {
    _performUndo();
    setState(() {
      _lastAction = 'Undo action triggered from app';
    });
  }

  void _testRedo() {
    _performRedo();
    setState(() {
      _lastAction = 'Redo action triggered from app';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.brush,
              size: 100,
              color: Colors.deepPurple,
            ),
            const SizedBox(height: 20),
            const Text(
              'Procreate Helper Widget',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              _lastAction,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            const Text(
              'Test the widget functionality:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _testUndo,
                  icon: const Icon(Icons.undo),
                  label: const Text('Undo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _testRedo,
                  icon: const Icon(Icons.redo),
                  label: const Text('Redo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Instructions:\n\n'
                '1. Add the Procreate Helper widget to your Today View\n'
                '2. Tap widget buttons to control Procreate\n'
                '3. The widget will open this app and execute actions\n\n'
                'Note: For direct control without opening the app, additional permissions are required.',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}