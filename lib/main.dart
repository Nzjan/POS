import 'package:RMS/home_layout.dart';
import 'package:RMS/login_screen.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      debugShowCheckedModeBanner: false,
      home: EntryPage(),
    );
  }
}

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 0), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          FluentPageRoute(builder: (context) =>  HomeLayout()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Container(
        height: 832,
        width: 1219,
        color: const Color(0xff161a23),
        child: Center(
          child: Image.asset(
            'assets/front_logo.png',
            width: 175,
            height: 260,
          ),
        ),
      ),
    );
  }
}
