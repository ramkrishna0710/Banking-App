import 'package:flutter/material.dart';

class SuccessAlertDialog extends StatefulWidget {
  final String heading;

  const SuccessAlertDialog({super.key, required this.heading});

  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessAlertDialog> {
  bool _showSuccessIcon = false;
  final bool isBlocked = false;

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
            Visibility(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(180, 50),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
