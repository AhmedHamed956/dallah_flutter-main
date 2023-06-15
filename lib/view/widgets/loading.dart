import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';

import '../index.dart';

class Loading {
  init() {
    int backgroundColor = 0x42000000;
    int seconds = 20;
    bool clickClose = false;
    bool allowClick = false;
    bool ignoreContentClick = false;
    bool crossPage = true;
    int animationMilliseconds = 200;
    int animationReverseMilliseconds = 200;
    BotToast.showCustomLoading(
        clickClose: clickClose,
        allowClick: allowClick,
        ignoreContentClick: ignoreContentClick,
        animationDuration: Duration(milliseconds: animationMilliseconds),
        animationReverseDuration: Duration(milliseconds: animationReverseMilliseconds),
        duration: Duration(
//          seconds: 10,
            days: 1
        ),
        backgroundColor: Color(backgroundColor),
        align: Alignment.center,
        toastBuilder: (cancelFunc) {
          return _CustomLoadWidget(cancelFunc: cancelFunc);
        });
  }
}

class _CustomLoadWidget extends StatefulWidget {
  final CancelFunc cancelFunc;

  const _CustomLoadWidget({Key key, this.cancelFunc}) : super(key: key);

  @override
  __CustomLoadWidgetState createState() => __CustomLoadWidgetState();
}

class __CustomLoadWidgetState extends State<_CustomLoadWidget> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });
    animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              child: ShapeLoading(),
              width: 50,
              height: 50,
            ),
            Text(translate('loading'))
          ],
        ),
      ),
    );
  }
}

class ShapeLoading extends StatefulWidget {
  @override
  ShapeLoadingState createState() => ShapeLoadingState();
}

class ShapeLoadingState extends State<ShapeLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitThreeBounce(
      color: AppColors.secondaryColor,
      size: 30.0,
//      controller: AnimationController(vsync: __CustomLoadWidgetState(), duration: const Duration(milliseconds: 1200)),
    ));
  }
}
class ShapeLoading2 extends StatefulWidget {
  @override
  ShapeLoading2State createState() => ShapeLoading2State();
}

class ShapeLoading2State extends State<ShapeLoading2> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: AppColors.primaryColor,
      size: 30.0,
    ));
  }
}

class ShapeLoading3 extends StatefulWidget {
  @override
  ShapeLoading3State createState() => ShapeLoading3State();
}

class ShapeLoading3State extends State<ShapeLoading3> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: AppColors.primaryColor,
      size: 50.0,
    ));
  }
}
