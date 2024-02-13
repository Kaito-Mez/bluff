import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/game/models/ruleset.dart';

import '../../../../resources/game/models/ruleset_test_data.dart';

void main() async {
  group("getLargestRole() Tests:", () {
    Ruleset ruleset;
    test(
        'Should return highest non-wildcard number when highest number is a wildcard',
        () {
      ruleset = getTestRuleset();
      int expectedLargestRoll = 5;

      expect(ruleset.getLargestValidRole(), expectedLargestRoll);
    });
    test('Should return highest number when highest number isn\'t a wildcard',
        () {
      ruleset = getTestRuleset(wildcards: [3]);
      int expectedLargestRoll = 6;

      expect(ruleset.getLargestValidRole(), expectedLargestRoll);
    });
    test('Should return highest non-wildcard number on non-standard die', () {
      ruleset = getTestRuleset(numSides: 23, wildcards: [1, 5, 19, 22, 23]);
      int expectedLargestRoll = 21;

      expect(ruleset.getLargestValidRole(), expectedLargestRoll);
    });
  });
  group("getValidBetNumbers() Tests:", () {
    Ruleset ruleset;
    test('Should return all when there is no wildcard', () {
      ruleset = getTestRuleset(wildcards: []);
      List<int> expectedValidBets = [1, 2, 3, 4, 5, 6];

      expect(ruleset.getValidBetNumbers(), expectedValidBets);
    });
    test('Should return all but wildcard when there is one wildcard', () {
      ruleset = getTestRuleset();
      List<int> expectedValidBets = [1, 2, 3, 4, 5];

      expect(ruleset.getValidBetNumbers(), expectedValidBets);
    });
    test('Should return all but wildcards on non-standard die', () {
      ruleset = getTestRuleset(numSides: 14, wildcards: [1, 5, 10, 11, 13]);
      List<int> expectedValidBets = [2, 3, 4, 6, 7, 8, 9, 12, 14];

      expect(ruleset.getValidBetNumbers(), expectedValidBets);
    });
  });
}
