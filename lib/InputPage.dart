import 'package:bmi_calculator/resuable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';

const bottomContainerHeight =80.0;
const activeCardColour =Color(0xFF1D1E33);
const inactiveCardColour =Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);

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

  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
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
                             ? activeCardColour
                             :inactiveCardColour,
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
                            ? activeCardColour
                            : inactiveCardColour,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          level: 'FEMALE'),
                    ),

                  ),
                ],
              ),
            ),
              Expanded(
              child: ReusableCard(colour:activeCardColour),
            ),
            Expanded(
              child: Row(
                children:   [
                  Expanded(
                    child: ReusableCard(colour:activeCardColour),
                  ),
                  Expanded(
                    child: ReusableCard(colour:activeCardColour),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}


