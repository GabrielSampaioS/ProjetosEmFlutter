import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/view/widgets/timer_widget.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MockTimerViewModel extends Mock implements TimeViewModel {}

void main() {
  late MockTimerViewModel mockTimerViewModel;

  Widget createWidget() {
    return ChangeNotifierProvider<TimeViewModel>.value(
      value: mockTimerViewModel,
      child: MaterialApp(home: Scaffold(body: TimerWidget(initialMinutes: 1))),
    );
  }

  setUpAll(() {
    registerFallbackValue(ValueNotifier(ValueNotifier<bool>(false)));
  });

  setUp(() {
    mockTimerViewModel = MockTimerViewModel();
    when(() => mockTimerViewModel.isPlaying).thenReturn(false);
    when(() => mockTimerViewModel.duration).thenReturn(Duration.zero);
  });

  //todo
  //conseguir realizar o mock, estudar sobre provider
  group('TimerWidget', () {
    testWidgets('exibe tempo inicial zerado e formatado corretamente', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());
      expect(find.text('00:00'), findsOneWidget);
    });

    testWidgets('ao tocar em inicar, chama startTimer do TimerViewModel', (
      tester,
    ) async {
      await tester.pumpWidget(createWidget());

      final startButton = find.text('Iniciar');
      expect(startButton, findsOneWidget);

      await tester.tap(startButton);
      await tester.pumpAndSettle();

      verify(() => mockTimerViewModel.togglePlay(any())).called(1);
    });
  });
}
