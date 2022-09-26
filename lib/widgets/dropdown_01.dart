import 'package:flutter/material.dart';

class DropDown_01 extends StatefulWidget {

  final list;
  late String? attribute;
  final String hint;


  DropDown_01({Key? key, required this.list, required this.attribute, required this.hint}) : super(key: key);

  @override
  State<DropDown_01> createState() => _DropDown_01State();
}

class _DropDown_01State extends State<DropDown_01> {

  DropdownMenuItem<String> buildMenuItem(String drp) =>
      DropdownMenuItem(
        value: drp,
        child: Text(drp, style: TextStyle(fontSize: 19, color: Colors.white),),
      );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        decoration: BoxDecoration(color: Colors.grey.shade600.withOpacity(0.6), borderRadius: BorderRadius.circular(16)),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            hint: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.hint,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                ),
              ),
            ),
            iconSize: 32,
            iconEnabledColor: Colors.white,
            value: widget.attribute,
            items: widget.list.map(buildMenuItem).toList(),
            validator: (value){
              if(value==null){
                return 'Select a field';
              }
              return null;
            },
            onChanged: (value) => setState(() {
              widget.attribute=value!;
            }),
            isExpanded: true,
            borderRadius: BorderRadius.circular(16),
            dropdownColor: Colors.grey.shade600.withOpacity(0.6),

          ),
        ),
      ),
    );
  }
}
