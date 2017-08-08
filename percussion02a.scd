~q = 3.4285714285714;
//~q = 3.2;

(
SynthDef(\percussionA, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.1]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(freq) * env * amp;
	//sig = LFCub.ar(freq) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;

SynthDef(\percussionB, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.3]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(XLine.kr(freq, freq * 2)) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;

SynthDef(\percussionC, {
	arg freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1;
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.03]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = WhiteNoise.ar() * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(0, sig !2);
}).add;
)

(
Pdef(\playPercA1,
	Pbind(
		\instrument, \percussionA,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/90 * 4.5
		\freq, Pseq([60, Pseq([40], 3), 70, Pseq([60], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.9, Pexprand(0.2, 0.3, 3), 0.8, Pexprand(0.2, 0.3, 4)], inf)
	);
).play(quant: ~q);

Pdef(\playPercA2,
	Pbind(
		\instrument, \percussionA,
		\dur, Pseq([1/8], inf),
		//\dur, Pseq([1/18], inf),
		\stretch, ~q,
		\freq, Pexprand(20, 30, inf),
		\rfreq, Pexprand(440, 640, inf),
		\q, Pexprand(0.025, 1, inf),
		//\amp, Pseq([1, Pseq([0.4],8)], inf)
		\amp, Pseq([0.8, 0.4], inf)
	);
).play(quant: ~q);

Pdef(\playPercB1,
	Pbind(
		\instrument, \percussionB,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/70 * 4
		\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160], 4)], inf),
		//\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160,160,160, 120], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.5, Pexprand(0.2, 0.3, 3), 0.4, Pexprand(0.2, 0.3, 4)], inf)
	);
).play(quant: ~q);

Pdef(\playPercB2,
	Pbind(
		\instrument, \percussionB,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/70 * 4
		\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160], 4)]/3, inf),
		//\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160,160,160, 120], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.5, Pexprand(0.2, 0.3, 3), 0.4, Pexprand(0.2, 0.3, 4)], inf)
	);
).play(quant: ~q);


Pdef(\playPercC1,
	Pbind(
		\instrument, \percussionC,
		\dur, Pseq([1/32], inf),
		\stretch, ~q,
		\rfreq, Pexprand(610, 640, inf),
		\q, Pexprand(0.05, 0.9, inf),
		\amp, Pseq([0.9, Pexprand(0.2, 0.3, 8)], inf)
	);
).play(quant: ~q);
)

(
Pdef(\playPercA1).stop;
Pdef(\playPercA2).stop;
Pdef(\playPercB1).stop;
Pdef(\playPercB2).stop;
Pdef(\playPercC1).stop;
)

(
Pdef(\playPercA1).play;
Pdef(\playPercA2).play;
Pdef(\playPercB1).play;
Pdef(\playPercB2).play;
Pdef(\playPercC1).play;
)
