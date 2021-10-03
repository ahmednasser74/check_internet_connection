import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network_status_service.dart';

class CheckNetworkWidget extends StatelessWidget {
  final Widget child;

  const CheckNetworkWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final networkStatus = Provider.of<NetworkStatus>(context);
    return Scaffold(
      body: networkStatus == NetworkStatus.online
          ? child
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_outlined,
                    size: MediaQuery.of(context).size.width / 2,
                  ),
                  const Text(
                    'No Internet Connection',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
    );
  }
}
