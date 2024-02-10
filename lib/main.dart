import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/task_list_screen.dart';
import 'package:provider_sm/timer_provider.dart';


void main() {
  runApp(TaskTimerApp());
}

class TaskTimerApp extends StatelessWidget {
  const TaskTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TimerProvider(),
      child: const MaterialApp(
        home: TaskListScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // return ChangeNotifierProvider(
//     //     create: (_) => CounterProvider(),
//     //   child: MaterialApp(
//     //     title: 'Provider Demo',
//     //     theme: ThemeData(
//     //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//     //       useMaterial3: true,
//     //     ),
//     //     home: const MyHomePage(title: 'Provider'),
//     //   ),
//     // ); // Single Provider
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (_) => SampleProvider()),
//
//         ],
//       child: MaterialApp(
//         title: 'Provider Demo',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//           useMaterial3: true,
//         ),
//         home: SamplePage(title: 'Provider'),
//       ),
//     ); //
//   }
// }
