import 'dart:io';
import'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sf_p/giffy.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAcPRw8FyfdFyH1I8A7FXc0-126jhmEQXs',
          appId: '1:766401696299:android:26381addd144730eea906e',
          messagingSenderId: '766401696299',
          projectId: 'firstproject-bfc78'))
  : await Firebase.initializeApp();

  runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController  _nameController = TextEditingController();
  TextEditingController  _emailController = TextEditingController();
  TextEditingController  _phoneNumberController = TextEditingController();
  TextEditingController  _addressController = TextEditingController();
  TextEditingController  _linkedInController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _linkedInController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Build your CV',style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.deepPurple.shade600,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      color: Colors.white,
                      height: 500,
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Personal Info',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                             controller: _nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Enter your name',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              )
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Enter your Email',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              )
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value!)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              labelText: 'Enter your phone number',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              )
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (!RegExp(r'^[0-9]{10}$').hasMatch(value!)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _addressController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.home),
                                labelText: 'Enter your address',
                                labelStyle: TextStyle(
                                  color: Colors.deepPurple,
                                )
                            ),
                          ),
                          SizedBox(height: 10.0),
                          TextField(
                            controller: _linkedInController,
                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.link),
                              labelText: 'Enter the linked URL',
                                labelStyle: TextStyle(
                                  color: Colors.deepPurple,
                                )
                            ),
                            keyboardType: TextInputType.url,
                          ),
                        ],
                      ),
                    ),
                  ),

SizedBox(height: 25,),
                  Card(
                    elevation: 5,
                    child: Container(
                      color: Colors.white,
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 158.0),
                            child: Text("About",style:TextStyle(color: Colors.deepPurple,fontSize: 20,fontWeight: FontWeight.bold),),
                          )
                          ,
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 68.0),
                            child: Text("Describe yourself",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                          ),
                          TextField(
                            controller: _descriptionController,
                             maxLines:10,
                            decoration: InputDecoration(
                            hintText: "I'd describe myself as mindful ,responsive , and focused.In my most recent role I helped lead the transition to a new software system , Being  mindful that many team members were uncomfortable changing from their familiar system..",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.deepPurple),
                              )
                            )
                          )
                        ]
                      ),
                    ),
                  )
                  ,SizedBox(height: 20,),


                  ElevatedButton(
                    onPressed: () {


                      if(_nameController.text.isEmpty || _descriptionController.text.isEmpty || _linkedInController.text.isEmpty || _emailController.text.isEmpty || _phoneNumberController.text.isEmpty || _addressController.text.isEmpty ){
                        Fluttertoast.showToast(msg: "Please Fill all the details"
                        ,gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.black,);

                      }
else{

  //THE VALUES STORE IN THE REALTIME DATABSE IN FIREBASE

                        final database=FirebaseDatabase.instance.ref('${_phoneNumberController.text.toString()}');
database.child('personalinfo').set({
  'name':"${_nameController.text.toString()}",
  'email':"${_emailController.text.toString()}",
  'phone':"${_phoneNumberController.text.toString()}",
  'address':"${_addressController.text.toString()}",
  'linkedin':"${_linkedInController.text.toString()}",
  'description':"${_descriptionController.text.toString()}",
}).then((value) => Fluttertoast.showToast(msg: "Data Stored",gravity: ToastGravity.BOTTOM,backgroundColor: Colors.black,));


                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return NextPage(key: GlobalKey(),name:_nameController.text.toString(),phone:_phoneNumberController.text.toString(),email:_emailController.text.toString(),address:_addressController.text.toString(),description:_descriptionController.text.toString(),linkedin:_linkedInController.text.toString());
                        }));

// Your button action
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Save & Next',style: TextStyle(color: Colors.white),),
                        Icon(Icons.forward, color: Colors.white),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blue,  // Change text color as desired
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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





// This is the Next page of my app Education
final TextEditingController controllers1 = TextEditingController();
final TextEditingController controllers2 = TextEditingController();
final TextEditingController controllers3 = TextEditingController();
final TextEditingController controllers4 = TextEditingController();
final TextEditingController controllers5 = TextEditingController();
final TextEditingController controllers6 = TextEditingController();
class NextPageEducation extends StatefulWidget {
  final String phone;
  final String name;
  final String email;
  final String address;
  final String link;
  final String description;
  final String programming;
  final String work;
  final String skills;
  final String hobby;
  final String courses;
  NextPageEducation({Key?key,required this.phone,required this.name,required this.email,required this.address,required this.link, required this.description,required this.programming,required this.work,required this.skills, required this.hobby,required this.courses}) : super(key: key);
  @override
  State<NextPageEducation> createState() => _NextPageState();
}

class _NextPageState extends State<NextPageEducation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade600,
        title: Text('Education',style: TextStyle(color: Colors.white),),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Container(

                    height: 550,
                    width: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Education Qualification',  style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Degree",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                           controller: controllers1,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.school,color: Colors.deepPurple,),
                              labelText: 'B.Tech CS',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("School & College ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controllers2,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.school,color: Colors.deepPurple,),
                              labelText: 'Indian Institute of Information Technology, Panipat',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )

                  ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Percentage / CGPA ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controllers3,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.percent,color: Colors.deepPurple,),
                              labelText: '89.72% Or 8.97 CGPA',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                                ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),

                        ),
                        SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25,),
                Card(
                  elevation: 5,
                  child: Container(
                    height: 120,
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
Padding(
  padding: const EdgeInsets.only(right: 68.0),
  child: Text("Extra curricular activity",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
),
                          TextField(
                              controller: controllers4,
                              decoration: InputDecoration(
                              hintText: "Photoshop,Filmora,Photography",
                                  prefixIcon: Icon(Icons.video_call,color: Colors.deepPurple,),
                                   border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  )
                              )
                          )
                        ]
                    ),
                  ),
                )
                ,SizedBox(height: 20,),

                Card(
                  elevation: 5,
                  child: Container(
                    height: 300,
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(right: 68.0),
                            child: Text("Training/Internship",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 178.0),
                            child: Text("Role",style: TextStyle(color: Colors.black),),
                          ),
                          TextField(
                              controller: controllers5,
                              decoration: InputDecoration(
                                  hintText: "Flutter Developer",
                                  prefixIcon: Icon(Icons.model_training,color: Colors.deepPurple,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  )
                              )
                          )
                          ,
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 178.0),
                            child: Text("Company",style: TextStyle(color: Colors.black),),
                          ),
                          TextField(
                              controller: controllers6,
                              decoration: InputDecoration(
                                  hintText: "JVS Tech",
                                  prefixIcon: Icon(Icons.home_max,color: Colors.deepPurple,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  )
                              )
                          )
                        ]
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        // Your button action
                      Navigator.pop(context);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Back',style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_back, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () {
                        if(controllers1.text.isEmpty || controllers2.text.isEmpty || controllers3.text.isEmpty || controllers4.text.isEmpty || controllers5.text.isEmpty || controllers6.text.isEmpty){
                          Fluttertoast.showToast(msg: "Please fill all the fields",gravity: ToastGravity.CENTER);

                        }
                        else
                          {

                            final database = FirebaseDatabase.instance.ref('${widget.phone}');
                            database.child('education').set({
                              'degree': "${controllers1.text.toString()}",
                              'School': "${controllers2.text.toString()}",
                              'marks': "${controllers3.text.toString()}",
                              'extra': "${controllers4.text.toString()}",
                              'Training': "${controllers5.text.toString()}",
                              'company':"${controllers6.text.toString()}",

                            }).then((value) => Fluttertoast.showToast(msg: "Data saved",gravity: ToastGravity.CENTER));
                            // Your button action




                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return  NextPagepersonaldetails(key: GlobalKey(),phone: widget.phone,name: widget.name,address: widget.address,email:widget.email
                                  ,link: widget.link,description:widget.description, programming:controller1.text.toString(),work:controller2.text.toString(),skills:controller3.text.toString(),hobby:controller4.text.toString(),courses:controller5.text.toString());

                            }));

                          }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Save & Next',style: TextStyle(color: Colors.white),),
                          Icon(Icons.forward, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
                  ],
                )


              ],

            ),
          ),
        ),
      ),
    );
  }
}
























// This is the Next page of my app  Skills & Course
final TextEditingController controller1 = TextEditingController();
final TextEditingController controller2 = TextEditingController();
final TextEditingController controller3 = TextEditingController();
final TextEditingController controller4 = TextEditingController();
final TextEditingController controller5 = TextEditingController();
class NextPage extends StatefulWidget {

  final String name;
  final String email;
  var  phone;
  final String address;
  final String linkedin;
  final String description;
   NextPage({Key? key, required this.name,required this.phone,required this.email,required this.address,required this.description,required this.linkedin}) : super(key: key);
  @override
  State<NextPage> createState() => NextPageState();

}

class NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade600,
        title: Text('Skills & Courses',style: TextStyle(color: Colors.white),),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Container(

                    height: 550,
                    width: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Programming languages & Skills',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Enter Programming language",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controller1,

                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.computer,color: Colors.deepPurple,),
                              labelText: 'C,C+...',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Current working on ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controller2,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.code,color: Colors.deepPurple,),
                              labelText: 'Flutter,PHP..',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Enter all your skills ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controller3,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.work,color: Colors.deepPurple,),
                              labelText: 'Enter your Skills',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),

                        ),
                        SizedBox(height: 12.0),
                        Text("Enter your Hobbies ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: controller4,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.music_note,color: Colors.deepPurple,),
                              labelText: 'Travelling,Music..',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25,),
                Card(
                  elevation: 5,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 168.0),
                            child: Text("Courses",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),),
                          ),
                          TextField(
                              controller: controller5,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.book,color: Colors.deepPurple,),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(color: Colors.deepPurple),

                                  )
                              )
                          )
                        ]
                    ),
                  ),
                )
                ,SizedBox(height: 20,),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        // Your button action
                        Navigator.pop(context);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Back',style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_back, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () {


                        if(controller1.text.isEmpty || controller2.text.isEmpty || controller3.text.isEmpty || controller4.text.isEmpty || controller5.text.isEmpty){
                          Get.snackbar("Error", "Please fill all the fields");
                        }
                        else
                          {
                            final database=FirebaseDatabase.instance.ref('${widget.phone}');
                            database.child('skills').update({
                              'pl':"${controller1.text.toString()}",
                              'work':"${controller2.text.toString()}",
                              'skill':"${controller3.text.toString()}",
                              'hobby':"${controller4.text.toString()}",
                              'course':"${controller5.text.toString()}",
                            }).then((value) => Fluttertoast.showToast(msg: "Data Stored",gravity: ToastGravity.BOTTOM,backgroundColor: Colors.black,));
                            // Your button action
Navigator.push(context,MaterialPageRoute(builder: (context) => NextPageEducation(key: GlobalKey(),phone: widget.phone,name: widget.name,address: widget.address,email:widget.email
           ,link: widget.linkedin,description:widget.description, programming:controller1.text.toString(),work:controller2.text.toString(),skills:controller3.text.toString(),hobby:controller4.text.toString(),courses:controller5.text.toString(),),));


                          }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Save & Next',style: TextStyle(color: Colors.white),),
                          Icon(Icons.forward, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
                  ],
                )


              ],

            ),
          ),
        ),
      ),
    );
  }
}

























//This is the code for the Personal Details

final TextEditingController dobController = TextEditingController();
final TextEditingController nationController = TextEditingController();
final TextEditingController genderController = TextEditingController();
final TextEditingController languageController = TextEditingController();
final TextEditingController maritalController = TextEditingController();

class NextPagepersonaldetails extends StatefulWidget {
@override



final String phone;
final String name;
final String email;
final String address;
final String link;
final String description;
final String programming;
final String work;
final String skills;
final String hobby;
final String courses;

NextPagepersonaldetails({Key?key,required this.phone,required this.name,required this.email,required this.address,required this.link, required this.description,required this.programming,required this.work,required this.skills, required this.hobby,required this.courses}) : super(key: key);
State<NextPagepersonaldetails> createState() => NextPageStates();
}

class NextPageStates extends State<NextPagepersonaldetails> {
  Rx<XFile>? _selectedImage = Rx<XFile>(XFile(''));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade600,
        title: Text('Personal Details',style: TextStyle(color: Colors.white),),
      ),
      body:
      Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 5,
                  child: Container(

                    height: 600,
                    width: 550,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Date of Birth ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
 controller: dobController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_month,color: Colors.deepPurple,),
                              labelText: '27/12/2002',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Nationality ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: nationController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.flag,color: Colors.deepPurple,),
                              labelText: 'Indian',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text("Gender",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: genderController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.man,color: Colors.deepPurple,),
                              labelText: 'Male / Female ',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),

                        ),
                        SizedBox(height: 12.0),
                        Text("Languages ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: languageController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.language,color: Colors.deepPurple,),
                              labelText:'Hindi , Gujarati , English',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text("Marital Status ",style: TextStyle(color: Colors.grey.shade600),),
                        TextField(
                          controller: maritalController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.group,color: Colors.deepPurple,),
                              labelText:'Unmarried / married',
                              labelStyle: TextStyle(
                                color: Colors.deepPurple,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )

                          ),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 25,),


                Card(
                  elevation: 5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      color: Colors.white,
                      width: 300,
                      height: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              //Image Insertion Code here in this project is  working
                             InkWell(
                                 onTap: (){
                                   uploadImage();
                                 },
                                 child: Card(
                                   elevation: 5,
                                   child: Container(child: Center(child: Text("Select Image",style: TextStyle(color: Colors.black,fontSize:15),)),width: 70,height: 100,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),),
                                 )),

                              SizedBox(width: 20),

                              // Use ternary operator or a function to conditionally display the widget
                              _selectedImage?.value != null
                                  ? Obx(
                                    ()=> CircleAvatar(
                                  radius: 80,

                                  backgroundImage:
                                  FileImage(File(_selectedImage!.value!.path)),
                                ),
                              )

                                  : Text('No image selected'),
                            ],
                          ),
                          Text("It is also necessary to take into account a size of passport photo in kilobytes \n it should not exceed 240 KB. Pixel size of passport photo \n should be 600*600 pixels\n  (i.e 2*2 inch at 300 DPI)")
                        ],
                      ),
                    ),
                  ),
                )



                ,SizedBox(height: 20,),


                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () {
                        // Your button action
                        Navigator.pop(context);

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Back',style: TextStyle(color: Colors.white),),
                          Icon(Icons.arrow_back, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: () {




Navigator.push(context,MaterialPageRoute(builder: (context){
  return endpage(key: GlobalKey(),phone: widget.phone,name: widget.name,address: widget.address,email:widget.email
      ,link: widget.link,description:widget.description, programming:controller1.text.toString(),work:controller2.text.toString(),skills:controller3.text.toString(),hobby:controller4.text.toString(),courses:controller5.text.toString(),dob:dobController.text.toString(),gender:genderController.text.toString(),language:languageController.text.toString(),nation:nationController.text.toString(),marital:maritalController.text.toString(),image: _selectedImage!.value!.path);
}));

                        // Your button action
if(dobController.text.isEmpty|| genderController.text.isEmpty|| languageController.text.isEmpty|| nationController.text.isEmpty)
    {
      Get.snackbar(
          "Warning", "Please fill all the fields", colorText: Colors.white,
          backgroundColor: Colors.black);
    }else
   {

     final database = FirebaseDatabase.instance.ref('${widget.phone}');
     database.child('personaldetails').set({
       'dob': "${dobController.text.toString()}",
       'Nation': "${nationController.text.toString()}",
       'gender': "${genderController.text.toString()}",
       'language': "${languageController.text.toString()}",
       'Married': "${maritalController.text.toString()}",
     });
   }

                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Save & Next',style: TextStyle(color: Colors.white),),
                          Icon(Icons.forward, color: Colors.white),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,  // Change text color as desired
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                      ),
                    ),
                  ],
                )


              ],

            ),
          ),
        ),
      ),
    );
  }
  void uploadImage() async {
    XFile? selectedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (selectedImage != null) {
      // Assign directly to _selectedImage.value
      _selectedImage!.value = selectedImage;
    }
  }
}























//End page of this app means Resume Page
class endpage extends StatefulWidget{


  final String phone;
  final String name;
  final String email;
  final String address;
  final String link;
  final String description;
  final String programming;
  final String work;
  final String skills;
  final String hobby;
  final String courses;
  final String dob;
  final String gender;
  final String language;

  final String nation;
  final String marital;
  var image;
  endpage({Key? key, required this.phone,required this.name, required this.address,required this.email,required this.link,required this.description,required this.programming,required this.work,required this.skills,required this.hobby,required this.courses , required this.dob ,required this.gender,required this.language,required this.nation,required this.marital,required this.image}) : super(key: key);
  State<endpage> createState() => endpageState();
}
class endpageState extends State<endpage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
           SizedBox(height: 30,),
              Container(
                  width: 500,
                  height: 35,
                  color: Colors.grey.shade300,
                  child: Center(
                    child: Text('${widget.name}',style: TextStyle(fontSize: 20,color: Colors.black),
                    ),
                  )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        image: DecorationImage(
                          image: FileImage(File('${widget.image}')),
                        fit: BoxFit.cover,
                        )
                      ),
                    ),
          
                    Column(
                      children: [
          
                        Padding(
                          padding: const EdgeInsets.only(right:90.0),
                          child: Row(
                            children: [
                              Icon(Icons.phone,size: 16,color: Colors.green,),
                              Text('${widget.phone}',style: TextStyle(fontSize: 10,color: Colors.black),),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Icon(Icons.mail,size: 16,),
                            Text('${widget.email}',style: TextStyle(fontSize: 10,color: Colors.black),),
                          ],
                        ),
          
                        SizedBox(height: 10,),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Icon(Icons.home,size: 16,),
                              Text('${widget.address}',style: TextStyle(fontSize: 10,color: Colors.black),),
                            ],
                          ),
                        ),
                      ]
                    )
                  ],
                ),
          
          
                SizedBox(height: 20,),
                Column(children: [
                 Padding(
                   padding: const EdgeInsets.only(right: 180.0),
                   child: Text('ABOUT ME',style: TextStyle(fontSize: 15,color: Colors.blue),),
                 ),
                  Text('${widget.description}',style: TextStyle(fontSize: 12,color: Colors.black),
                  ),],)

,
                SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180.0),
                    child: Text('Linkedin Id',style: TextStyle(fontSize: 15,color: Colors.blue),),
                  ),
                  Text('${widget.link}',style: TextStyle(fontSize: 12,color: Colors.black),
                  ),],)


                ,SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180.0),
                    child: Text('LANGUAGES',style: TextStyle(fontSize: 15,color: Colors.blue),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 138.0),
                    child: Text('${widget.language}',style: TextStyle(fontSize: 12,color: Colors.black),
                    ),
                  ),],),
          
          
          SizedBox(height: 20,),
                  Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 180.0),
            child: Text('SKILLS',style: TextStyle(fontSize: 15,color: Colors.blue),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 180.0),
            child: Text('${widget.skills}',style: TextStyle(fontSize: 12,color: Colors.black),
            ),
          ),],),
          
          
          SizedBox(height: 20,),
                  Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 180.0),
            child: Text('HOBBIES',style: TextStyle(fontSize: 15,color: Colors.blue),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 148.0),
            child: Text('${widget.hobby}',style: TextStyle(fontSize: 12,color: Colors.black),
            ),
          ),],),
          
                SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180.0),
                    child: Text('COURSES',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:128.0),
                    child: Text('${widget.courses}',style: TextStyle(fontSize: 12,color: Colors.black),
                    ),
                  ),],),
          
                SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 110.0),
                    child: Text('Currently Working',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 98.0),
                    child: Text('${widget.work}',style: TextStyle(fontSize: 12,color: Colors.black),
                    ),
                  ),],),
                SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 200.0),
                    child: Text('D-O-B',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 188.0),
                    child: Text('${widget.dob}',style: TextStyle(fontSize: 12,color: Colors.black),
                    ),
                  ),],),
                SizedBox(height: 20,),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180.0),
                    child: Text('Marital Status',style: TextStyle(fontSize: 12,color: Colors.blue),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 158.0),
                    child: Text('${widget.marital}',style: TextStyle(fontSize: 12,color: Colors.black),
                    ),
                  ),],),
          
              ]
          ),
        ),



        );
  }
}