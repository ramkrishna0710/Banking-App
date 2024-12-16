import 'package:demo_work_runtime/customDialog/success_alert_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TransactionLimit extends StatefulWidget {
  const TransactionLimit({super.key});

  @override
  State<TransactionLimit> createState() => _TransactionLimitState();
}

class _TransactionLimitState extends State<TransactionLimit> {
  final FocusNode _focusNode = FocusNode();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  bool visible = false;
  bool editVisible = false;
  bool saveChanges = false;
  int index = -1;

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

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Limit',
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
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 0, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Set/Modify Limit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Manage limits to control spending for different types of transaction',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                onTap: (){
                  visible = !visible;
                  if(!visible) {
                    editVisible = false;
                  }
                  if(!editVisible) {

                  }
                  // print('visible $visible');
                  setState(() {

                  });
                },
                child: _buildRowItem(Icons.abc, 'Merchant outlet',visible, editVisible, saveChanges, secondaryText: 'Office and POS Translations', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down)
            ),
            buildRowItemAgain(Icons.shopping_cart,'Online Shopping', secondaryText: 'E-commerce WebSite and Apps', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            buildRowItemAgain(Icons.shopping_cart,'ATM Withdrawal', secondaryText: '', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            buildRowItemAgain(Icons.shopping_cart,'Tap and Pay', secondaryText: 'Enable Contactless Payment', iconLast: visible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
          ],
        )
      ),
    );
  }


  Widget _buildRowItem(
      IconData leadingIcon,
      String primaryText,
      bool onClick,
      bool editVisibleOnClick,
      bool saveChanges,
      {
    String? secondaryText,
    IconData? iconLast, // Optional parameter for the trailing icon
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
                              fontSize: 17,
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
              const SizedBox(height: 5,),
              Visibility(
                visible: onClick,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Max, Per transaction limit',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[400]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Column(
                          children: [
                            Container(
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
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'OMR ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black26
                                      ),
                                    ),
                                    const SizedBox(width: 2,),
                                    Expanded(
                                      child: TextFormField(
                                        onChanged: (value) {
                                          editVisible = true;
                                          setState(() {

                                          });
                                        },
                                        controller:
                                        textEditingController
                                        ,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                        ),
                                        decoration: const InputDecoration(
                                          hintText: '10000.00',
                                          hintStyle: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          border: InputBorder.none,
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    GestureDetector(
                                      onTap: (){
                                        editVisible = !editVisible;
                                        setState(() {

                                        });
                                      },
                                        child: Icon(editVisible ? Icons.close : Icons.edit, color: Colors.blue,)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
              ),
              Visibility(
                visible: editVisible,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                textEditingController.text = '5000';
                                index = 0;
                                setState(() {

                                });
                              },
                              child: Container(
                                  child: _omrSelectItem('5000', index == 0),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                textEditingController.text = '10000';
                                index = 1;
                                setState(() {

                                });
                              },
                              child: Container(
                                  child: _omrSelectItem('10000', index == 1),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            GestureDetector(
                              onTap: (){
                                textEditingController.text = '20000';
                                index = 2;
                                setState(() {

                                });
                              },
                              child: Container(
                                child: _omrSelectItem('20000', index == 2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Visibility(
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(context: context, builder: (BuildContext context) {
                                return const SuccessAlertDialog(heading: 'New limit set successfully!');
                              });
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => const SuccessAlertDialog()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: saveChanges ? Colors.blue : Colors.indigo[100],
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )
                            ),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
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


  Widget buildRowItemAgain(
      IconData leadingIcon,
      String primaryText,
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
                              fontSize: 17,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _omrSelectItem(
      String amount,
      bool color,
      ) {
    return Column(
      children: [
        Visibility(
          child: Container(
            decoration: BoxDecoration(
              color: color ? Colors.tealAccent[400] : Colors.white,
              border: Border.all(color: color ? Colors.grey[200]! : Colors.grey[200]!),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Text(
                'OMR $amount',
                style: TextStyle(
                  color: color ? Colors.white : Colors.black,
                  fontSize: 12
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
