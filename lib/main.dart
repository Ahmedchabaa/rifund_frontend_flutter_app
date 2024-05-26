// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'core/app_export.dart';

// var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   Future.wait([
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
//     PrefUtils().init()
//   ]).then((value) {
//     runApp(MyApp());
//   });
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return ChangeNotifierProvider<ThemeProvider>(
//           create: (context) => ThemeProvider(),
//           child: Consumer<ThemeProvider>(
//             builder: (context, provider, child) {
//               return MaterialApp(
//                 title: 'rifund',
//                 debugShowCheckedModeBanner: false,
//                 theme: theme,
//                 navigatorKey: NavigatorService.navigatorKey,
//                 localizationsDelegates: [
//                   AppLocalizationDelegate(),
//                   GlobalMaterialLocalizations.delegate,
//                   GlobalWidgetsLocalizations.delegate,
//                   GlobalCupertinoLocalizations.delegate
//                 ],
//                 supportedLocales: [Locale('en', '')],
//                 initialRoute: AppRoutes.initialRoute,
//                 routes: AppRoutes.routes,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rifund/screens/admin/admin_cat_gorie_screen/provider/admin_cat_gorie_provider.dart';
import 'package:rifund/screens/admin/modifier_cat_gorie_page/provider/modifier_cat_gorie_provider.dart';
import 'package:rifund/screens/affichage_par_categorie/provider/affichagecategorie_provider.dart';

import 'core/app_export.dart';
import 'screens/acceuil_client_page/provider/acceuil_client_provider.dart';
import 'screens/admin/admin_communaut_screen/provider/admin_communaut_provider.dart';
import 'screens/admin/admin_projet_screen/provider/admin_projet_provider.dart';
import 'screens/admin/admin_utlisa_page/provider/admin_utlisa_provider.dart';
import 'screens/admin/profile_admin_page/provider/profile_admin_provider.dart';
import 'screens/affichage_communaut_page/provider/affichage_communaut_provider.dart';
import 'screens/admin/ajout_cat_gorie_page/provider/ajout_cat_gorie_provider.dart';
import 'screens/app_navigation_screen/provider/app_navigation_provider.dart';
import 'screens/chat_box_screen/provider/chat_box_provider.dart';
import 'screens/cr_er_communaut_screen/provider/cr_er_communaut_provider.dart';
import 'screens/cr_er_un_compte_screen/provider/cr_er_un_compte_provider.dart';
import 'screens/creationprojet/provider/cr_er_projet_provider.dart';
import 'screens/details_projet_screen/provider/details_projet_provider.dart';
import 'screens/financer_projet_screen/provider/financer_projet_provider.dart';
import 'screens/liste_de_communaut_page/provider/liste_de_communaut_provider.dart';
import 'screens/listeprojets/provider/liste_des_projets_provider.dart';
import 'screens/membre_rejoindre_screen/provider/membre_rejoindre_provider.dart';
import 'screens/modifier_communaut_screen/provider/modifier_communaut_provider.dart';
import 'screens/modifier_motdepasse_screen/provider/modifier_motdepasse_provider.dart';
import 'screens/modifier_nom_screen/provider/modifier_nom_provider.dart';
import 'screens/modifierscreen/provider/modifier_projet_provider.dart';
import 'screens/mot_de_passe_oublier_screen/provider/mot_de_passe_oublier_provider.dart';
import 'screens/navigation/provider/app_navigation_provider.dart';
import 'screens/notification_page/provider/notification_provider.dart';
import 'screens/profile_screen/provider/profile_provider.dart';
import 'screens/se_connecter_screen/provider/se_connecter_provider.dart';
import 'screens/splash_page/provider/splash_provider.dart';
import 'screens/welcome_screen/provider/welcome_provider.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    PrefUtils().init()
  ]).then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeProvider>(
                create: (_) => ThemeProvider()),
            ChangeNotifierProvider<AcceuilClientProvider>(
                create: (_) => AcceuilClientProvider()),
            ChangeNotifierProvider<DetailsProjetProvider>(
                create: (_) => DetailsProjetProvider()),
            ChangeNotifierProvider<AjoutCatGorieProvider>(
                create: (_) => AjoutCatGorieProvider()),
            ChangeNotifierProvider<AppNavigationProvider>(
                create: (_) => AppNavigationProvider()),
            ChangeNotifierProvider<ChatBoxProvider>(
                create: (_) => ChatBoxProvider()),
            ChangeNotifierProvider<CrErCommunautProvider>(
                create: (_) => CrErCommunautProvider()),
            ChangeNotifierProvider<CrErUnCompteProvider>(
                create: (_) => CrErUnCompteProvider()),
            ChangeNotifierProvider<CrErProjetProvider>(
                create: (_) => CrErProjetProvider()),
            ChangeNotifierProvider<FinancerProjetProvider>(
                create: (_) => FinancerProjetProvider()),
            ChangeNotifierProvider<ListeDeCommunautProvider>(
                create: (_) => ListeDeCommunautProvider()),
            ChangeNotifierProvider<ListeDesProjetsProvider>(
                create: (_) => ListeDesProjetsProvider()),
            ChangeNotifierProvider<MembreRejoindreProvider>(
                create: (_) => MembreRejoindreProvider()),
            ChangeNotifierProvider<ModifierCommunautProvider>(
                create: (_) => ModifierCommunautProvider()),
            ChangeNotifierProvider<ModifierMotdepasseProvider>(
                create: (_) => ModifierMotdepasseProvider()),
            ChangeNotifierProvider<ModifierNomProvider>(
                create: (_) => ModifierNomProvider()),
            ChangeNotifierProvider<ModifierProjetProvider>(
                create: (_) => ModifierProjetProvider()),
            ChangeNotifierProvider<MotDePasseOublierProvider>(
                create: (_) => MotDePasseOublierProvider()),
            ChangeNotifierProvider<MotDePasseOublierProvider>(
                create: (_) => MotDePasseOublierProvider()),
            ChangeNotifierProvider<NotificationProvider>(
                create: (_) => NotificationProvider()),
            ChangeNotifierProvider<ProfileProvider>(
                create: (_) => ProfileProvider()),
            ChangeNotifierProvider<SeConnecterProvider>(
                create: (_) => SeConnecterProvider()),
            ChangeNotifierProvider<SplashProvider>(
                create: (_) => SplashProvider()),
            ChangeNotifierProvider<SplashProvider>(
                create: (_) => SplashProvider()),
            ChangeNotifierProvider<WelcomeProvider>(
                create: (_) => WelcomeProvider()),
            ChangeNotifierProvider<AppNavigationProvider1>(
                create: (_) => AppNavigationProvider1()),
            ChangeNotifierProvider<AffichageCommunautProvider>(
                create: (_) => AffichageCommunautProvider()),
            ChangeNotifierProvider<AdminCommunautProvider>(
                create: (_) => AdminCommunautProvider()),
            ChangeNotifierProvider< AdminCatGorieProvider>(
                create: (_) =>  AdminCatGorieProvider()),
                 ChangeNotifierProvider<AdminProjetProvider>(
                create: (_) => AdminProjetProvider()),
                 ChangeNotifierProvider<ProfileAdminProvider>(
                create: (_) => ProfileAdminProvider()),
                 ChangeNotifierProvider<AdminUtlisaProvider>(
                create: (_) => AdminUtlisaProvider()),
                 ChangeNotifierProvider<ModifierCatGorieProvider>(
                create: (_) => ModifierCatGorieProvider()),
                 ChangeNotifierProvider(create: (_) => AffichageCategorieProvider()),

            // Add more providers here if needed
          ],
          child: Consumer<ThemeProvider>(
            builder: (context, provider, child) {
              return MaterialApp(
                title: 'rifund',
                debugShowCheckedModeBanner: false,
                theme: theme,
                navigatorKey: NavigatorService.navigatorKey,
                localizationsDelegates: [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [Locale('en', '')],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
