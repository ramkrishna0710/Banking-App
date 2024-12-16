import 'package:demo_work_runtime/customDialog/block_card_dialog.dart';
import 'package:demo_work_runtime/customDialog/block_shopping_dialog.dart';
import 'package:demo_work_runtime/customDialog/block_success_dialog.dart';
import 'package:demo_work_runtime/customDialog/success_alert_dialog.dart';
import 'package:demo_work_runtime/customDialog/temporarily_block_card_dialog.dart';
import 'package:demo_work_runtime/switch/custom_switch.dart';
import 'package:demo_work_runtime/switch/card_setting_custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ControlCard extends StatefulWidget {
  const ControlCard({super.key});

  @override
  State<ControlCard> createState() => _TransactionLimitState();

}

class _TransactionLimitState extends State<ControlCard> {

  bool visible = false;
  bool editVisible = false;
  bool saveChanges = false;

  bool setCalender = false;
  bool setPin = false;
  bool setRePin = false;

  bool blockVisibility = false;
  bool status = false;
  bool isChecked = false;
  bool _isSwitchOn = false;

  bool cardSettingVisibility = false;

  @override
  void initState() {
    textEditingController.addListener(
            (){
          if(textEditingController.text.isNotEmpty) {
            saveChanges = true;
            setState(() {

            });
          } else {
            saveChanges = false;
            setState(() {

            });
          }
        }
    );
    super.initState();
  }
  final TextEditingController _dateController = TextEditingController();
  // final TextEditingController _pinController1 = TextEditingController();
  // final TextEditingController _pinController2 = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      setState(() {
        _dateController.text = formattedDate;
        setCalender = true;
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();

  // void _updateContinueButtonVisibility() {
  //   setState(() {
  //     saveChanges = setPin && setRePin && (_pinController1.text == _pinController2.text);
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control Card',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Empower your security',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Tailor your card experience with ease',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                  onTap: (){
                    visible = !visible;
                    if(!visible) {
                      editVisible = false;
                    }
                    setState(() {

                    });
                  },
                  child: setPinRowItem(Icons.password, 'Set PIN',visible , secondaryText: 'Change or your card PIN', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down)
              ),


              GestureDetector(
                onTap: () {
                  blockVisibility = !blockVisibility;
                  if(!blockVisibility) {
                    editVisible = false;
                  }
                  setState(() {

                  });
                },
                  child: blockRowItem(Icons.password, 'Block/Temporary Block', blockVisibility, secondaryText: 'Block Card in case of theft or loss', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down)
              ),


              GestureDetector(
                onTap: (){
                  cardSettingVisibility = !cardSettingVisibility;
                  if(!cardSettingVisibility) {
                    editVisible = false;
                  }
                  setState(() {

                  });
                },
                  child: cardSettingRowItem(Icons.password, 'Card Settings', cardSettingVisibility, secondaryText: 'Set Card Control', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down)),
            ],
          )
      ),
    );
  }

  Widget setPinRowItem(
      IconData leadingIcon,
      String primaryText,
      bool onClick,
      {
        String? secondaryText,
        IconData? iconLast,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Icon(
                          leadingIcon,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            primaryText,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if(secondaryText != null)
                            Text(
                              secondaryText,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (iconLast != null)
                    Icon(
                      iconLast,
                      color: Colors.grey,
                      size: 20,
                    ),
                ],
              ),
              const SizedBox(height: 20,),
              Visibility(
                visible: onClick,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date of Birth',
                      style: TextStyle(
                          fontSize: 12,
                        color: Colors.black26,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Visibility(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: AbsorbPointer(
                                child: TextFormField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Colors.black26, // Border color when not focused
                                          width: 1.5,
                                        ),
                                      ),
                                    hintText: 'DD/MM/YYYY',
                                    hintStyle: const TextStyle(
                                      color: Colors.black26,
                                    ),
                                    suffixIcon: const Icon(Icons.calendar_today, color: Colors.blue,)
                                  ),
                                  style: TextStyle(
                                    color: setCalender ? Colors.black :  Colors.black26,
                                    fontWeight: FontWeight.bold
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  inputFormatters: const [
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Title: Enter New PIN
                                  const Text(
                                    'Enter New PIN',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  PinCodeTextField(appContext: context, length: 4,),
                                  const SizedBox(height: 30),

                                  // Title: Re-enter New PIN
                                  const Text(
                                    'Re-enter New PIN',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  PinCodeTextField(appContext: context , length: 4,)
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: saveChanges ? (){} : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: saveChanges ? Colors.blue : Colors.indigo[100],
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )
                              ),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockRowItem(
      IconData leadingIcon,
      String primaryText,
      bool onClick,
      {
        String? secondaryText,
        IconData? iconLast,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Icon(
                          leadingIcon,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            primaryText,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if(secondaryText != null)
                            Text(
                              secondaryText,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (iconLast != null)
                    Icon(
                      iconLast,
                      color: Colors.grey,
                      size: 20,
                    ),
                ],
              ),
              const SizedBox(height: 20,),
              Visibility(
                visible: onClick,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Block Temporarily',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 4), // Add spacing between text for better readability
                              Text(
                                'Prevents transaction on the card',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: CustomSwitch(
                          value: _isSwitchOn,
                          onChanged: (value) {
                            setState(() {
                              _isSwitchOn = value;
                              if(_isSwitchOn) {
                                showDialog(context: context, builder: (BuildContext context) {
                                  return const TemporarilyBlockCardDialog(description: 'You want to continue and block the card temporarily, if it is done tou cannot use your card for any purpose', buttonText: 'Block temporarily',);
                                });
                              }
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Visibility(
                visible: onClick,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Block Permanent',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(height: 4), // Add spacing between text for better readability
                              Text(
                                'Block Card in case of theft or loss',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          )
                        ),
                      GestureDetector(
                        onTap: () {
                          showDialog(context: context, builder: (BuildContext context) {
                            return const BlockCardDialog(description: 'You want to block your card permanently, once its blocked you cannot unblock and use it in future',buttonText: 'Block permanently',);
                          });
                        },
                        child: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black26, size: 16.0,),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget cardSettingRowItem(
      IconData leadingIcon,
      String primaryText,
      bool onClick,
      {
        String? secondaryText,
        IconData? iconLast,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Icon(
                          leadingIcon,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            primaryText,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if(secondaryText != null)
                            Text(
                              secondaryText,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 10,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  if (iconLast != null)
                    Icon(
                      iconLast,
                      color: Colors.grey,
                      size: 20,
                    ),
                ],
              ),
              //MERCHANT OUTLET
              Visibility(
                visible: onClick,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Merchant Outlet',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Offline and POS transaction',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: CardSettingCustomSwitch(
                          value: true,
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // ONLINE SHOPPING
              Visibility(
                visible: onClick,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Online Shopping',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'E-commerce Websites and Apps',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: CardSettingCustomSwitch(
                          value: true,
                          onChanged: (value) {
                            setState(() {
                              status = value;
                              if(!status) {
                                showDialog(context: context, builder: (BuildContext context) {
                                  return const BlockShoppingDialog(heading: 'Online shopping has been Blocked',);
                                });
                              }
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // -- ATM WITHDRAWAL
              Visibility(
                visible: onClick,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ATM Withdrawal',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Prevents transaction on the card',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: CardSettingCustomSwitch(
                          value: true,
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // TAP AND PAY
              Visibility(
                visible: onClick,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(59, 5, 10, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tap and Pay',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Enable Contactless Payment',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                        child: CardSettingCustomSwitch(
                          value: true,
                          onChanged: (value) {
                            setState(() {

                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
