import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/shared/enums/timer_type.dart';

void main() {
  group('TRimerType enum', () {
    test('Deve conter os três modes esperados', () {
      expect(TimerType.values.length, 3);
      expect(
        TimerType.values,
        containsAll([
          TimerType.focus,
          TimerType.shortBreak,
          TimerType.longBreak,
        ]),
      );
    });

    test('Cada modo possui o titulo, imagem e os minutos esperado', () {
      expect(TimerType.focus.title, 'Modo Foco');
      expect(TimerType.focus.minutes, 25);
      expect(TimerType.focus.imageName, 'assets/focus.png');
    });
  });
}
