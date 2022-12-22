import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:surveyapp/models/_index.dart';
import 'package:surveyapp/utils/_index.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({
    super.key,
    required this.strings,
    required this.questions,
    required this.surveyResults,
  });

  final Strings strings;
  final List<Question> questions;
  final Box surveyResults;

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? genderValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 270,
              child: Image(
                image: AssetImage(
                  'lib/assets/gender.png',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                //vertical: 10,
                horizontal: 50,
              ),
              child: Text(
                widget.strings.en.qFarmerGender,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 35,
                  color: kSecondaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                cursorColor: Colors.black,
                //controller: nameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade400,
                ),
                onChanged: (farmerName) {
                  setState(() {
                    //name = farmerName;
                  });
                },
              ),
            ),
            Column(
              children: widget.questions[1].options
                  .map(
                    (options) => Center(
                      child: RadioListTile(
                        focusNode: FocusNode(),
                        selectedTileColor: Colors.red,
                        toggleable: true,
                        title: Text(options.value),
                        value: options.displayText,
                        groupValue: genderValue,
                        onChanged: (gender) {
                          setState(() {
                            genderValue = gender.toString();
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor, // Background color
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      SurveyAppRouter.farmSizeRoute,
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
      ),
    );
  }
}
