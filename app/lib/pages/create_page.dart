import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subliminal/app/router.dart';
import 'package:subliminal/app/theme.dart';
import 'package:subliminal/controllers/create_controller.dart';
import 'package:subliminal/services/service_locator.dart';
import 'package:subliminal/ui/scaffold.dart';
import 'package:go_router/go_router.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool submitting = false;
  late CreateController controller = CreateController();
  @override
  Widget build(BuildContext context) {
    return SScaffold(
      body: BlocBuilder<CreateController, SubliminalRequest>(
          bloc: controller,
          builder: (context, state) {
            return SizedBox(
              width: 500,
              child: Card(
                color: Colours.backgroundLight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      const Text(
                        'New Subliminal',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Title',
                          fillColor: Colors.white.withOpacity(0.1),
                        ),
                        onChanged: controller.setTitle,
                      ),
                      TextField(
                        decoration:
                            const InputDecoration(hintText: 'Subliminal text'),
                        onChanged: controller.setText,
                        minLines: 3,
                        maxLines: 5,
                      ),
                      _speechFields(state),
                      _arrangementFields(state),
                      _speechFx(state),
                      const SizedBox(height: 150),
                      ElevatedButton(
                        onPressed: submitting ? null : _submit,
                        child: const Text('Create'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _speechFields(SubliminalRequest state) {
    return ExpansionTile(
      title: const Text(
        'Speech Parameters',
        style: TextStyle(fontSize: 24),
      ),
      children: [
        DropdownButton<String>(
          value: state.config.voice,
          items: supportedVoices
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ),
              )
              .toList(),
          onChanged: (v) => controller.setVoice(v ?? 'en-GB-Wavenet-A'),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Speed'),
            Expanded(
              child: Slider(
                value: state.config.speed.toDouble(),
                onChanged: controller.setSpeed,
                min: 0.25,
                max: 4.0,
              ),
            ),
            Text(state.config.speed.toStringAsFixed(1)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Pitch'),
            Expanded(
              child: Slider(
                value: state.config.pitch.toDouble(),
                onChanged: controller.setPitch,
                min: -20.0,
                max: 20.0,
              ),
            ),
            Text(state.config.pitch.toStringAsFixed(1)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Gain'),
            Expanded(
              child: Slider(
                value: state.config.gain.toDouble(),
                onChanged: controller.setGain,
                min: -96.0,
                max: 16.0,
              ),
            ),
            Text(state.config.gain.toStringAsFixed(1)),
          ],
        ),
      ],
    );
  }

  Widget _arrangementFields(SubliminalRequest state) {
    return ExpansionTile(
      title: const Text(
        'Arrangement',
        style: TextStyle(fontSize: 24),
      ),
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Offset'),
            Expanded(
              child: Slider(
                value: state.config.offset.toDouble(),
                onChanged: (v) => controller.setOffset(v.floor()),
                min: 0,
                max: 30000,
              ),
            ),
            Text('${state.config.offset}ms'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Alignment'),
            DropdownButton<String>(
              value: state.config.align,
              items: SpeechAlignment.values
                  .map((e) => DropdownMenuItem<String>(
                        value: e.name,
                        child: Text(e.name.capitalise()),
                      ))
                  .toList(),
              onChanged: controller.setAlign,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Repeat'),
            Expanded(
              child: TextFormField(
                initialValue: state.config.repeat.toString(),
                onChanged: (v) => controller.setRepeat(int.parse(v)),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _speechFx(SubliminalRequest state) {
    return ExpansionTile(
      title: const Text(
        'Speech FX',
        style: TextStyle(fontSize: 24),
      ),
      children: [
        CheckboxListTile(
          value: state.config.speechFx.reverb != null,
          onChanged: (v) => controller.setSpeechReverb(v ?? false),
          title: const Text('Reverb'),
        ),
        CheckboxListTile(
          value: state.config.speechFx.reverse ?? false,
          onChanged: (v) => controller.setSpeechReverb(v ?? false),
          title: const Text('Reverse'),
        ),
      ],
    );
  }

  void _submit() async {
    setState(() => submitting = true);
    final result = await api().createSubliminal(controller.state);
    if (result.ok) {
      userSubs().update();
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(result.ok
            ? 'Submitted request, redirecting to library...'
            : 'Error occurred: ${result.error}'),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    if (result.ok) {
      context.go(Routes.library);
    }
  }
}
