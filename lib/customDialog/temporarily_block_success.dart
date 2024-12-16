import 'package:demo_work_runtime/screen/home.dart';
import 'package:flutter/material.dart';

class TemporarilyBlockSuccess extends StatefulWidget {
  final String heading;

  const TemporarilyBlockSuccess({super.key, required this.heading});

  @override
  _TemporarilyBlockSuccess createState() => _TemporarilyBlockSuccess();
}

class _TemporarilyBlockSuccess extends State<TemporarilyBlockSuccess> {
  bool _showSuccessIcon = false;
  bool isBlocked = false; // Add the isBlocked variable

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSuccessIcon = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        width: 327,
        height: 290,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            if (_showSuccessIcon)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 70,
              )
            else
              const CircularProgressIndicator(
                color: Colors.green,
              ),
            const SizedBox(height: 30),
            Text(
              widget.heading, // Use widget.heading to access the heading
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(180, 50),
              ),
              onPressed: () {
                // Close the dialog first
                Navigator.of(context).pop();

                // Use Future.microtask to schedule navigation after the current frame
                Future.microtask(() {
                  // Now navigate to the new screen, passing `isBlocked` to `Home`
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(isBlocked: false, isShoppingBlocked: false,),
                    ),
                  );
                });
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
