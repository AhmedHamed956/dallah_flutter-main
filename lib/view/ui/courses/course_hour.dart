import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/courses_view_model.dart';
import 'package:stacked/stacked.dart';

class CoursesHours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('course_30'),
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
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              final data = model.list;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset('assets/images/logo.png', width: 200),
                    Wrap(
                      children: data.map((e) => ShapeCourse(data: e, model: model)).toList(),
                    )
                  ],
                ),
              );
            }));
  }
}
