import 'package:cohot2/reusable_widget.dart/Reused_container.dart';
import 'reusable_widget.dart/blinkingTextWidget.dart';
import 'universal_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlinkingText(
                text: "Stephen",
                size: 50,
                color1: Colors.cyan,
                color2: Colors.purple,
              ),
              ReusedContainer(
                defaultColor: Colors.blueAccent,
                singleTapColor: Colors.greenAccent,
                longPressColor: Colors.cyanAccent,
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                radius: 20,
              ),
              ReusedContainer(
                defaultColor: Colors.blueAccent,
                singleTapColor: Colors.greenAccent,
                longPressColor: Colors.cyanAccent,
                height: MediaQuery.sizeOf(context).height / 4,
                width: MediaQuery.sizeOf(context).width / 2,
                radius: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
