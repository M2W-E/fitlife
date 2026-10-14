import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fitlife/providers/app_providers.dart';

void main() {
  test('providers expose the mock fitness data', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(programsProvider).isNotEmpty, isTrue);
    expect(container.read(trainersProvider).isNotEmpty, isTrue);
    expect(container.read(membershipsProvider).isNotEmpty, isTrue);
    expect(container.read(featuredProgramsProvider).length, lessThanOrEqualTo(4));
    expect(container.read(featuredTrainersProvider).length, lessThanOrEqualTo(3));
  });
}
