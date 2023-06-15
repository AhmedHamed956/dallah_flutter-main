import 'package:dallah/view/widgets/loading.dart';
import 'package:dallah/viewModel/galleries_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:dallah/core/constants/colors.dart';
import 'package:dallah/view/index.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:stacked/stacked.dart';

class Services extends StatelessWidget {
  Map data = {
    "id": 3,
    "titla": "services",
    "content": "Procedures for issuing driving licenseDriving Licenses are divided intoInstructions of the Traffic Department for attending studentsTraining Procedures for issuing a private driving licenseApplicant must be 18 years oldMedical Report for Eye test and Blood Type from a clinic or hospital linked to Traffic Police&rsquo;s system.For Citizens : Copy of the ID card with the originalFor Residents : Copy of Resident Permit (Iqama) and the Original4 personal pictures size 4cm*6cmA filled in Traffic Police Form available from the websites of Dallah Driving Company or Ministry of Interior.A file to keep all the documentsPayment of the prescribed fees + 5% VAT Procedures for issuing a driving permitApplicant must be 17 years oldMedical Report for Eye test and Blood Type from a clinic or hospital linked to Traffic Police&rsquo;s system.Citizens : Copy of the ID card with the originalCitizens of the Gulf Cooperation Council Countries : Copy of the passport with the page showing date of entry (must be 3 months earlier)Residents : Copy of the residence permit with the original4 personal pictures size 4cm*6cmA filled in Traffic Police Form available from the websites of Dallah Driving Company or Ministry of Interior.A file to keep all the documentsPayment of the prescribed fees +15% VATCitizens : A copy of the ID card with the original copy - Profession of the applicant can be a freelancer, a private sector employee, a student or a government employee whose jobs require obtaining a PUBLIC driving license in which case a reference letter from the employer is also required.Residents : A copy of the original residence permit. Profession of the applicant must be a general driver, a transfer vehicle driver, an equipment driver, a bus driver or a taxi driver and should be holding a valid license from home country.4 personal pictures size 4cm*6cmA filled in Traffic Police Form available from the websites of Dallah Driving Company or Ministry of Interior.A file to keep all the documentsPayment of the prescribed fees + 15% VAT&nbsp;Important Note:More than type of licenses can be combined in one and specified driver&rsquo;s license.Specifications of a driving license: A driving license should have high security features and must include the following data:Name of license holderLicense numberDate of birthLimitationsType of licenseInstructions of the Traffic Department for attending studentsDallah Driving Company is obliged to adhere to and comply with the prescribed directives of The Traffic Department with regard to operation of a training centre:&nbsp;Student&rsquo;s should always carry an Identification with them.&nbsp;Student&rsquo;s should additionally also always carry Fee payment voucher with them.&nbsp;Everyone should dress appropriately and in accordance with the local norms (e.g., no Bermuda shorts, sleeveless vests, Sleepwear or Shorts)&nbsp;Students must adhere to dates and times and the training course and the test.&nbsp;Make timely payment for the license or permit before the test.&nbsp;No one is permitted to smoke during the training course or the test.TrainingDue to the role Dallah Driving Company has been playing in training the drivers, a sophisticated and practical program has been developed with the objective of raising the level of awareness of safe driving and to promote a culture of respect for traffic rules. Our training ensures safety of lives and property by virtue of a reduction in traffic accidents, especially those resulting from human error or negligence.&nbsp;The theoretical training includes:&nbsp;An explanation of the curriculum, objectives of the training course and delivery of course material.&nbsp;Identification of traffic signs and signals&nbsp;Principles of how a car operates and identification of various parts of a vehicle&nbsp;Speed Limits, driving lanes, rules of overtaking and principles of safe driving.&nbsp;Safe and preventive driving and lectures in security, safety and first aid&nbsp;Traffic regulation, Violations and penalties&nbsp;Movies showing road accidents and how to avoid those by driving safely.&nbsp;Practical training includes:&nbsp;Training sessions on the simulator&nbsp;Training in an actual vehicle in the field&nbsp;Training to drive in reverse&nbsp;Train on the track exercising various manoeuvres like 8, X, T, parking on a slope and parallel parking.&nbsp;Take a training test"
  };

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            translate('services'),
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
            onModelReady: (model) => model.getService(context),
            builder: (context, model, child) {
              if (model.isBusy) return ShapeLoading3();
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13.0),
                      color: const Color(0xffd95620),
                      border: Border.all(width: 1.0, color: const Color(0xffd8d8d8)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x29000000),
                          offset: Offset(0, 3),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: const Color(0xffffffff),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: Offset(0, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(4),
                              margin: EdgeInsets.all(6),
                              child: SvgPicture.asset(
                                'assets/icons/svg/checklist.svg',
                                color: AppColors.primaryColor,
                                height: 25,
                              ),
                            ),
                            Text(
                              model.pagesModel.data.titla,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                fontSize: 12,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: const Color(0xffffffff),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x29000000),
                                offset: Offset(0, 3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          child: HtmlWidget(
                            model.pagesModel.data.content,
                            textStyle: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 12,
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w700,
                              height: 1.4545454545454546,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        ));
  }
}
