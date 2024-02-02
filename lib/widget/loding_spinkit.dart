import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class spinkit extends StatelessWidget {
  const spinkit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: Colors.black,
      size: 50,
    ));
  }
}