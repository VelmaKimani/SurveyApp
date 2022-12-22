// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/utils/_index.dart';

class NameScreen extends StatefulWidget {
  NameScreen({
    super.key,
    required this.strings,
    required this.questions,
    required this.surveyResults,
  });

  final Strings strings;
  final List<Question> questions;
  final Box surveyResults;

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController nameController = TextEditingController();
  String? name;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 370,
            child: Image(
              image: AssetImage(
                'lib/assets/farmer.jpg',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 50,
            ),
            child: Text(
              widget.strings.en.qFarmerName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
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
              controller: nameController,
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
              validator: (val) => val!.isEmpty ? 'Enter the name' : null,
              onChanged: (val) {
                setState(() {
                  name = val.trim();
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
                  /* widget.surveyResults.put(
                                widget.questions[1].id,
                                widget.questions[1].answerType,
                              ); */

                  Navigator.of(context).pushNamed(
                    SurveyAppRouter.genderRoute,
                    arguments: [
                      widget.questions,
                      widget.strings,
                      widget.surveyResults
                    ],
                  );
                },
                child: const Text(
                  'Next',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
