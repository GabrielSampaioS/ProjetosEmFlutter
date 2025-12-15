import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';

void main() {
  group('TimeViewModel', () {
    late TimeViewModel vm;

    setUp(() {
      vm = TimeViewModel();
    });
    test('Inicia parado com duração zero', () {
      expect(vm.isPlaying, isFalse);
      expect(vm.duration, Duration.zero);
    });

    group('startTime', () {
      test('Liga o temporizador e zera a duração', () {
        vm.duration = Duration(minutes: 10);
        vm.togglePlay(5);

        expect(vm.isPlaying, isTrue);
        expect(vm.duration, Duration.zero);
      });
      test('Incrementa a cada segundo quando não está paudando', () async {
        vm.togglePlay(5);
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration.inSeconds == 1, isTrue);
      });

      test('Não incrementa o valor quando está pausado', () async {
        vm.togglePlay(5);

        await Future.delayed(Duration(seconds: 2));
        vm.togglePause();

        final pausedValue = vm.duration.inSeconds;

        await Future.delayed(Duration(seconds: 2));
        expect(vm.duration.inSeconds, pausedValue);

        vm.togglePause();
        await Future.delayed(Duration(seconds: 2));
        expect(vm.duration.inSeconds, greaterThan(pausedValue));
      });
    });
  });
}
