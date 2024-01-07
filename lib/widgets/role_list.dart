import 'package:flutter/material.dart';

class MyRole extends StatefulWidget {
  final BuildContext context;
  MyRole({
    super.key,
    required this.context
  });

  @override
  State<MyRole> createState() => _MyRoleState();
}

class _MyRoleState extends State<MyRole> {
  final List<String> _roles = ["Student", "Lecturer"];

  String _selectedDropdownItem = "Student";
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
            "Role : ",
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontWeight: FontWeight.w500,
          fontSize: 16,
          // fontFamily: 'Montserrat'
        ),),
        const SizedBox(width: 6,),
        Expanded(
          child: DropdownButton<String>(
            underline: Container(
              height: 2,
              color: Colors.white.withOpacity(0.7),
            ),
            dropdownColor: Colors.black,
            isExpanded: true,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9)
            ),
            iconEnabledColor: Colors.white.withOpacity(0.9),
            iconSize: 30,
            value: _selectedDropdownItem,
            onChanged: (String? value) {
              setState(() {
                _selectedDropdownItem = value!;
              });
            },
            items: _roles.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}


