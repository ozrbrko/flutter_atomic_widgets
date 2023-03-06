import 'package:flutter/material.dart';

ElevatedButton customElevatedButton(String customText, Color btnColor,
    Color textColor, double btnRadius, Function()? onPressed) {
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
      style: TextStyle(fontSize: 18.0, color: textColor),
    ),
  );
}

TextFormField customTextFormField(String hinttext,
    TextEditingController txtcontroller, TextInputType textType, bool obscure) {
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
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)),
  );
}

AppBar customAppBar(BuildContext context, bool backButton, String appText) {
  return AppBar(
    automaticallyImplyLeading: backButton,
    centerTitle: true,
    title: Text(
      appText,
      style: TextStyle(
        color: Colors.white,
        letterSpacing: 1,
        // fontFamily: fontfamily
      ),
    ),
    backgroundColor: Colors.blueGrey,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(0),
      ),
    ),
  );
}

TextFormField customDateTextFormField(
    BuildContext context, TextEditingController txtController) {
  return TextFormField(
    controller: txtController,
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: "Date",
        hintStyle: TextStyle(
            // fontFamily: fontfamily,
            color: Colors.grey,
            fontSize: 16.0)),
    onTap: () async {
      DateTime date = DateTime(1900);
      FocusScope.of(context).requestFocus(new FocusNode());

      date = (await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: Colors.blue, // button text color
                  ),
                ),
              ),
              child: child!,
            );
          }))!;
      String dateSlug =
          "${date.year.toString()}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";

      txtController.text = dateSlug;
    },
  );
}

TextFormField customTimeTextFormField(
    BuildContext context, TextEditingController txtController) {
  return TextFormField(
    controller: txtController,
    decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 32),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        filled: true,
        hintText: "Time",
        hintStyle: TextStyle(
            // fontFamily: themeFontLight,
            color: Colors.grey,
            fontSize: 16.0)),
    onTap: () {
      FocusScope.of(context).requestFocus(new FocusNode());
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
// change the border color
                primary: Colors.blue,
// change the text color
                onSurface: Colors.blue,
              ),
              buttonTheme: ButtonThemeData(
                colorScheme: ColorScheme.light(
                  primary: Colors.blue,
                ),
              ),
            ),
            child: child!,
          );
        },
      ).then((value) {
        txtController.text = value!.format(context);
      });
    },
  );
}
