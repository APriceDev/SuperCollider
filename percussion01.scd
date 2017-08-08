Env([0, 1,0], [0.01, 0.1]).plot;
{LFPar.ar(440, 0.5)}.plot;

(
SynthDef(\percussion01, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.1]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(freq) * env * amp;
	//sig = LFCub.ar(freq) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;
)

Synth(\percussion01);

(
Pdef(\playPerc1,
	Pbind(
		\instrument, \percussion01,
		\dur, Pseq([1/16], inf),
		\stretch, 3, 	// 60/90 * 4.5
		\freq, Pseq([60, Pseq([40], 3), 70, Pseq([60], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.9, Pexprand(0.2, 0.3, 3), 0.8, Pexprand(0.2, 0.3, 4)], inf)
	);
).play(quant: 3);

Pdef(\playPerc1a,
	Pbind(
		\instrument, \percussion01,
		\dur, Pseq([1/8], inf),
		\stretch, 3,
		\freq, Pexprand(20, 30, inf),
		\rfreq, Pexprand(440, 640, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([1, Pseq([0.4],6)], inf)
	);
).play(quant: 3);
)

Pdef(\playPerc1).stop;
Pdef(\playPerc1a).stop;