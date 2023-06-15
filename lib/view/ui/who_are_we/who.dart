import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/galleries_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';

class WhoAreWe extends StatefulWidget {
  @override
  _WhoAreWehState createState() => _WhoAreWehState();
}

class _WhoAreWehState extends State<WhoAreWe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('who_us'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<GalleriesViewModel>.reactive(
            viewModelBuilder: () => GalleriesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.getAboutUs(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', width: 200),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        model.pagesModel.data.content,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 13,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                          height: 1.3846153846153846,
                        ),
                        // textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        // textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
