import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/screens/controller.dart';
import 'package:surveyapp/utils/_index.dart';

class FarmSizesScreen extends StatefulWidget {
  const FarmSizesScreen({
    super.key,
    required this.strings,
    required this.questions,
    required this.surveyResults,
  });

  final Strings strings;
  final List<Question> questions;
  final Box surveyResults;

  @override
  State<FarmSizesScreen> createState() => _FarmSizesScreenState();
}

class _FarmSizesScreenState extends State<FarmSizesScreen> {
  final TextEditingController sizeController = TextEditingController();
  String? farmSize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 360,
                  child: Image(
                    image: AssetImage(
                      'lib/assets/farm.png',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 50,
                  ),
                  child: Text(
                    widget.strings.en.qSizeOfFarm,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 35,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 50,
                  ),
                  child: TextFormField(
                    controller: sizeController,
                    cursorColor: kSecondaryColor,
                    decoration: InputDecoration(
                      filled: true,
                      //focusColor: kPrimaryBackgroundColor,
                      fillColor: kPrimaryBackgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: kSecondaryColor,
                        ),
                      ),
                    ),
                    validator: (val) => val!.isEmpty ? 'Enter farm size' : null,
                    onChanged: (val) {
                      setState(() {
                        farmSize = val.trim();
                      });
                    },
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.2,
                  width: MediaQuery.of(context).size.width * 1,
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                    right: 20,
                    bottom: 300,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor, // Background color
                      ),
                      onPressed: () {
                        /*  widget.surveyResults.put(
                          widget.questions[2].id,
                          widget.questions[2].answerType,
                        ); */
                        showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                            title: const Text(
                              'Thank you!',
                              textAlign: TextAlign.center,
                            ),
                            content: const Text(
                              'All questions have been filled',
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 15,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 90,
                                          right: 10,
                                        ),
                                        child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(
                                              Colors.green,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder: (
                                                  BuildContext context,
                                                ) =>
                                                    const ControllerScreen(),
                                              ),
                                              ModalRoute.withName('/'),
                                            );
                                          },
                                          child: const Text(
                                            'Okay',
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
