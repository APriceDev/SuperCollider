// ************************* utilities *************************
~q = 2.4; //60/100 * 4 = 100bpm

// ************************* fx *************************
(
SynthDef(\reverb, { |in = 0, out = 0, mix = 0.5, room = 0.5, damp = 0.5, pan = 0, amp = 1 |
	var reverb;
	reverb = FreeVerb.ar(InFeedback.ar(in),mix,room,damp);
	Out.ar(out, Pan2.ar(reverb, pan, amp));
}).add;
)

~playSteelDrum = Synth(\reverb, [\out, 0, \in, 6, \room, 0.25, \mix, 0.25, \damp, 0.5]);

// steel drum
(
SynthDef(\steelDrum, {
	|out = 0, freq = 110, f1 = 800, f2 = 1071, f3 = 1153, f4 = 1723, end = 1.8, rfreq = 440, q = 1, amp= 0.5|
	var sig, env;

	env = Env([0, 1,0], [0.01, end]);
	env = EnvGen.kr(env, doneAction: 2);

	sig = Klank.ar(`[[f1, f2, f3, f4], nil, [0.5, 0.5, 0.5, 0.5]], LFPar.ar(freq));
	sig = RLPF.ar(sig, rfreq, q) * env * amp * 0.6;
	Out.ar(out, sig !2);

}).add;
)

(
Synth(\steelDrum, [
	\freq, rrand(60, 110),
	\f1, rrand(600, 800),
	\end, rrand(0.8, 1.8),
	\rfreq, rrand(400, 4000),
	\amp, rrand(0.08, 0.15),
	\out, 0
]);
)

(
Pdef(\playSteelDrum,
	Pbind(
		\instrument, \steelDrum,
		\dur, Pseq([1/8], inf),
		\stretch, ~q,
		\freq, Pexprand(110, 220, inf),
		\f1, Pexprand(600, 1200, inf),
		\f2, Pexprand(1071, 1606, inf),
		\f3, Pexprand(1153, 1729, inf),
		\f4, Pexprand(1723, 2584, inf),
		\end, Pexprand(1.8, 2.8),
		\out, 6
	);
//).play;
).play(quant: ~q);


)


Pdef(\playSteelDrum).stop;
Pdef(\playSteelDrum).play;

