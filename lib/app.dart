import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musync/common/api.dart';
import 'package:musync/common/custom_snackbar.dart';
import 'package:musync/common/local_storage_repository.dart';
import 'package:musync/common/loading_screen.dart';
import 'package:musync/routes/routers.dart';
import 'package:musync/features/authentication/bloc/authentication_bloc.dart';
import 'package:musync/features/authentication/data/models/user_model.dart';
import 'package:musync/features/authentication/repositories/user_repositories.dart';
import 'package:musync/utils/themes/app_theme.dart';

/// To check if device is connected to internet using connectivity package
Future<bool> isConnectedToInternet() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

/// To check if server is up by sending a get request to the server
Future<bool> isServerUp() async {
  final api = Api();

  try {
    final response = await api.sendRequest.get(
      '/',
    );
    ApiResponse responseApi = ApiResponse.fromResponse(response);
    if (responseApi.success) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

// scaffoldKey is used to show snackbar
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// navigatorKey is used to navigate to a page without context
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// To check if device is connected to internet and server is up
Future<void> checkConnectivityAndServer() async {
  bool connected = await isConnectedToInternet();
  if (!connected) {
    kShowSnackBar('No internet connection', scaffoldKey: scaffoldKey);
  } else {
    bool serverRunning = await isServerUp();
    if (!serverRunning) {
      kShowSnackBar('Server is down', scaffoldKey: scaffoldKey);
    } else {
      // kShowSnackBar('Server is up', scaffoldKey: scaffoldKey);
    }
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: scaffoldKey,
          body: const HomeWidget(),
        ),
      ),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late bool isFirstTime = true;
  late bool goHome = false;

  late Future<UserModel?> data;

  /// To get user data from server
  Future<UserModel?> getUserData() async {
    // gets isFirstTime and goHome from local storage
    isFirstTime = await LocalStorageRepository().getValue(
      boxName: 'settings',
      key: "isFirstTime",
      defaultValue: true,
    );
    goHome = await LocalStorageRepository().getValue(
      boxName: 'settings',
      key: "goHome",
      defaultValue: false,
    );
    final String token = await LocalStorageRepository()
        .getValue(boxName: 'users', key: 'token', defaultValue: '');

    if (token == "") {
      return null;
    } else {
      try {
        final UserModel user = await UserRepositories().getUser(token: token);
        return user;
      } catch (e) {
        kShowSnackBar(e.toString(), scaffoldKey: scaffoldKey);
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    data = getUserData();
    checkConnectivityAndServer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: "Musync",
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appLightTheme(),
            darkTheme: AppTheme.appDarkTheme(),
            themeMode: ThemeMode.system,
            // theme: ThemeData(
            //   useMaterial3: true, // Enable Material 3
            //   textTheme: Theme.of(context).textTheme.apply(
            //         bodyColor: KColors.blackColor,
            //         displayColor: KColors.blackColor,
            //       ),
            // ),
            // darkTheme: ThemeData(
            //   useMaterial3: true, // Enable Material 3
            //   textTheme: Theme.of(context).textTheme.apply(
            //         bodyColor: KColors.whiteColor,
            //         displayColor: KColors.whiteColor,
            //       ),
            // ),
            routes: snapshot.data == null
                ? Routes.loggedoutRoute
                : Routes.loggedinRoute,
            navigatorKey: navigatorKey,
            onGenerateInitialRoutes: (initialRoute) =>
                Routes.generateInitialRoutes(
              initialRoute: '/',
              context: context,
              isFirstTime: isFirstTime,
              goHome: goHome,
            ),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
