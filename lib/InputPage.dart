import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _State();
}

class _State extends State<InputPage> {

  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  GenderType? selectedGender;
  int height =180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress:(){
                        setState(() {
                          selectedGender =GenderType.male;
                        });
                      },
                        colour: selectedGender ==GenderType.male
                             ? kActiveCardColour
                             :kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          level: 'Male'),
                    ),

                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender =GenderType.female;
                        });
                      },
                        colour:selectedGender ==GenderType.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          level: 'FEMALE'),
                    ),

                  ),
                ],
              ),
            ),
              Expanded(
              child: ReusableCard(colour:kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged:(double newValue){
                      setState(() {
                        height =newValue.round();
                      });
                      },
                    ),
                  ],
                ),

              ),
            ),
            Expanded(
              child: Row(
                children:   [
                  Expanded(
                    child: ReusableCard(colour:kActiveCardColour),
                  ),
                  Expanded(
                    child: ReusableCard(colour:kActiveCardColour),
                  ),
                ],
              ),
            ),
            Container(
              color: kBottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}


