import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:video_streaming_app/modules/auth/cubit/user_cubit.dart';
import 'package:video_streaming_app/modules/playlists/playlists_widgets.dart';
import 'package:video_streaming_app/shared/styles/textStyles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyles.header,
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              title: Text(
                'General',
                style: TextStyles.previousSearch,
              ),
              onTap: () {
                context.pushNamed('general');
              },
            ),
            ListTile(
              title: Text(
                'Account',
                style: TextStyles.previousSearch,
              ),
              onTap: () {
                context.pushNamed('account');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyles.header,
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Text(
              'GENERAL SETTINGS',
              style: TextStyles.header,
            )
          ],
        ),
      ),
    );
  }
}

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Settings',
          style: TextStyles.header,
        ),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListTile(
              title: Text(
                'Logout',
                style: TextStyles.previousSearch,
              ),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                          'Are you sure you want to log out of your account?'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cubit.logout();
                            context.goNamed('login');
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text(
                'Delete account',
                style: TextStyles.previousSearch,
              ),
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                          'Are you sure you want to delete your account?'),
                      content: const Text(
                        'This cannot be undone',
                      ),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Yes'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            cubit.deleteAccount();
                            context.goNamed('login');
                          },
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
