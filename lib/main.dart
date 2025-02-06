import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:video_streaming_app/.firebase_options.dart';
import 'package:video_streaming_app/modules/history/history_screen.dart';
import 'package:video_streaming_app/modules/home/cubit/home_cubit.dart';
import 'package:video_streaming_app/modules/playlists/playlists.dart';
import 'package:video_streaming_app/modules/search/search.dart';
import 'package:video_streaming_app/modules/settings/settings.dart';
import 'package:video_streaming_app/modules/video/video_screen.dart';
import 'package:video_streaming_app/shared/constants/constants.dart';
import 'package:video_streaming_app/shared/styles/appTheme.dart';
import 'modules/home/home_screen.dart';
import 'modules/layout/cubit/layout_cubit.dart';
import 'modules/layout/layout_screen.dart';
import 'modules/library/library_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    GoRouter router = GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          routes: [
            GoRoute(
              name: 'home',
              path: '/',
              builder: (context, state) => HomeScreen(),
            ),
            GoRoute(
              name: 'library',
              path: '/library',
              builder: (context, state) => LibraryScreen(),
            ),
          ],
          builder: (context, state, child) => LayoutScreen(
            child: child,
          ),
        ),
        GoRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          name: 'search',
          path: '/search',
          builder: (context, state) => SearchScreen(),
        ),
        GoRoute(
          name: 'history',
          path: '/history',
          builder: (context, state) => HistoryScreen(),
        ),
        GoRoute(
          name: 'video',
          path: '/video',
          builder: (context, state) {
            final title = state.uri.queryParameters['title'];
            final date = state.uri.queryParameters['date'];
            final views = state.uri.queryParameters['views'];
            final video_host = state.uri.queryParameters['video_host'];
            final uploader = state.uri.queryParameters['uploader'];
            final thumbnail = state.uri.queryParameters['thumbnail'];

            return VideoScreen(
              title: title,
              date: date,
              views: views,
              video_host: video_host,
              uploader: uploader,
              thumbnail: thumbnail,
            );
          },
        ),
        GoRoute(
            name: 'playlists',
            path: '/playlists',
            builder: (context, state) => PlaylistsScreen(),
            routes: [
              GoRoute(
                name: 'playlistDetails',
                path: 'playlists/playlistDetails',
                builder: (context, state) => SettingsScreen(),
              ),
            ]),
      ],
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp.router(
        theme: darkThemeValue ? AppTheme.darkTheme : AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: router,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
