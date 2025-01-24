import 'package:RMS/services/dio_service.dart';
import 'package:RMS/services/shared_preferences_helper.dart';
import 'package:RMS/view/table/floor_select_bar.dart';
import 'package:RMS/view/table/table_select_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  _TablePageState createState() => _TablePageState();
}
class _TablePageState extends State<TablePage> {
  String selectedFloor = "All";
  String selectedTable = "All";
  Set<int> hoveredCards = {};
  //  List<Map<String, dynamic>> tableData = [
  //   {'status': 'Available', 'number': 'T - 1', 'floor': 'Floor 1', 'capacity': 4},
  //   {'status': 'Reserved', 'number': 'T - 2', 'floor': 'Floor 1', 'capacity': 4, 'time': '13:00 - 14:00'},
  //   {'status': 'Seated', 'number': 'T - 3', 'floor': 'Floor 1', 'capacity': 6},
  //   {'status': 'Unavailable', 'number': 'T - 4', 'floor': 'Floor 1', 'capacity': 2},
  //   {'status': 'Available', 'number': 'T - 5', 'floor': 'Floor 2', 'capacity': 8},
  //   {'status': 'Seated', 'number': 'T - 6', 'floor': 'Floor 2', 'capacity': 8},
  //   {'status': 'Reserved', 'number': 'T - 7', 'floor': 'Floor 2', 'capacity': 4, 'time': '15:00 - 16:00'},
  // ];
   List<Map<String,dynamic>> tableData=[];

  void fetchTableData()async{
    final _dio=DioService();
     _dio.addToken(await SharedPreferencesHelper().getString("auth_token"));
     try{
       final res=await _dio.getData("/table");
       if(res.statusCode==200){

         final data=res.data;
         debugPrint(data["data"][0].toString());
         if(data["success"]==true){
           List <Map<String,dynamic>> temp=[];
           for(int i=0;i<data["data"].length;i++){
             String status = data["data"][i]["status"];
             status = status[0].toUpperCase() + status.substring(1);
             debugPrint("data : ${data['data'][i]}");
             temp.add({'status':status, 'number': data["data"][i]["name"], 'floor': data["data"][i]["floorPlan"]["name"], 'capacity':data["data"][i]["capacity"] },);
           }
           setState(() {
             tableData=temp;
           });
         }
       }
     }on DioException catch(e){
       debugPrint("Dio Exception");
     }catch(e){
       debugPrint(e.toString());
     }
  }

  @override
  void initState(){
    super.initState();
    fetchTableData();
  }

  List<Map<String, dynamic>> get filteredTables {
    return tableData.where((table) {
      final matchesStatus = selectedTable == 'All' || table['status'] == selectedTable;
      final matchesFloor = selectedFloor == 'All' || table['floor'] == selectedFloor;
      return matchesStatus && matchesFloor;
    }).toList();
  }

  String formatFloorForDisplay(String floor) {
    return floor;
  }

  Map<String, int> get tableCounts {
    Map<String, int> counts = {
      "all": 0,
      "available": 0,
      "seated": 0,
      "reserved": 0,
      "unavailable": 0,
    };

    for (var table in filteredTables) {
      switch (table['status']) {
        case 'All':
          counts["all"] = counts["all"]! + 1;
          break;
        case 'Available':
          counts["available"] = counts["available"]! + 1;
          break;
        case 'Seated':
          counts["seated"] = counts["seated"]! + 1;
          break;
        case 'Reserved':
          counts["reserved"] = counts["reserved"]! + 1;
          break;
        case 'Unavailable':
          counts["unavailable"] = counts["unavailable"]! + 1;
          break;
      }
    }
    return counts;
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'All':
        return const Color(0xff000000);
      case 'Available':
        return const Color(0xff3caa6c);
      case 'Seated':
        return const Color(0xffe44f6a);
      case 'Reserved':
        return const Color(0xffe48736);
      case 'Unavailable':
        return const Color(0xff818181);
      default:
        return Colors.black;
    }
  }
  Widget buildTableStatusLayout(Map<String, dynamic> table, int index) {
    final status = table['status'];
    final isHovered = hoveredCards.contains(index);

    Widget buildContainer(String statusText, Color borderColor, Color backgroundColor, Color textColor, String capacityText, String number, String floor, String orderNumber) {
      return AnimatedContainer(
        width: 152.w,
        height: 124.h,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.w),
          borderRadius: BorderRadius.circular(12.r),
          color: isHovered ? backgroundColor : Colors.white,
        ),
        duration: const Duration(milliseconds: 1),
        child: Stack(
          children: [
            // Status tag
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 13.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isHovered ? borderColor : backgroundColor,
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  border: Border(
                    left: BorderSide(color: borderColor, width: 1.w),
                    bottom: BorderSide(color: borderColor, width: 1.w),
                  ),
                ),
                child: Text(
                  statusText,
                  style: TextStyle(
                    color: isHovered ? Colors.white : textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 12.h,
              right: 12.w,
              child: Row(
                children: [
                  const Icon(Icons.chair, color: Colors.grey),
                   SizedBox(width: 5.w),
                  Text(
                    capacityText,  // Dynamic capacity value
                    style:  TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: const Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),

            if (orderNumber.isNotEmpty)
              Positioned(
                bottom: 12.h,
                left: 12.w,
                child: Text(
                  orderNumber, // Reserved or Seated Table identifier
                  style:  TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff292929),
                  ),
                ),
              ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number,
                    style:  TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                      color: const Color(0xff292929),
                    ),
                  ),
                  Text(
                    formatFloorForDisplay(floor),
                    style:  TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Lato',
                      color: const Color(0xff292929),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (status == 'Available') {
      return buildContainer(
        "Available",
        const Color(0xff3caa6c),
        const Color(0xffdaefe5),
        const Color(0xff3caa6c),
        "${table['capacity']}",
        table['number'],
        table['floor'],
        "",
      );
    } else if (status == 'Seated') {
      return buildContainer(
        "Seated",
        const Color(0xffe44f6a),
        const Color(0xfff8dee4),
        const Color(0xffe44f6a),
        "${table['capacity']}",
        table['number'],
        table['floor'],
        "104",
      );
    } else if (status == 'Reserved') {
      return buildContainer(
        "Reserved",
        const Color(0xffe48736),
        const Color(0xfffaf0e6),
        const Color(0xffe48736),
        "${table['capacity']}",
        table['number'],
        table['floor'],
        "R-8000",
      );
    } else if (status == 'Unavailable') {
      return buildContainer(
        "Unavailable",
        const Color(0xff818181),
        const Color(0xffe8e9ea),
        const Color(0xff818181),
        "${table['capacity']}",
        table['number'],
        table['floor'],
        "",
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: mainPadding,
      child: Row(
        children: [
          Expanded(
            flex: 4,
              child: Padding(
                padding:  EdgeInsets.only(right: 24.w,),
                child: Column(
                  children: [
                    // Filters and Counters
                    Container(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow:  [
                          BoxShadow(
                            color: Color(0xFF5C5C5C),
                            blurRadius: 2.r,
                          ),
                        ],
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Floor selection row
                              Row(
                                children: [
                                  _buildFloorChooseButton(
                                    text: 'All',
                                    selected: selectedFloor == 'All',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "All";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 1',
                                    selected: selectedFloor == 'F-1',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "F-1";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 2',
                                    selected: selectedFloor == 'F-2',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "F-2";
                                      });
                                    },
                                  ),
                                  _buildFloorChooseButton(
                                    text: 'Floor 3',
                                    selected: selectedFloor == 'F-3',
                                    onPressed: () {
                                      setState(() {
                                        selectedFloor = "F-3";
                                      });
                                    },
                                  ),
                                ],
                              ),
                             SizedBox(height: 24.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  _buildTableSearchButton(
                                    text: "All",
                                    selected: selectedTable == "All",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "All";
                                      });
                                    },
                                  ),
                                  SizedBox(width: 16.w),
                                  _buildTableSearchButton(
                                    text: "Available",
                                    selected: selectedTable == "Available",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Available";
                                      });
                                    },
                                  ),
                                   SizedBox(width: 16.w),
                                  _buildTableSearchButton(
                                    text: "Seated",
                                    selected: selectedTable == "Seated",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Seated";
                                      });
                                    },
                                  ),
                                   SizedBox(width: 16.w),
                                  _buildTableSearchButton(
                                    text: "Reserved",
                                    selected: selectedTable == "Reserved",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Reserved";
                                      });
                                    },
                                  ),
                                   SizedBox(width: 16.w),
                                  _buildTableSearchButton(
                                    text: "Unavailable",
                                    selected: selectedTable == "Unavailable",
                                    onPressed: () {
                                      setState(() {
                                        selectedTable = "Unavailable";
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ),
                     SizedBox(height: 16.h),
                    // Display filtered tables based on selected floor and status
                    Expanded(
                      child: SingleChildScrollView(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Wrap(
                            spacing: 24.h,
                            runSpacing: 24.w,
                            children: List.generate(filteredTables.length, (index) {
                              final table = filteredTables[index];

                              return MouseRegion(
                                onEnter: (_) => setState(() => hoveredCards.add(index)),
                                onExit: (_) => setState(() => hoveredCards.remove(index)),
                                child: buildTableStatusLayout(table, index),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              )
            ),
          // Right side
          Container(
            padding: EdgeInsets.zero,
            width: 350.w,
            child: selectedTable == "All"
                ? FloorSelectBar(selectedFloor: selectedFloor)
                : TableSelectBar(
              selectedTable: selectedTable,
              selectedFloor: selectedFloor,
              tableCounts: tableCounts,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTableSearchButton({
  required String text,
  required bool selected,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: selected ? const Color(0xffeadbf9) : Colors.white,
      foregroundColor: selected ? Colors.black : const Color(0xff2b2b2b),
      side: BorderSide(
        color: selected ? const Color(0xffeadbf9) : const Color(0xffadadad),
        width: 0.6.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(9.r),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.black : const Color(0xff2b2b2b),
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget _buildFloorChooseButton({
  required String text,
  required VoidCallback onPressed,
  required bool selected,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: selected ? const Color(0xff292929) : Colors.white,
      foregroundColor: selected ? Colors.white : Colors.black,
      side: BorderSide(
        color: selected ? Colors.black : const Color(0xffadadad),
        width: 0.6.w,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      minimumSize:  Size(70.w, 38.h),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: selected ? Colors.white : Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
