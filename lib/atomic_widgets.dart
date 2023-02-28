import 'package:flutter/material.dart';

ElevatedButton customElevatedButton(String customText, Color btnColor, Color textColor, double btnRadius, Function()? onPressed) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius),
            ))),
    child: Text(
      customText,
      style: TextStyle( fontSize: 18.0, color: textColor),
    ),
  );
}


TextFormField customTextFormField( String hinttext, TextEditingController txtcontroller , TextInputType textType,bool obscure) {

  return TextFormField(
    controller: txtcontroller,
    onSaved: (deger) => txtcontroller.text = deger!,
    keyboardType: textType,

    decoration: InputDecoration(
        contentPadding:
        const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0)),


  );
}