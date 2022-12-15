import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override

  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds : 5)).then((_) =>
    Navigator.of(context).pushReplacementNamed('/main'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     color: Colors.blue.shade700,
      child: Center(
        child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_wqd1jwoz.json'),
       

      ), 

 

    );
    
  }
}