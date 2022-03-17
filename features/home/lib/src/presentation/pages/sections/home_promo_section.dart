// import 'package:component/component.dart';
// import 'package:dependencies/dependencies.dart';
// import 'package:flutter/material.dart';
// import 'package:l10n/generated/l10n.dart';
// import 'package:preferences/preferences.dart';
// // import 'package:promo/promo.dart';

// import '../../../../home.dart';

// class HomePromoSection extends StatefulWidget {
//   @override
//   _HomePromoSectionState createState() => _HomePromoSectionState();
// }

// class _HomePromoSectionState extends State<HomePromoSection> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomePromoBloc, HomePromoState>(
//       builder: (context, state) {
//         if (state is HomePromoSuccess) {
//           if (state.data?.isNotEmpty ?? false) {
//             return _SuccessContent(data: state.data);
//           }

//           return SizedBox();
//         } else if (state is HomePromoFailure) {
//           return _FailureContent();
//         }
//         return _LoadingContent();
//       },
//     );
//   }
// }

// class _SuccessContent extends StatelessWidget {
//   final List<PromoEntity> data;

//   const _SuccessContent({Key key, this.data}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _Heading(),
//         SizedBox(height: Dimens.dp16),
//         Container(
//           height: 150,
//           child: ListView.separated(
//             padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
//             scrollDirection: Axis.horizontal,
//             physics: BouncingScrollPhysics(),
//             itemCount: data.length,
//             shrinkWrap: true,
//             separatorBuilder: (_, __) => SizedBox(width: Dimens.dp8),
//             itemBuilder: (_, i) => InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed('/promo/detail', arguments: {
//                   'promo': data[i],
//                 });
//               },
//               child: SmartNetworkImage(
//                 data[i].image,
//                 height: 150,
//                 width: Dimens.dp200,
//                 fit: BoxFit.cover,
//                 radius: BorderRadius.circular(Dimens.dp6),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// class _LoadingContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _Heading(),
//         SizedBox(height: Dimens.dp16),
//         Container(
//           height: 150,
//           child: ListView.separated(
//             padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
//             scrollDirection: Axis.horizontal,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 4,
//             shrinkWrap: true,
//             separatorBuilder: (_, __) => SizedBox(width: Dimens.dp8),
//             itemBuilder: (_, __) =>
//                 Skeleton(height: 150, width: 200, radius: 5),
//           ),
//         )
//       ],
//     );
//   }
// }

// class _FailureContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _Heading(
//           suffix: InkWell(
//             onTap: () {
//               GetIt.I<HomePromoBloc>()..add(FetchHomePromoEvent());
//             },
//             child: Row(
//               children: [
//                 Text(
//                   S.current.try_again,
//                   style: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                   ),
//                 ),
//                 SizedBox(width: Dimens.dp8),
//                 Icon(
//                   Icons.refresh,
//                   color: Theme.of(context).primaryColor,
//                   size: Dimens.dp20,
//                 )
//               ],
//             ),
//           ),
//         ),
//         SizedBox(height: Dimens.dp16),
//         Container(
//           height: 150,
//           child: ListView.separated(
//             padding: EdgeInsets.symmetric(horizontal: Dimens.dp16),
//             scrollDirection: Axis.horizontal,
//             physics: NeverScrollableScrollPhysics(),
//             itemCount: 4,
//             shrinkWrap: true,
//             separatorBuilder: (_, __) => SizedBox(width: Dimens.dp8),
//             itemBuilder: (_, __) =>
//                 Skeleton(height: 150, width: 200, radius: 5),
//           ),
//         )
//       ],
//     );
//   }
// }

// class _Heading extends StatelessWidget {
//   final Widget suffix;
//   const _Heading({
//     Key key,
//     this.suffix = const SizedBox(),
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(width: Dimens.dp16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               HeadingText(
//                 S.of(context).attractive_promo_for_you,
//                 maxLine: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               SizedBox(height: Dimens.dp4),
//               RegularText(
//                 S.of(context).many_package_options_for_you,
//                 maxLine: 1,
//                 overflow: TextOverflow.ellipsis,
//               )
//             ],
//           ),
//         ),
//         SizedBox(width: Dimens.dp16),
//         suffix,
//         SizedBox(width: Dimens.dp16),
//       ],
//     );
//   }
// }
