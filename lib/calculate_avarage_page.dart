import 'package:flutter/material.dart';
import 'package:grade_average_application/constants/app_constants.dart';
import 'package:grade_average_application/helper/data_helper.dart';
import 'package:grade_average_application/lesson_list.dart';
import 'package:grade_average_application/model/lesson.dart';
import 'package:grade_average_application/show_average.dart';

import 'credits_dropdown_widget.dart';
import 'letter_dropdown_widget.dart';

class CalculateAvaragePage extends StatefulWidget {
  const CalculateAvaragePage({super.key});

  @override
  State<CalculateAvaragePage> createState() => _CalculateAvaragePageState();
}

class _CalculateAvaragePageState extends State<CalculateAvaragePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedCredit1 = 1;
  double selectedLetter1 = 4;

  String lessonName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Constants.titleText,
              style: Constants.textStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: ShowAverage(
                      avarage: DataHelper.calculateAverage(),
                      lessonNumber: DataHelper.allAddedLessons.length),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: LessonList(
                onDismiss: (index) {
                  DataHelper.allAddedLessons.removeAt(index);
                  setState(() {});
                },
              ),
            ),
          ],
        ));
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.horizontalPadding,
            child: _buildTextFormField(),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding,
                  child: LetterDropdownWidget(
                    onSelectedLetter: (selectedLetter) {
                      selectedLetter1 = selectedLetter;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Constants.horizontalPadding,
                  child: CreditsDropdownWidget(
                    onSelectedCredits: (selectedCredit) {
                      selectedCredit1 = selectedCredit;
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  addLessonAndCalculateAverage();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Constants.mainColor,
                  size: 30,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Lesson Name",
        border: OutlineInputBorder(
            borderRadius: Constants.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Constants.mainColor.shade100.withOpacity(0.4),
      ),
      onSaved: (newValue) {
        setState(() {
          lessonName = newValue!;
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Enter Lesson Name";
        } else {
          return null;
        }
      },
    );
  }

  addLessonAndCalculateAverage() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var willAddLesson = Lesson(
          name: lessonName,
          letterValue: selectedLetter1,
          creditValue: selectedCredit1);
      DataHelper.addLesson(willAddLesson);
      setState(() {}); // LessonList widget'ı güncelle
    }
  }
}
