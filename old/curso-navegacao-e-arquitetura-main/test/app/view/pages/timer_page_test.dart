import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/shared/enums/timer_type.dart';
import 'package:fokus/app/view/pages/timer_page.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:mocktail/mocktail.dart';

class MockTimeViewModel extends Mock implements TimeViewModel {}

void main() {
  late MockTimeViewModel mockTimeViewModel;

  Widget createWidget() {
    return ChangeNotifierProvider<TimeViewModel>.value(
      value: mockTimeViewModel,
      child: MaterialApp(
        home: Scaffold(body: TimerPage(timerType: TimerType.focus)),
      ),
    );
  }

  setUpAll(() {
    registerFallbackValue(ValueNotifier<bool>(false));
  });

  setUp(() {
    mockTimeViewModel = MockTimeViewModel();

    when(() => mockTimeViewModel.isPlaying).thenReturn(false);
    when(() => mockTimeViewModel.duration).thenReturn(Duration.zero);
  });

  group('TimerPage UI', () {
    group('TImeType = focus', () {
      testWidgets(
        'Deve exibir o tempo inicial formado corretamente e o btn iniciar',
        (tester) async {
          await tester.pumpWidget(createWidget());

          expect(find.text("00:00"), findsOneWidget);
          expect(find.text("Iniciar"), findsOneWidget);
        },
      );

      testWidgets('Deve chamar o togglePlay ao clilcar em iniciar', (
        tester,
      ) async {
        tester.pumpWidget(createWidget());

        await tester.tap(find.text("Iniciar"));
        await tester.pumpAndSettle();

        verify(() => mockTimeViewModel.togglePlay(25)).called(1);
      });

      testWidgets('mostrar "Pausar após inicar a contage,', (tester) async {
        tester.pumpWidget(createWidget());

        await tester.tap(find.text("Iniciar"));
        await tester.pumpAndSettle();

        tester.runAsync(() async {
          expect(find.text('Pausar'), findsOneWidget);
          expect(find.text('Inicar'), findsNothing);
        });
      });
    });
  });
}
