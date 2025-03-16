import 'package:flutter/cupertino.dart';

void main() {
  runApp(GlassesApp());
}

class GlassesApp extends StatelessWidget {
  const GlassesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(home: GlassesHomePage());
  }
}

class GlassesHomePage extends StatelessWidget {
  const GlassesHomePage({super.key});

  void _showModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Glasses Options'),
          message: Text('Choose an option'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('Option 1'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoActionSheetAction(
              child: Text('Option 2'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Glasses App')),
      child: Center(
        child: CupertinoButton(
          child: Text('Show Modal'),
          onPressed: () => _showModal(context),
        ),
      ),
    );
  }
}
