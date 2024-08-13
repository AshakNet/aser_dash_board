import 'package:aser_dash_board/view/compaines/widgets/row_item_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color.dart';
import 'componant.dart';
import 'header_widgets.dart';

class BodyForCompany extends StatefulWidget {
  const BodyForCompany({super.key});

  @override
  State<BodyForCompany> createState() => _BodyForCompanyState();
}

class _BodyForCompanyState extends State<BodyForCompany> {
  final List<RowItemBody> rowItemBody =
      List.generate(74, (index) => RowItemBody());

  final int _rowsPerPage = 10;
  int _currentPage = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int totalRows = rowItemBody.length;
    final int totalPages = (totalRows / _rowsPerPage).ceil();

    return Column(
      children: [
        Row(
          children: [
            Text("Companies",
                style: TextStyle(fontSize: 20.sp, color: Colors.black)),
            SizedBox(
              width: 10.w,
            ),
            Text("( 196 company)",
                style: TextStyle(fontSize: 16.sp, color: Colors.grey)),
            Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                width: 180.w,
                height: 55.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.r),
                  color: Color(0xFFFC26023),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Add Company",
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: TextEditingController(),
            maxLines: 1,
            validator: (value) {},
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: darkGrey,
                ),
              ),
              filled: true,
              fillColor: Color.fromRGBO(247, 247, 247, 1),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 13.w,
                vertical: 20.h,
              ),
              constraints: BoxConstraints(
                minHeight: 64.h,
                minWidth: 372.w,
              ),
              hintStyle: TextStyle(
                fontSize: 16.sp,
                color: darkGrey,
              ),
              hintText: "Search company by name.",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        HeaderForBody(),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: totalPages,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, pageIndex) {
              final startRow = pageIndex * _rowsPerPage;
              final endRow = startRow + _rowsPerPage < totalRows
                  ? startRow + _rowsPerPage
                  : totalRows;
              final paginatedBody = rowItemBody.sublist(startRow, endRow);

              return Column(
                children: [
                  SizedBox(
                    height: 350.h,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return RowItemBody();
                      },
                      itemCount: paginatedBody.length,
                      itemExtent: 60.h,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      TextButton(
                        child: Container(
                          child: Text(
                            "Previous",
                          ),
                        ),
                        onPressed: _currentPage > 0
                            ? () {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              }
                            : null,
                      ),
                      Spacer(),
                      TextButton(
                        child: Container(
                          child: Text(
                            "next",
                          ),
                        ),
                        onPressed: _currentPage < totalPages - 1
                            ? () {
                                _pageController.nextPage(
                                  duration: Duration(
                                    milliseconds: 300,
                                  ),
                                  curve: Curves.ease,
                                );
                              }
                            : null,
                      ),
                      Spacer(),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
