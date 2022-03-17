// import 'package:component/component.dart';
// import 'package:flutter/material.dart';
// import 'package:preferences/preferences.dart';

// import '../../../../home.dart';

// class ServiceMenuSection extends StatefulWidget {
//   @override
//   _ServiceMenuSectionState createState() => _ServiceMenuSectionState();
// }

// class _ServiceMenuSectionState extends State<ServiceMenuSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
//         child: _buildGridViewService(
//             ServiceMenuData.menu
//                 .where((element) => element.enable == true)
//                 .toList(),
//             true));
//   }

//   _buildGridViewService(List<ServiceMenu> data, bool hasShowMore) {
//     return GridView.builder(
//       padding: EdgeInsets.only(bottom: Dimens.dp4),
//       physics: NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       itemCount: data.length + (hasShowMore ? 1 : 0),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: Dimens.width(context) ~/ 84,
//         childAspectRatio: 0.9,
//         crossAxisSpacing: Dimens.dp12,
//         mainAxisSpacing: Dimens.dp8,
//       ),
//       itemBuilder: (context, index) {
//         if (index < data.length) {
//           final item = data[index];
//           return MenuItemCard(
//             title: item.name,
//             backgroundColor: (item.enable ?? false)
//                 ? item.color
//                 : Theme.of(context).dividerColor,
//             icon: item.icon,
//             onTap: item?.moduleId != null
//                 ? () => _navigateToDetailModule(item)
//                 : null,
//           );
//         }
//         return MenuItemCard(
//           backgroundColor: Theme.of(context).dividerColor,
//           icon: AppIcons.more,
//           title: 'More',
//           onTap: _showMenuSheet,
//           iconColor: Colors.white,
//         );
//       },
//     );
//   }

//   void _showMenuSheet() {
//     var _menu = ServiceMenuData.menu;
//     var _horizontalCount = Dimens.width(context) ~/ 84;
//     var _verticalCount = _menu.length / _horizontalCount;
//     var _height = _verticalCount * 100 + 100;
//     showModalBottomSheet(
//         context: context,
//         builder: (_) => ContentSheet(
//               height: _height,
//               content: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
//                 child: _buildGridViewService(_menu, false),
//               ),
//             ));
//   }

//   void _navigateToDetailModule(ServiceMenu data) async {
//     if (data?.moduleId != null) {
//       Navigator.pushNamed(context, '/${data?.moduleId}');
//     }
//   }
// }
