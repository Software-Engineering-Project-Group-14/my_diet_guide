import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/blurred_background_image.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/text_box_02.dart';

class UpdateNameForm extends StatefulWidget {

  final String user_id;
  final String firstName;
  final String lastName;

  const UpdateNameForm({Key? key, required this.user_id, required this.firstName, required this.lastName}) : super(key: key);

  @override
  State<UpdateNameForm> createState() => _UpdateNameFormState();
}

class _UpdateNameFormState extends State<UpdateNameForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    _firstNameController.text=widget.firstName;
    _lastNameController.text=widget.lastName;

    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade900,
        elevation: 0,
      ),

      drawer: NavigationDrawer(),

      body: Stack(
        children: [
          BlurredBackground(),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,),

                  TextBox02(controller: _firstNameController, hint: "First Name", keyboardType: TextInputType.name),

                  SizedBox(height: 30,),

                  TextBox02(controller: _lastNameController, hint: "Last Name", keyboardType: TextInputType.name),

                  SizedBox(height: 50,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () async {
                        final String fname = _firstNameController.text;
                        final String lname = _lastNameController.text;

                        final userDoc = FirebaseFirestore.instance.collection('user').doc(widget.user_id);

                        await userDoc.update({
                          'first name': widget.firstName,
                          'last name': widget.lastName,
                        });

                        _firstNameController.text='';
                        _lastNameController.text='';
                      },

                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade900,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight:FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}


