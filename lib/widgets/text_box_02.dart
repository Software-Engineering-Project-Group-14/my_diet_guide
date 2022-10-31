import 'package:flutter/material.dart';

class TextBox02 extends StatefulWidget {

  final String hint;
  //final TextEditingController controller;
  final TextInputType keyboardType;
  late String value;

  TextBox02({Key? key, required this.value, required this.hint, required this.keyboardType}) : super(key: key);

  @override
  State<TextBox02> createState() => _TextBox02State();
}

class _TextBox02State extends State<TextBox02> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade600.withOpacity(0.6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextFormField(
              //controller: widget.controller,
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 20),
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
              onChanged: (val){
                setState(() => widget.value = val);
              },
              validator: (text){
                if(text == null || text.isEmpty){
                  return 'Cannot be empty';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

}


// class TextBox02 extends StatelessWidget {
//
//   final String hint;
//   final TextEditingController controller;
//   final TextInputType keyboardType;
//
//   const TextBox02({Key? key, required this.controller, required this.hint, required this.keyboardType}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 40),
//       child: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade600.withOpacity(0.6),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: TextFormField(
//               validator: (text){
//                 if(text == null || text.isEmpty){
//                   return 'Cannot be empty';
//                 }
//                 return null;
//               },
//               controller: controller,
//               style: TextStyle(
//                 fontSize: 19,
//                 color: Colors.white,
//               ),
//               keyboardType: keyboardType,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(vertical: 20),
//                 border: InputBorder.none,
//                 hintText: hint,
//                 hintStyle: TextStyle(
//                   fontSize: 19,
//                   color: Colors.white,
//                 ),
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//
//   }
// }
