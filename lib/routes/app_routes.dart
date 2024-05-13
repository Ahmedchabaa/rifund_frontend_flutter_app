import 'package:flutter/material.dart';
import 'package:rifund/screens/details_projet_screen/details_projet_screen.dart';

import '../screens/acceuil_client_page/acceuil_client_page.dart';
import '../screens/affichage_communaut_container_screen/affichage_communaut_container_screen.dart';
import '../screens/ajout_cat_gorie_page/ajout_cat_gorie_page.dart';
import '../screens/chat_box_screen/chat_box_screen.dart';
import '../screens/cr_er_communaut_screen/cr_er_communaut_screen.dart';
import '../screens/cr_er_un_compte_screen/cr_er_un_compte_screen.dart';
import '../screens/creationprojet/creationprojet.dart';
import '../screens/financer_projet_screen/financer_projet_screen.dart';
import '../screens/liste_de_communaut_page/liste_de_communaut_page.dart';
import '../screens/listeprojets/listeprojets.dart';
import '../screens/membre_rejoindre_screen/membre_rejoindre_screen.dart';
import '../screens/modifier_communaut_screen/modifier_communaut_screen.dart';
import '../screens/modifier_motdepasse_screen/modifier_motdepasse_screen.dart';
import '../screens/modifier_nom_screen/modifier_nom_screen.dart';
import '../screens/modifierscreen/modifierprojetscreen.dart';
import '../screens/mot_de_passe_oublier_screen/mot_de_passe_oublier_screen.dart';
import '../screens/navigation/app_navigation_screen.dart';
import '../screens/notification_page/notification_page.dart';
import '../screens/profile_screen/profile_screen.dart';
import '../screens/se_connecter_screen/se_connecter_screen.dart';
import '../screens/splash_page/splash_screen.dart';
import '../screens/welcome_screen/welcome_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String welcomeScreen = '/welcome_screen';

  static const String seConnecterScreen = '/se_connecter_screen';

  static const String crErUnCompteScreen = '/cr_er_un_compte_screen';

  static const String motDePasseOublierScreen = '/mot_de_passe_oublier_screen';

  static const String acceuilClientPage = '/acceuil_client_page';

  static const String crProjetScreen = '/creationprojet';

  static const String listeDesProjetsPage = '/liste_des_projets_page';

  static const String detailsProjetScreen = '/details_projet_screen';

  static const String modifierProjetScreen = '/modifier_projet_screen';

  static const String ajoutCatGoriePage = '/ajout_cat_gorie_page';

  static const String notificationPage = '/notification_page';

  static const String financerProjetScreen = '/financer_projet_screen';

  static const String listeDeCommunautPage = '/liste_de_communaut_page';

  static const String crErCommunautScreen = '/cr_er_communaut_screen';

  static const String modifierCommunautScreen = '/modifier_communaut_screen';

  static const String membreRejoindreScreen = '/membre_rejoindre_screen';

  static const String chatBoxScreen = '/chat_box_screen';

  static const String affichageCommunautContainerScreen =
      '/affichage_communaut_container_screen';

  static const String modifierNomScreen = '/modifier_nom_screen';

  static const String profileScreen = '/profile_screen';

  static const String modifierMotdepasseScreen = '/modifier_motdepasse_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        crProjetScreen: CrErProjetScreen.builder,
        welcomeScreen: WelcomeScreen.builder,
        splashScreen: SplashScreen.builder,
        seConnecterScreen: SeConnecterScreen.builder,
        acceuilClientPage: AcceuilClientPage.builder,
        crErUnCompteScreen: CrErUnCompteScreen.builder,
        motDePasseOublierScreen: MotDePasseOublierScreen.builder,
        modifierProjetScreen: ModifierProjetScreen.builder,
        financerProjetScreen: FinancerProjetScreen.builder,
        ajoutCatGoriePage: AjoutCatGoriePage.builder,
        notificationPage: NotificationPage.builder,
        listeDesProjetsPage: ListeDesProjetsPage.builder,
        crErCommunautScreen: CrErCommunautScreen.builder,
        modifierCommunautScreen: ModifierCommunautScreen.builder,
        listeDeCommunautPage: ListeDeCommunautPage.builder,
        membreRejoindreScreen: MembreRejoindreScreen.builder,
        detailsProjetScreen: DetailsProjetScreen.builder,
        chatBoxScreen: ChatBoxScreen.builder,
        affichageCommunautContainerScreen:
            AffichageCommunautContainerScreen.builder,
        modifierNomScreen: ModifierNomScreen.builder,
        profileScreen: ProfileScreen.builder,
        modifierMotdepasseScreen: ModifierMotdepasseScreen.builder,
        initialRoute: ProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
      };
}
