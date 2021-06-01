import 'package:flutter/material.dart';

 Widget ChooseTextButtonWidget(Color color) => Container(

  child:

  Container(
   color: const Color(0xFFfa7373),
   padding: const EdgeInsets.only(top:20,left: 20, bottom: 20),
   child:
   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Container(
      padding: const EdgeInsets.only(top:20,bottom: 20),
      child:
      Text(
       '12월 8일 화요일',
       style:TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 24,
           color: Colors.white
       ),
      ),
     ),
     Text(
      '임신확률이 낮아요',
      style:TextStyle(
          fontSize: 22,
          color: Colors.white

      ),
     ),
     Text(
      '생리 5일째 입니다.',
      style:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.white

      ),
     ),

     Row(
      children: [
       Container(
        padding: const EdgeInsets.only(left:10,top: 5,right: 10,bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), //모서리를 둥글게
            border: Border.all(color: Colors.black12, width: 3),
        ),
        child:
        Text(
         '피임시도',
         style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          backgroundColor: const Color(0xffff3333),
         ),

        ),
       ),
      ],

     ),
    ],
   ),

  ),
);