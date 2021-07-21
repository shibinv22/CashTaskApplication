// import 'package:flutter/material.dart';
// import 'package:untitled1/utils/constants.dart';

// class ItemD extends StatelessWidget {
//   final GlobalKey<State<StatefulWidget>> key;
//   final void Function() onTap;
//   final int position;
//   final String title;
//   final bool currentSelection;
//   ItemD({
//     required this.key,
//     required this.onTap,
//     required this.position,
//     required this.title,
//     required this.currentSelection,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         width: 100.0,
//         child: Column(
//           children: [
//             InkWell(
//               key: key,
//               onTap: () => onTap,
//               child: Text(
//                 title,
//                 style: TextStyle(
//                     fontSize: 20.0,
//                     color: currentSelection == (position)
//                         ? AppColors.appColor
//                         : Colors.grey),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 10.0),
//               decoration: UnderlineTabIndicator(
//                 borderSide: BorderSide(
//                   color: currentSelection == (position)
//                       ? AppColors.appColor
//                       : Colors.white,
//                   width: 3.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
