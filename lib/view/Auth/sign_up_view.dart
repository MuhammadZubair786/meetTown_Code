import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../modelView/Auth/sign_up_controller.dart';
import '../../res/appcolors.dart';
import '../../res/components/custom_button.dart';
import '../../res/components/custom_text_from_field.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Consumer<SignUpController>(
      builder: (context, value, child) => Container(
        decoration: BoxDecoration(
            color: appColors.appBarBgWhite,
            borderRadius: BorderRadius.circular(10)),
        width: size.width * .98,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Create an Account!',
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextInputField(
                        title: 'First Name', controller: value.firstName),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextInputField(
                        title: 'Last Name', controller: value.lastName),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextInputField(
                        keyboard: TextInputType.phone,
                        title: 'Mobile No',
                        controller: value.MobileNumber),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextInputField(
                        title: 'Email Address', controller: value.email),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ChooseGenderWidget(
                    onpress: (v) {
                      value.SelectedGenderValue(v);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                appColors.primaryInputFieldBorder),
                            elevation: MaterialStateProperty.all<double>(
                                0), // Remove elevation
                            side: MaterialStateProperty.all<BorderSide>(
                                const BorderSide(
                                    color: appColors
                                        .primaryInputFieldBorder)), // Add border color
                          ),
                          onPressed: () async {
                            // try {
                            //   DateTime? pickedDate = await showDatePicker(
                            //       context: context,
                            //       initialDate:
                            //           DateTime.now(), //get today's date
                            //       firstDate: DateTime(
                            //           2000), //DateTime.now() - not to allow to choose before today.
                            //       lastDate: DateTime(2101));
                            //   // print(value.selectDate);
                            //   // print(pickedDate);
                            //   value.SelectedDateValue(pickedDate);
                            // } catch (e) {
                            //   print(e);
                            // }

                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: value.selectDate ??
                                  DateTime
                                      .now(), // Provide initial date or use current date
                              firstDate: DateTime(
                                  2000), // Example: set the first date to 2000
                              lastDate: DateTime(
                                  2100), // Example: set the last date to 2100
                            );

                            if (picked != null && picked != value.selectDate) {
                              value.SelectedDateValue(picked);
                            }
                          },
                          child: value.dateIsEmpty
                              ? const Text('YYYY-MM-DD')
                              : Text(value.selectDate
                                  .toString()
                                  .substring(0, 10))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextInputPasswordFieldForSignUp(
                        title: 'Password', controller: value.password),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextInputPasswordFieldForSignUp(
                        title: 'Repeat Password', controller: value.password),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(children: [
                    TextSpan(
                        text:
                            'By clicking below to register, you confirm that you agree to our',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: appColors.textSecondaryColor)),
                    TextSpan(
                        text: 'Terms & Conditions ',
                        style: Theme.of(context).textTheme.headline2),
                    TextSpan(
                        text: ' and you have read and understood our ',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: appColors.textSecondaryColor)),
                    TextSpan(
                        text: ' Privacy Policy ',
                        style: Theme.of(context).textTheme.headline2),
                  ])),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWidget(
                  width: size.width * .95,
                  heigth: 50,
                  title: 'SIGN UP',
                  foregroundColor: appColors.buttonTextSelectedPrimaryColor,
                  bgColor: appColors.textBlueColor,
                  selectedFgButtonColor: appColors.buttonTextPrimaryColor,
                  onpress: () {
                    value.SignUp(context);
                  }),
              const SizedBox(
                height: 10,
              ),
              const Text('Or Register With'),
              SizedBox(
                height: 10,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: appColors.textBlueColor,
                    child: FaIcon(
                      FontAwesomeIcons.facebookF,
                      color: appColors.iconPrimaryColor,
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: appColors.primaryRedColor,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      color: appColors.iconPrimaryColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ChooseGenderWidget extends StatelessWidget {
  final Function onpress;
  const ChooseGenderWidget({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          // Add Horizontal padding using menuItemStyleData.padding so it matches
          // the menu padding when button's width is not specified.
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          // Add more decoration..
        ),
        hint: const Text(
          'Choose Gender',
          style: TextStyle(fontSize: 14),
        ),
        items: ['Male', 'Female']
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
          return null;
        },
        onChanged: (value) {
          //Do something when selected item is changed.
          onpress(value);
        },
        onSaved: (value) {
          onpress(value);
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class DatePickerExample extends StatefulWidget {
  @override
  _DatePickerExampleState createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  late DateTime _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${_selectedDate.toString().substring(0, 10)}',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select Date'),
            )
          ],
        ),
      ),
    );
  }
}
