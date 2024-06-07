import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

const double paddingValue = 10.0;
const double borderRadiusValue = 6.0;
const double imageWidthHeight = 30.0;
const double textStyleFontSize = 18.0;
const double spacing = 5.0;

// 可能放在一个公共样式文件或类中
final titleStyle = TextStyle(fontSize: textStyleFontSize);
final authorStyle = titleStyle.copyWith(fontSize: textStyleFontSize);
final topMarkStyle = titleStyle.copyWith(
  color: Colors.blue,
  fontWeight: FontWeight.bold,
);
BoxDecoration _borders() => BoxDecoration(
    border: Border.all(color: Colors.orange),
    borderRadius: BorderRadius.circular(borderRadiusValue));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

// 不被遮住的地方是SafeArea区域
//拿到homepage里面的成员变量
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        SizedBox(
            width: double.infinity,
            height: 150.h,
            child: Swiper(
                itemBuilder: (context, index) {
                  return Container(
                    height: 150.h,
                    width: double.infinity,
                    color: Colors.lightBlue,
                    margin: EdgeInsets.all(15.w),
                  );
                },
                itemCount: 3,
                pagination: const SwiperPagination(),
                control: const SwiperControl())),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return _listItemView();
            },
          ),
        )
      ])),
    );
  }

  Widget _listItemView() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RoutePath.webViewPage);
        },
        child: _buildListItemContent());
  }

  Widget _buildListItemContent() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: paddingValue, vertical: paddingValue),
      padding: EdgeInsets.all(paddingValue),
      decoration: _borders(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _headerRow(),
          SizedBox(height: spacing),
          Text('标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题'),
          SizedBox(height: spacing),
          _footerRow(),
        ],
      ),
    );
  }

  Widget _headerRow() => Row(
        children: [
          _clipRRectImage(),
          SizedBox(width: spacing),
          Text('作者', style: authorStyle),
          SizedBox(width: spacing),
          Spacer(), // 使用Spacer替代Expanded以自动填充剩余空间
          Text('date:2014-2-5'),
          SizedBox(width: spacing),
          Text('置顶', style: topMarkStyle),
        ],
      );

  Widget _clipRRectImage() => ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusValue / 2),
        child: Image.asset(
          "assets/images/cat.png",
          width: imageWidthHeight,
          height: imageWidthHeight,
        ),
      );

  Widget _footerRow() => Row(
        children: [
          Text(
            '分类',
            style: TextStyle(color: Colors.green),
          ),
          Spacer(), // 同样使用Spacer
        ],
      );
}
