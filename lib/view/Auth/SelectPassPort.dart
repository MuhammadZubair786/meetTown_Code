import 'package:flutter/material.dart';
import 'package:meettown/res/appcolors.dart';
import 'package:meettown/res/components/custom_button.dart';
import 'package:meettown/view/BottomNavbar/BottomNavbar.dart';

class PassportPage extends StatefulWidget {
  @override
  _PassportPageState createState() => _PassportPageState();
}

class _PassportPageState extends State<PassportPage> {
  String selectedLanguage = 'English';
  String selectedProfession = 'Engineer';
  String selectNationalty = "Afghan";
  String selecteducation = 'No formal education';
  String selectchildren = 'None';
  String selectbody = 'Slim';
  String selectheight = 'Below 4 feet';
  String selectrelationShip = 'Single';

  List<String> educationOptions = [
    'No formal education',
    'Primary education',
    'Secondary education',
    'Vocational qualification',
    'Bachelor\'s degree',
    'Master\'s degree',
    'Doctorate or higher',
    'Other',
  ];

  List<String> heightOptions = [
    'Below 4 feet',
    '4 feet 0 inches',
    '4 feet 1 inch',
    '4 feet 2 inches',
    '4 feet 3 inches',
    '4 feet 4 inches',
    '4 feet 5 inches',
    '4 feet 6 inches',
    '4 feet 7 inches',
    '4 feet 8 inches',
    '4 feet 9 inches',
    '4 feet 10 inches',
    '4 feet 11 inches',
    '5 feet 0 inches',
    // Add more options as needed
  ];

  List<String> bodyOptions = [
    'Slim',
    'Athletic',
    'Average',
    'Curvy',
    'Muscular',
    'Overweight',
    'Obese',
    'Other',
  ];

  List<String> childrenOptions = [
    'None',
    '1',
    '2',
    '3',
    '4',
    '5 or more',
    'Prefer not to say',
  ];

  List<String> relationshipOptions = [
    'Single',
    'In a relationship',
    'Engaged',
    'Married',
    'Separated',
    'Divorced',
    'Widowed',
    'Complicated',
    'Other',
  ];

  List<String> nationalityOptions = [
    'Afghan',
    'Albanian',
    'Algerian',
    'American',
    'Andorran',
    'Angolan',
    'Antiguans',
    'Argentinean',
    'Armenian',
    'Australian',
    'Austrian',
    'Azerbaijani',
    'Bahamian',
    'Bahraini',
    'Bangladeshi',
    'Barbadian',
    'Barbudans',
    'Batswana',
    'Belarusian',
    'Belgian',
    'Belizean',
    'Beninese',
    'Bhutanese',
    'Bolivian',
    'Bosnian',
    'Brazilian',
    'British',
    'Bruneian',
    'Bulgarian',
    'Burkinabe',
    'Burmese',
    'Burundian',
    'Cambodian',
    'Cameroonian',
    'Canadian',
    'Cape Verdean',
    'Central African',
    'Chadian',
    'Chilean',
    'Chinese',
    'Colombian',
    'Comoran',
    'Congolese',
    'Costa Rican',
    'Croatian',
    'Cuban',
    'Cypriot',
    'Czech',
    'Danish',
    'Djibouti',
    'Dominican',
    'Dutch',
    'East Timorese',
    'Ecuadorean',
    'Egyptian',
    'Emirian',
    'Equatorial Guinean',
    'Eritrean',
    'Estonian',
    'Ethiopian',
    'Fijian',
    'Filipino',
    'Finnish',
    'French',
    'Gabonese',
    'Gambian',
    'Georgian',
    'German',
    'Ghanaian',
    'Greek',
    'Grenadian',
    'Guatemalan',
    'Guinea-Bissauan',
    'Guinean',
    'Guyanese',
    'Haitian',
    'Herzegovinian',
    'Honduran',
    'Hungarian',
    'I-Kiribati',
    'Icelander',
    'Indian',
    'Indonesian',
    'Iranian',
    'Iraqi',
    'Irish',
    'Israeli',
    'Italian',
    'Ivorian',
    'Jamaican',
    'Japanese',
    'Jordanian',
    'Kazakhstani',
    'Kenyan',
    'Kittian and Nevisian',
    'Kuwaiti',
    'Kyrgyz',
    'Laotian',
    'Latvian',
    'Lebanese',
    'Liberian',
    'Libyan',
    'Liechtensteiner',
    'Lithuanian',
    'Luxembourger',
    'Macedonian',
    'Malagasy',
    'Malawian',
    'Malaysian',
    'Maldivan',
    'Malian',
    'Maltese',
    'Marshallese',
    'Mauritanian',
    'Mauritian',
    'Mexican',
    'Micronesian',
    'Moldovan',
    'Monacan',
    'Mongolian',
    'Moroccan',
    'Mosotho',
    'Motswana',
    'Mozambican',
    'Namibian',
    'Nauruan',
    'Nepalese',
    'New Zealander',
    'Nicaraguan',
    'Nigerian',
    'Nigerien',
    'North Korean',
    'Northern Irish',
    'Norwegian',
    'Omani',
    'Pakistani',
    'Palauan',
    'Panamanian',
    'Papua New Guinean',
    'Paraguayan',
    'Peruvian',
    'Polish',
    'Portuguese',
    'Qatari',
    'Romanian',
    'Russian',
    'Rwandan',
    'Saint Lucian',
    'Salvadoran',
    'Samoan',
    'San Marinese',
    'Sao Tomean',
    'Saudi',
    'Scottish',
    'Senegalese',
    'Serbian',
    'Seychellois',
    'Sierra Leonean',
    'Singaporean',
    'Slovakian',
    'Slovenian',
    'Solomon Islander',
    'Somali',
    'South African',
    'South Korean',
    'Spanish',
    'Sri Lankan',
    'Sudanese',
    'Surinamer',
    'Swazi',
    'Swedish',
    'Swiss',
    'Syrian',
    'Taiwanese',
    'Tajik',
    'Tanzanian',
    'Thai',
    'Togolese',
    'Tongan',
    'Trinidadian or Tobagonian',
    'Tunisian',
    'Turkish',
    'Tuvaluan',
    'Ugandan',
    'Ukrainian',
    'Uruguayan',
    'Uzbekistani',
    'Venezuelan',
    'Vietnamese',
    'Welsh',
    'Yemenite',
    'Zambian',
    'Zimbabwean',
  ];

  List<String> languageOptions = [
    'English',
    'Urdu',
    'Spanish',
    'French',
    'German',
    'Chinese',
    'Japanese',
    'Arabic',
    'Russian',
    'Italian',
    'Portuguese',
    'Hindi',
    'Bengali',
    'Punjabi',
    'Telugu',
    'Marathi',
    'Tamil',
    'Turkish',
    'Korean',
    'Vietnamese',
    'Polish',
    'Ukrainian',
    'Thai',
    'Romanian',
    'Greek',
    'Dutch',
    'Hungarian',
    'Czech',
    'Swedish',
    'Danish',
    'Finnish',
    'Norwegian',
    'Indonesian',
    'Malay',
    'Filipino',
    'Slovak',
    'Bulgarian',
    'Croatian',
    'Serbian',
    'Slovenian',
    'Lithuanian',
    'Estonian',
    'Latvian',
    'Georgian',
    'Farsi',
    'Hebrew',
    'Maltese',
    'Icelandic',
    'Welsh',
    'Irish',
    'Basque',
    'Catalan',
    'Galician',
    'Scots Gaelic',
  ];

  List<String> professionOptions = [
    'Engineer',
    'Doctor',
    'Teacher',
    'Artist',
    'Lawyer',
    'Chef',
    'Software Developer',
    'Accountant',
    'Architect',
    'Designer',
    'Writer',
    'Musician',
    'Actor',
    'Entrepreneur',
    'Photographer',
    'Scientist',
    'Dentist',
    'Nurse',
    'Psychologist',
    'Police Officer',
    'Firefighter',
    'Pilot',
    'Journalist',
    'Athlete',
    'Electrician',
    'Mechanic',
    'Plumber',
    'Carpenter',
    'Farmer',
    'Salesperson',
    'Marketing Specialist',
    'Consultant',
    'Real Estate Agent',
    'Financial Advisor',
    'HR Manager',
    'Social Worker',
    'Translator',
    'Librarian',
    'Veterinarian',
    'Fitness Trainer',
    'Pharmacist',
    'Biologist',
    'Geologist',
    'Surveyor',
    'Professor',
    'Economist',
    'Law Enforcement Officer',
    'Graphic Designer',
    'Interior Designer',
    'Web Developer',
    'Data Analyst',
    'Project Manager',
    'Fashion Designer',
    'Event Planner',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: appColors.textBlueColor,
        title: Text('My Passport'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/imgs/log-regis-bg.jpg'),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Language:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      selectedProfession = newValue!;
                    });
                  },
                  items: languageOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                       child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Profession:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Set border radius
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2.0), // Set border width and color
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),

                  value: selectedProfession,
                  onChanged: (newValue) {
                    setState(() {
                      selectedProfession = newValue!;
                    });
                  },
                  items: professionOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  dropdownColor: Color(0xff5a584b),
                  // Set background color of dropdown menu
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Nationalty:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectNationalty,
                  onChanged: (newValue) {
                    setState(() {
                      selectNationalty = newValue!;
                    });
                  },
                  items: nationalityOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Nationalty:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectNationalty,
                  onChanged: (newValue) {
                    setState(() {
                      selectNationalty = newValue!;
                    });
                  },
                  items: nationalityOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                       child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select RelationShip:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectNationalty,
                  onChanged: (newValue) {
                    setState(() {
                      selectNationalty = newValue!;
                    });
                  },
                  items: nationalityOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select RelationShip:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selectrelationShip,
                  onChanged: (newValue) {
                    setState(() {
                      selectrelationShip = newValue!;
                    });
                  },
                  items: relationshipOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                     child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                SizedBox(height: 20),
                Text(
                  'Select Education:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  isDense: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  ),
                  value: selecteducation,
                  onChanged: (newValue) {
                    setState(() {
                      selecteducation = newValue!;
                    });
                  },
                  items: educationOptions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                       child: Text(value,style: TextStyle(color: Colors.white),),
                    );
                  }).toList(),
                    dropdownColor: Color(0xff5a584b),
                ),
                Center(
                child: Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButtonWidget(
                          title: 'Previous',
                          foregroundColor: appColors.iconPrimaryColor,
                          bgColor: appColors.textBlueColor,
                          selectedFgButtonColor: appColors.iconPrimaryColor,
                          onpress: () {}),
                      CustomButtonWidget(
                          title: 'Next',
                          foregroundColor: appColors.iconPrimaryColor,
                          bgColor: appColors.textBlueColor,
                          selectedFgButtonColor: appColors.iconPrimaryColor,
                          onpress: () {
                             Navigator.push(context,
          MaterialPageRoute(builder: (context) => CustomNavbar()));
                          }),
                    ],
                  ),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
