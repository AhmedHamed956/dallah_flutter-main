import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/view/widgets/video_player.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  @override
  _WhoAreWehState createState() => _WhoAreWehState();
}

class _WhoAreWehState extends State<Video> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('video'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<CoursesViewModel>.reactive(
            viewModelBuilder: () => CoursesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.getMyVideos(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              return Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo.png', width: 200),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ListView.builder(
                        itemCount: model.videosData.orders.length,
                        itemBuilder: (context, index) {
                          final data = model.videosData.orders[index];

                          return Container(child: VideoPlayerWidget(url: model.videosData.path + data.linkVideo));
                        },
                      ))
                ],
              );
            }));
  }
}
