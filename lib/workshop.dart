import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:workshop_manager/Core/app/app_routing.dart';
import 'package:workshop_manager/Core/cubit/language/app_language_state.dart';
import 'package:workshop_manager/Core/styles/app_styles.dart';
import 'package:workshop_manager/Core/widget/custom_loader_widget.dart';
import 'package:workshop_manager/Feature/location_on_map/presentation/cubit/location_on_map_cubit.dart';
import 'package:workshop_manager/Feature/scanner_page/presentation/cubit/scanner_cubit.dart';
import 'package:workshop_manager/di.dart';
import 'Core/cubit/language/app_language_cubit.dart';
import 'generated/l10n.dart';

class WorkshopManager extends StatelessWidget {
  const WorkshopManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppLanguageCubit()..changeLanguage(0)),
        BlocProvider(
          create: (context) => LocationOnMapCubit()..getCurrentLocation(),
          lazy: false,
        ),
        BlocProvider(create: (context) => ScannerCubit(getIt())),
      ],
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          if (state is ChangeLanguageState) {
            return MaterialApp.router(
              localeResolutionCallback: (locale, supportedLocales) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == locale!.languageCode &&
                      supportedLocale.countryCode == locale.countryCode) {
                    return supportedLocale;
                  }
                }
                return supportedLocales.first;
              },
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              theme: themeData(),
            );
          } else {
            return const SizedBox(
                child: Center(
              child: CustomLoaderWidget(),
            ));
          }
        },
      ),
    );
  }
}
