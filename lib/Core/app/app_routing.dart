import 'package:go_router/go_router.dart';
import 'package:workshop_manager/Core/app/routes.dart';
import 'package:workshop_manager/Feature/Auth/ForgetPassword/Presentation/views/forget_password_screen.dart';
import 'package:workshop_manager/Feature/Auth/Login/presentation/views/login_screen.dart';
import 'package:workshop_manager/Feature/Auth/OTP/data/model/otp_model.dart';
import 'package:workshop_manager/Feature/Auth/OTP/presentation/views/otp_screen.dart';
import 'package:workshop_manager/Feature/Auth/ResetPassword/Presentation/Views/resest_password_screen.dart';
import 'package:workshop_manager/Feature/Auth/register/presentation/views/register_screen.dart';
import 'package:workshop_manager/Feature/NavBar/Presentation/views/nav_bar_screen.dart';
import 'package:workshop_manager/Feature/Order_details/presentation/views/order_details_screen.dart';
import 'package:workshop_manager/Feature/about_workshop/presentation/views/about_workshop_screen.dart';
import 'package:workshop_manager/Feature/add_service/presentation/views/add_servive_screen.dart';
import 'package:workshop_manager/Feature/add_service/presentation/widget/custom_add_service_fileds.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/views/add_work_shop.dart';
import 'package:workshop_manager/Feature/add_workshop/Presentation/widgets/custom_selected_work_images_gride_view.dart';
import 'package:workshop_manager/Feature/add_workshop_manager/presentation/views/add_workshop_managers_screen.dart';
import 'package:workshop_manager/Feature/done/presentation/done_screen.dart';
import 'package:workshop_manager/Feature/location_on_map/presentation/views/location_on_map_screen.dart';
import 'package:workshop_manager/Feature/manage_profile/presentation/views/manage_profile_screen.dart';
import 'package:workshop_manager/Feature/manage_workshop/presentation/views/manage_workshop_screen.dart';
import 'package:workshop_manager/Feature/managers_account/presentation/views/managers_account_screen.dart';
import 'package:workshop_manager/Feature/order_time_line/presentation/order_time_line_screen.dart';
import 'package:workshop_manager/Feature/scanner_page/presentation/views/scanner_screen.dart';
import 'package:workshop_manager/Feature/show_manager_account/presentation/views/show_manager_info_screen.dart';
import 'package:workshop_manager/Feature/splash/presentation/views/splash_screen.dart';
import 'package:workshop_manager/Feature/suggested_service/presentation/views/suggested_service_screen.dart';
import 'package:workshop_manager/Feature/workshop_orders/presentation/views/workshops_orders_screen.dart';
import 'package:workshop_manager/Feature/workshop_working_time/presentation/views/workshop_working_time_screen.dart';

import '../../Feature/EditWorkshopProfile/presentation/views/edit_workshop_profile_screen.dart';
import '../../Feature/IntroScreen/presentation/views/intro_screen.dart';
import '../constant/constant.dart';

final GoRouter router = GoRouter(
  navigatorKey: navigatorKey,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.intro,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: Routes.login,
      name: Routes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: Routes.forgetPassword,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    GoRoute(
        path: "/${Routes.otp}/:phone",
        name: Routes.otp,
        builder: (context, state) {
          final phone = state.pathParameters['phone'];
          return OtpScreen(
            phone: phone!,
          );
        }),
    GoRoute(
      path: Routes.resetPassword,
      builder: (context, state) {
        final model = state.extra as OtpModel;
        return ResestPasswordScreen(
          model: model,
        );
      },
    ),
    GoRoute(
      path: Routes.navbar,
      builder: (context, state) => const NavBarScreen(),
    ),
    GoRoute(
      path: Routes.addWorkShop,
      builder: (context, state) => const AddWorkShopScreen(),
    ),
    GoRoute(
      path: Routes.register,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: Routes.workshopWorkingTime,
      builder: (context, state) => const WorkshopWorkingTimeScreen(),
    ),
    GoRoute(
      path: Routes.locationOnMap,
      builder: (context, state) => const LocationOnMapScreen(),
    ),
    GoRoute(
      path: "${Routes.aboutWorkshop}/:id",
      name: Routes.aboutWorkshop,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return AboutWorkshopScreen(
          id: int.parse(id!),
        );
      },
    ),
    GoRoute(
      path: Routes.manageProfile,
      builder: (context, state) => const ManageProfileScreen(),
    ),
    GoRoute(
      path: Routes.addWorkshopManagers,
      builder: (context, state) => const AddWorkshopManagersScreen(),
    ),
    GoRoute(
      path: Routes.managersAccount,
      builder: (context, state) => const ManagersAccountScreen(),
    ),
    GoRoute(
      path: Routes.manageWorkshops,
      builder: (context, state) => const ManageWorkshopScreen(),
    ),
    GoRoute(
      path: "${Routes.workshopOrders}/:id",
      name: Routes.workshopOrders,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return WorkshopsOrdersScreen(
          id: int.parse(id!),
        );
      },
    ),
    GoRoute(
      path: "${Routes.orderDetails}/:id",
      name: Routes.orderDetails,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return OrderDetailsScreen(
          id: int.parse(id!),
        );
      },
    ),
    GoRoute(
        path: "${Routes.scanner}/:id",
        name: Routes.scanner,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return ScannerScreen(id: int.parse(id!));
        }),
    GoRoute(
      path: Routes.done,
      builder: (context, state) => const DoneScreen(),
    ),
    GoRoute(
        path: "${Routes.addService}/:id",
        name: Routes.addService,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return AddServiveScreen(
            id: int.parse(id!),
          );
        }),
    GoRoute(
        path: "${Routes.addSerivceFileds}/:id",
        name: Routes.addSerivceFileds,
        builder: (context, state) {
          final id = state.pathParameters['id'];
          return CustomAddServiceFileds(
            id: int.parse(id!),
          );
        }),
    GoRoute(
      path: "${Routes.suggestedService}/:id",
      name: Routes.suggestedService,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        final orderId = state.extra as String;
        return SuggestedServiceScreen(
          id: int.parse(id!),
          orderId: int.parse(orderId),
        );
      },
    ),
    GoRoute(
      path: Routes.orderTimeLine,
      builder: (context, state) => const OrderTimeLineScreen(),
    ),
    GoRoute(
      path: "${Routes.showManager}/:id",
      name: Routes.showManager,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ShowManagerInfoScreen(id: int.parse(id!));
      },
    ),
    GoRoute(
      path: "${Routes.editWorkshop}/:id",
      name: Routes.editWorkshop,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return EditWorkshopProfileScreen(id: int.parse(id!));
      },
    ),
    GoRoute(
        path: Routes.selectWorkshopImages,
        builder: (context, state) => const CustomSelectedWorkImagesGrideView()),
  ],
);
