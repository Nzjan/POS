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

    // Start the delayed navigation when the page is built
    Future.delayed(const Duration(seconds: 0), () {
      // Ensure context is still valid before navigating
      if (mounted) {
        Navigator.pushReplacement(
          context,
          //FluentPageRoute(builder: (context) =>  LoginScreen()),
          FluentPageRoute(builder: (context) =>  LoginScreen()),
        );
      }
    });
  }

// @override
//   void initState() {
//     super.initState();
//
//     // Show the dialog after a delay
//     Future.delayed(const Duration(seconds: 1), () {
//       if (mounted) {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) {
//             return
//              // LoginScreen();
//               HomeLayout();
//           },
//         );
//       }
//     });
//   }
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


//import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: WebSocketExample(),
//     );
//   }
// }
//
// class WebSocketExample extends StatefulWidget {
//   @override
//   _WebSocketExampleState createState() => _WebSocketExampleState();
// }
//
// class _WebSocketExampleState extends State<WebSocketExample> {
//   // WebSocket channel
//   final WebSocketChannel channel =
//       WebSocketChannel.connect(Uri.parse('ws://echo.websocket.org'));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('WebSocket Example')),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // Display incoming messages from WebSocket
//             StreamBuilder(
//               stream: channel.stream,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.active) {
//                   return Text('Received: ${snapshot.data}');
//                 } else {
//                   return Text('Waiting for message...');
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             // Send button to send message to WebSocket server
//             ElevatedButton(
//               onPressed: () {
//                 channel.sink.add('Hello WebSocket');
//               },
//               child: Text('Send Message'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     // Don't forget to close the connection when the widget is disposed
//     channel.sink.close();
//     super.dispose();
//   }
// }