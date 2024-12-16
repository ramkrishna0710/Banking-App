import 'package:flutter/cupertino.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextController extends StatelessWidget {
  final TextEditingController textEditingController;

  const PinCodeTextController({super.key, required this.textEditingController});




  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: true,
      obscuringCharacter: '*',
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 20,
        fieldWidth: 20,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      // errorAnimationController: errorController,
      controller: textEditingController,
      keyboardType: TextInputType.number,
      onCompleted: (value) {
      },
      onChanged: (value) {

      },
      beforeTextPaste: (text) {
        return true;
      },
    );;
  }
}
