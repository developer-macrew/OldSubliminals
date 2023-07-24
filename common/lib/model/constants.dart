enum SubliminalStatus {
  ready,
  generating,
  queue,
  none;
}

const List<String> supportedVoices = [
  'en-GB-Wavenet-A',
  'en-GB-Wavenet-B',
  'en-AU-Wavenet-A',
  'en-AU-Wavenet-B',
  'en-US-Wavenet-A',
  'en-US-Wavenet-B',
  'de-DE-Wavenet-A',
  'de-DE-Wavenet-B',
];

enum SpeechAlignment {
  start,
  centre,
  end;

  const SpeechAlignment();
}
