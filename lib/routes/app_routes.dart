import 'package:go_router/go_router.dart';
import 'package:portafolio_app_web/src/features/about/presentation/about_me_page.dart';
import 'package:portafolio_app_web/src/features/home/presentation/contact_page.dart';
import 'package:portafolio_app_web/src/features/home/presentation/home_page.dart';
import 'package:portafolio_app_web/src/features/home/presentation/profile_page.dart';
import 'package:portafolio_app_web/src/features/home/presentation/projects_page.dart';

class Routes{
  static const home = '/';
  static const aboutMe = '/about';
  static const projects = '/projects';
  static const contact = '/contact';
  static const profile = '/profile';

}

class AppRoutes {
  static final routes = GoRouter(
    routes: [
      GoRoute(path: Routes.home,
      pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
      ),
      GoRoute(path: Routes.aboutMe, 
      pageBuilder: (context, state) => NoTransitionPage(child: AboutMePage()),
      ),
      GoRoute(path: Routes.projects,
      pageBuilder: (context, state) => NoTransitionPage(child: ProjectsPage()),
      ),
      GoRoute(path: Routes.contact,
      pageBuilder: (context, state) => NoTransitionPage(child: ContactPage()),
      ),
      GoRoute(path: Routes.profile,
      pageBuilder: (context, state) => NoTransitionPage(child: ProfilePage()),
      ),
    
    ]);
}