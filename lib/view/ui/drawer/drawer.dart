import 'package:dallah/core/config/locator.dart';
import 'package:dallah/view/ui/account/account.dart';
import 'package:dallah/view/ui/auth/sign_up.dart';
import 'package:dallah/view/ui/businessHour/business_hour.dart';
import 'package:dallah/view/ui/courses/course_dallah.dart';
import 'package:dallah/view/ui/faq/faq.dart';
import 'package:dallah/view/ui/gallery/gallery.dart';
import 'package:dallah/view/ui/news/news.dart';
import 'package:dallah/view/ui/services/services.dart';
import 'package:dallah/view/ui/who_are_we/who.dart';
import 'package:dallah/viewModel/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../../index.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = locator<AuthViewModel>();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 150),
              _auth.currentUser == null
                  ? TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignIn(true))),
                      style: TextButton.styleFrom(
                        minimumSize:
                            Size(MediaQuery.of(context).size.width, 40),
                        padding: EdgeInsets.all(0),
                      ),
                      child: Text(translate('login')))
                  : Text.rich(TextSpan(children: [
                      TextSpan(text: translate('welcome')),
                      TextSpan(
                          style: TextStyle(color: AppColors.primaryColor),
                          text: ' ' + _auth.currentUser.fullName)
                    ])),
            ],
          )),
          ListTile(
            title: Text(translate('home')),
            onTap: () => Navigator.pop(context),
            leading:
                Image.asset('assets/icons/home.png', height: 20, width: 30),
          ),
          ListTile(
            title: Text(translate('who_us')),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => WhoAreWe())),
            leading:
                Image.asset('assets/icons/how_us.png', height: 20, width: 30),
          ),
          ListTile(
            title: Text(translate('services')),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Services())),
            leading:
                Image.asset('assets/icons/services.png', height: 20, width: 30),
          ),
          ListTile(
            title: Text(translate('time')),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => BusinessHour())),
            leading: Image.asset('assets/icons/time_clock.png',
                height: 20, width: 30),
          ),
          ListTile(
            title: Text(translate('newspaper_dallah')),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => News())),
            leading: Image.asset('assets/icons/newspaper.png',
                height: 20, width: 30),
          ),
          // ListTile(
          //   title: Text(translate('courses_dallah')),
          //   onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesDallah())),
          //   leading: Image.asset('assets/icons/checklist.png', height: 20, width: 30),
          // ),
          ListTile(
            title: Text(translate('gallery')),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Gallery())),
            leading:
                Image.asset('assets/icons/gallery.png', height: 20, width: 30),
          ),
          ListTile(
            title: Text(translate('faq')),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Faq())),
            leading: Image.asset('assets/icons/faq.png', height: 20, width: 30),
          ),
          if (_auth.currentUser != null)
            ListTile(
              title: Text(translate('user')),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Account())),
              leading:
                  Image.asset('assets/icons/user.png', height: 20, width: 30),
            ),
          if (_auth.currentUser == null)
            ListTile(
              title: Text(translate('register')),
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp())),
              leading:
                  Image.asset('assets/icons/user.png', height: 20, width: 30),
            ),
          if (_auth.currentUser != null)
            ListTile(
              title: Text(translate('logout')),
              onTap: () => _auth.logout(context),
              leading:
                  Image.asset('assets/icons/logout.png', height: 20, width: 30),
            ),
        ],
      ),
    );
  }
}
