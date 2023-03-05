import 'package:flutter/material.dart';
import 'package:beigam_desktop/screens/components/app_scaffold.dart';

class OverviewPage extends StatelessWidget {
  final String title;
  const OverviewPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppBar(
        title: Text(title),
      ),
      body: Container(),
    );
  }
}
