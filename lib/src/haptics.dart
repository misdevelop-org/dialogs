import 'package:flutter/foundation.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

feedbackHeavy() {
  if (!kIsWeb) {
    var _type = FeedbackType.heavy;
    Vibrate.feedback(_type);
  }
}

feedbackImpact() {
  if (!kIsWeb) {
    var _type = FeedbackType.impact;
    Vibrate.feedback(_type);
  }
}

feedbackSuccess() {
  if (!kIsWeb) {
    var _type = FeedbackType.success;
    Vibrate.feedback(_type);
  }
}

feedbackSelection() {
  if (!kIsWeb) {
    var _type = FeedbackType.selection;
    Vibrate.feedback(_type);
  }
}

feedbackError() {
  if (!kIsWeb) {
    var _type = FeedbackType.error;
    Vibrate.feedback(_type);
  }
}

feedbackWarning() {
  if (!kIsWeb) {
    var _type = FeedbackType.warning;
    Vibrate.feedback(_type);
  }
}
