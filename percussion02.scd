Env([0, 1,0], [0.01, 1.0]).plot;
{LFPar.ar(440, 0.5)}.plot;

(
SynthDef(\percussion02, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;

	env = Env([0, 1,0], [0.01, 0.3]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(XLine.kr(freq, freq * 2)) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;
)

Synth(\percussion02, [\freq, xrand(200)]);
Synth(\percussion02, [\freq, 200]);


(
SynthDef(\wNoise, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.03]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = WhiteNoise.ar() * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;
)

Synth(\wNoise);

(
Pdef(\playPerc2,
	Pbind(
		\instrument, \percussion02,
		\dur, Pseq([1/16], inf),
		\stretch, 3.4285714285714, 	// 60/70 * 4
		\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160], 4)], inf),
		//\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160,160,160, 120], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.7, Pexprand(0.2, 0.3, 3), 0.6, Pexprand(0.2, 0.3, 4)], inf)
	);
).play(quant: 3.4285714285714);

Pdef(\playWhiteNoise,
	Pbind(
		\instrument, \wNoise,
		\dur, Pseq([1/32], inf),
		\stretch, 3.4285714285714,
		\rfreq, Pexprand(610, 640, inf),
		\q, Pexprand(0.05, 0.9, inf),
		\amp, Pseq([0.9, Pexprand(0.2, 0.3, 8)], inf)
	);
).play(quant: 3.4285714285714);

)

Pdef(\playPerc2).stop;
Pdef(\playWhiteNoise).stop;
