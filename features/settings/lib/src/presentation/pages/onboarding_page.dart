// import 'package:component/component.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';
// import 'package:l10n/generated/l10n.dart';
// import 'package:preferences/preferences.dart';

// import '../../../settings.dart';

// class OnBoardingPage extends StatefulWidget {
//   @override
//   _OnBoardingPageState createState() => _OnBoardingPageState();
// }

// class _OnBoardingPageState extends State<OnBoardingPage> {
//   final CarouselController _controller = CarouselController();
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildBody(),
//       bottomNavigationBar: _buildBottomBar(),
//     );
//   }

//   Widget _buildBody() {
//     return Container(
//       width: double.maxFinite,
//       child: CarouselSlider.builder(
//         options: CarouselOptions(
//           scrollPhysics: BouncingScrollPhysics(),
//           viewportFraction: 1.0,
//           aspectRatio: Dimens.width(context) / Dimens.height(context),
//           enableInfiniteScroll: false,
//           initialPage: 0,
//           onPageChanged: (index, reason) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//         ),
//         carouselController: _controller,
//         itemCount: onBoardingData.length,
//         itemBuilder: (context, index) =>
// _buildItemView(onBoardingData[index]),
//       ),
//     );
//   }

//   Widget _buildItemView(Map<String, dynamic> data) {
//     return Container(
//       height: Dimens.height(context) - kToolbarHeight,
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           _buildImage(data['icon'], data['background']),
//           _buildText(data['title'], data['description']),
//           _buildLogo(),
//         ],
//       ),
//     );
//   }

//   Widget _buildLogo() {
//     return Positioned(
//       top: Dimens.height(context) * 0.09,
//       // child: Image.asset(
//       //   AssetsPath.logo,
//       //   height: Dimens.dp22,
//       // ),
//     );
//   }

//   Widget _buildImage(String iconPath, String bgPath) {
//     return Container(
//       width: double.infinity,
//       alignment: Alignment.center,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             bgPath,
//             fit: BoxFit.fitWidth,
//             width: double.infinity,
//           ),
//           SizedBox(
//             width: Dimens.width(context) * 0.6,
//             height: Dimens.height(context) * 0.35,
//             child: Image.asset(
//               iconPath,
//               fit: BoxFit.contain,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildText(String title, String description) {
//     return Container(
//       margin: EdgeInsets.all(40),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TitleText(
//             title,
//             align: TextAlign.center,
//           ),
//           SizedBox(height: Dimens.dp8),
//           RegularText(
//             description,
//             align: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomBar() {
//     return BottomAppBar(
//       elevation: 10,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: _buildPreviousButton(),
//           ),
//           Container(
//             width: 100,
//             child: _buildIndicator(),
//           ),
//           Expanded(
//             child: _buildNextButton(),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNextButton() {
//     if (_currentIndex == onBoardingData.length - 1) {
//       return FlatButton(
//         onPressed: _onTapLetsStart,
//         textColor: Theme.of(context).primaryColor,
//         child: Text(S.current.lets_start),
//       );
//     }
//     return FlatButton(
//       child: Text(S.current.next),
//       textColor: Theme.of(context).primaryColor,
//       onPressed: () {
//         _controller.nextPage();
//       },
//     );
//   }

//   Widget _buildPreviousButton() {
//     if (_currentIndex <= 0) {
//       return SizedBox(width: 50);
//     }
//     return FlatButton(
//       child: Text(S.current.back),
//       textColor: Theme.of(context).disabledColor,
//       onPressed: () {
//         _controller.previousPage();
//       },
//     );
//   }

//   Widget _buildIndicator() {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: onBoardingData.map((data) {
//         var index = onBoardingData.indexOf(data);
//         return AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           width: _currentIndex == index ? Dimens.dp24 : 8.0,
//           height: 8.0,
//           margin: EdgeInsets.symmetric(
//               vertical: Dimens.dp10, horizontal: Dimens.dp4),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             color: _currentIndex == index
//                 ? Theme.of(context).primaryColor
//                 : Theme.of(context).primaryColor.withOpacity(0.5),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   void _onTapLetsStart() {
//     _saveCacheAfterOnBoard();
//     Navigator.of(context).pop();
//   }

//   void _saveCacheAfterOnBoard() async {
//     GetIt.I<OnBoardBloc>()..add(MarkDoneOnBoardEvent());
//   }
// }
