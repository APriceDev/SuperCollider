x = {SinOsc.ar(440,0,0.25,0)}.play
x.free;
s.record();

(
{SinOsc.ar(
	freq: SinOsc.kr(freq: 1, mul: 10, add: 300)
)}.play
)