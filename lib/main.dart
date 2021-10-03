import 'package:check_internet_connection/check_network_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'network_status_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) =>
              NetworkStatusService().networkStatusController.stream,
          initialData: NetworkStatus.offline,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CheckNetworkScreen(),
      ),
    );
  }
}

class CheckNetworkScreen extends StatelessWidget {
  const CheckNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CheckNetworkWidget(
      child: Center(
        child: Text(
          'I am Online',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

