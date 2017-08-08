~b = Buffer.read(s, "sounds/a11wlk01.wav");

{PlayBuf.ar(1, ~b, rate: 1.0, doneAction: 2)}.play