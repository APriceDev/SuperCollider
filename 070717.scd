{SinOsc.ar([XLine.kr(220, 440, 10), XLine.kr(440, 220, 10)])}.play

(
SynthDef(\Test, {
	arg freq = 220,
	filter = 440,
	mul,
	high = 2;

	var env = Env.linen(1, 0.5, 2.5, 2.5, -2),
	rise = XLine.ar(freq, freq * high, 6),
	wave = Pulse.ar(rise) * EnvGen.kr(env, doneAction: 2);

	Out.ar([0, 1], LPF.ar(wave, filter, mul));
}).add
)

Env.linen(1, 0.6, 2.5, 2.9, -2).plot

(
a = Synth(\Test, [
	\freq, rrand(40, 220),
	\filter, rrand(220, 2440),
	\mul, rrand(0.25, 0.5),
	\high, rrand(2, 12)
])
)
//a.set("freq", 80)
//a.free