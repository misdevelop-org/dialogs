import 'package:flutter/material.dart';
import 'package:sound_library/sound_library.dart';

import 'haptics.dart';

///Window return
pop(BuildContext context, {dynamic value}) {
  Navigator.of(context).pop(value);
}

///Window return until
popUntil(BuildContext context, {String value = '/'}) {
  Navigator.of(context).popUntil(ModalRoute.withName(value));
}

///Open a window
open(context, Widget page) {
  feedbackHeavy();
  SoundPlayer.i.play(Sounds.action);
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  })).then((x) {
    feedbackSuccess();
    SoundPlayer.i.play(Sounds.wood_hit);
  });
}

///Open a window, execute @then until window closed
openThen(context, Widget page, {Function? then}) {
  feedbackHeavy();
  SoundPlayer.i.play(Sounds.action);
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  })).then((x) {
    then!();
    feedbackSuccess();
    SoundPlayer.i.play(Sounds.wood_hit);
  });
}
