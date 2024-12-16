import 'package:demo_work_runtime/customDialog/block_success_dialog.dart';
import 'package:demo_work_runtime/customDialog/success_alert_dialog.dart';
import 'package:demo_work_runtime/customDialog/temporarily_block_success.dart';
import 'package:flutter/material.dart';

class BlockCardDialog extends StatefulWidget {
  final String description;
  final String buttonText;
  const BlockCardDialog({super.key, required this.description, required this.buttonText});

  @override
  _BlockCardDialog createState() => _BlockCardDialog();
}

class _BlockCardDialog extends State<BlockCardDialog> {
  bool _showSuccessIcon = false;

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
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.all(10),
      content: SizedBox(
        width: double.infinity,
        height: 310,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30,),
            const Text(
              'Are you sure!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15,),
            Text(
              // 'You want to continue and block the card temporarily, if it is done you cannot use your card for any purpose',
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: const Size(180, 50),
              ),
              onPressed: () {
                showDialog(context: context, builder: (BuildContext context) {
                  return const TemporarilyBlockSuccess(heading: 'Your Card has been Blocked Permanently!',);
                });
              },
              child: Text(
                widget.buttonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
