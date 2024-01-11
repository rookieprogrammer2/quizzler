import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizzler/providers/role_provider.dart';

class MyRole extends StatefulWidget {
  const MyRole({
    super.key,
  });


  @override
  State<MyRole> createState() => _MyRoleState();

}

class _MyRoleState extends State<MyRole> {
  final List<String> _roles = ["Student", "Lecturer", "Role"];
  String dropdownMenuItem = "Role";

  @override
  Widget build(BuildContext context) {
    return Consumer<RoleProvider>(
        builder: (context, roleProvider, _) => Row(
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
            value: dropdownMenuItem,
            onChanged: (String? value) {
              setState(() {
                roleProvider.updateSelectedRole(value!);
                dropdownMenuItem = value.toString();
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
        ),
    );
  }

}


