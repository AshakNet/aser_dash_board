import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Home",
                style: TextStyle(
                  color:Colors.grey,
                  fontSize: 12.sp,
                )),
            Text(
              ">>",
              style: TextStyle(
                color:Colors.grey,
                fontSize: 12.sp,

              ),

            ),
            Text(
                "Companies",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black
                )
            )
          ],
        )
      ],
    );
  }
}
Widget buildDropdown({
  required List<String> itemList,
  required String selectedValue,
  required String title,
  required Function(String?) onChanged,
  required BuildContext context,
  Color? titleColor,
  Color? color,
  dynamic width,
}) {
  return SizedBox(
    width: width ?? 160.w,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: titleColor,
            )
        ),
        SizedBox(height: 5.h,),
        Container(
          height: 60.h,
          width: 300.w,
          decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 8, // Blur radius
                offset: const Offset(0, 3), // Offset in x and y direction
              ),
            ],
          ),
          child: DropdownButton<String>(
            value: selectedValue,
            onChanged: onChanged,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            isExpanded: true,
            dropdownColor: Colors.white,
            focusColor: Colors.yellowAccent,
            autofocus: false,
            underline: Container(
              height: 0,
              color: Colors.deepPurpleAccent,
            ),
            items: itemList.map((itemValue) {
              return DropdownMenuItem(
                value: itemValue,
                child: Row(
                  children: [
                    Text(
                       itemValue,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),

                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),


      ],
    ),
  );
}

class DefaultDateFormField extends StatefulWidget {
  DefaultDateFormField(
      {super.key,
        required this.controller,
        this.title,
        this.titleColor,
        this.color,
        this.onTap,
        this.enabled = true,
        this.validator,
        this.width,
        this.value,
        this.onFieldSubmitted});

  final TextEditingController controller;
  Function()? onTap;
  dynamic title;
  dynamic enabled;
  double? width;
  String? value;
  Color? titleColor;
  dynamic color;
  Function(String)? onFieldSubmitted;
  dynamic validator;

  @override
  State<DefaultDateFormField> createState() => _DefaultDateFormFieldState();
}

class _DefaultDateFormFieldState extends State<DefaultDateFormField> {
  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedDate = intl.DateFormat('yyyy-MM-dd').format(now);
    return SizedBox(
      width: widget.width ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.title != ""
              ? Text(
             widget.title,
            style: TextStyle( color: widget.titleColor ?? Colors.black,),

          )
              : const SizedBox.shrink(),
          widget.title != ""
              ? SizedBox(
            height: 5.h,
          )
              : const SizedBox.shrink(),
          SizedBox(
            // height: MediaQuery.of(context).size.height * .05,
            width: 150.w,
            child: TextFormField(
              controller: widget.controller,
              enabled: widget.enabled ?? true,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  hintText: widget.value ?? formattedDate,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                  filled: true,
                  fillColor: widget.color ?? Colors.black,
                  suffixIcon: const Icon(Icons.calendar_month)),
              onTap: widget.onTap ??
                      () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2050),
                    );
                    if (pickedDate != null) {
                      widget.controller.text =
                          intl.DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {});
                    }
                  },
              validator: widget.validator ??
                      (String? value) {
                    if (value!.isEmpty) {
                      return "يجب ادخال تاريخ";
                    }
                    return null;
                  },
              onFieldSubmitted: widget.onFieldSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}