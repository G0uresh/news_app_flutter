import 'package:news_app/common/utils/screen_utils.dart';

extension SizeExtension on num {
  num get w => ScreenUtil.instance.setWidth(this);
  num get h => ScreenUtil.instance.setHeight(this);
  num get sp => ScreenUtil.instance.setSp(this);
  num get minSp => ScreenUtil.instance.setMinSp(this);
}