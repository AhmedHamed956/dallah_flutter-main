import 'package:dallah/view/index.dart';
import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/view/widgets/shape_branches.dart';
import 'package:dallah/viewModel/branches_view_model.dart';
import 'package:stacked/stacked.dart';

class Branches extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp
        .of(context)
        .delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('branches'),
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 21,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColors.secondaryColor,
        ),
        body: ViewModelBuilder<BranchesViewModel>.reactive(
            viewModelBuilder: () => BranchesViewModel(),
            disposeViewModel: false,
            onModelReady: (model) => model.initScreen(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
              final data = model.branches;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final element = data[index];
                    return Column(
                      children: [
                        ShapeBranches(element)
                      ],
                    );
                  });
            }));
  }
}
