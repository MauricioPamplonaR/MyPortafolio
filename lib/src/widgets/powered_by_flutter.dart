import 'package:flutter/material.dart';

class PoweredByFlutter extends StatelessWidget {
  const PoweredByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          
          FlutterLogo(size: 26),
          SizedBox(width: 10,),
          const Text('Powered by Flutter'),
          SizedBox(width: 8,)
      
        ],
      ),
    );
  }
}