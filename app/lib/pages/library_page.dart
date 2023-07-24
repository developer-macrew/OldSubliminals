import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subliminal/app/theme.dart';
import 'package:subliminal/controllers/user_subs_controller.dart';
import 'package:subliminal/services/service_locator.dart';
import 'package:subliminal/ui/scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  void _deleteSub(String id) async {
    final result = await api().deleteSubliminal(id);
    if (result.ok) {
      userSubs().update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SScaffold(
      body: BlocBuilder<UserSubsController, SubliminalList>(
          builder: (context, state) {
        return SizedBox(
          width: 500,
          child: Card(
            color: Colours.backgroundLight,
            child: ListView(
              children: [
                const Text('Library', style: TextStyle(fontSize: 24)),
                TextButton.icon(
                  onPressed: () => userSubs().update(),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh'),
                ),
                if (state.requests.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        const Text('Generating',
                            style: TextStyle(fontSize: 20)),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.requests.length,
                          itemBuilder: (context, i) {
                            final req = state.requests[i];
                            return ListTile(
                              tileColor: i % 2 == 0
                                  ? Colours.backgroundDark
                                  : Colours.accent,
                              leading: const CircularProgressIndicator(),
                              title: Text(req.title ?? 'Unnamed'),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.ready.length,
                  itemBuilder: (context, i) {
                    Subliminal sub = state.ready[i];
                    return ListTile(
                      tileColor:
                          i % 2 == 0 ? Colours.backgroundDark : Colours.accent,
                      title: Text(sub.title),
                      subtitle: Column(
                        children: [
                          Text(
                              '${DateTime.fromMillisecondsSinceEpoch(sub.timestamp)}'),
                          TextButton.icon(
                            onPressed: () => _deleteSub(sub.id),
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete'),
                          ),
                        ],
                      ),
                      trailing: TextButton(
                        onPressed: () => launchUrl(Uri.parse(sub.url!)),
                        child: const Text('Download'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
