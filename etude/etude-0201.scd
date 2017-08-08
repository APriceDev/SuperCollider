// ************************* utilities *************************
~q = 3.5;

(
  s.recSampleFormat = 'int16';
  s.recHeaderFormat = 'wav'
)

s.record;
s.stopRecording;

// ************************* fx *************************
(
SynthDef(\reverb, { |in = 0, out = 0, mix = 0.5, room = 0.5, damp = 0.5, pan = 0, amp = 1 |
	var reverb;
	reverb = FreeVerb.ar(InFeedback.ar(in),mix,room,damp);
	Out.ar(out, Pan2.ar(reverb, pan, amp));
}).add;
)


~playSaw = Synth(\reverb, [\out, 0, \in, 8, \room, 0.5, \mix, 0.25, \damp, 0.75]);

~playwNoise = Synth(\reverb, [\out, 0, \in, 2, \room, 0.0, \mix, 0.0, \damp, 0.0]);
~playBeat00Hi = Synth(\reverb, [\out, 0, \in, 4, \room, 0.0, \mix, 0.0, \damp, 0.0]);
~playSteelDrum = Synth(\reverb, [\out, 0, \in, 6, \room, 0.9, \mix, 0.75, \damp, 0.9]);


// ************************* synth *************************
(
SynthDef(\leadSaw, {
	|out = 0|
	var sig, sig2, amp, env;

	env = Env([0, 1, 0], [10, 10], [2, -2]);
	env = EnvGen.kr(env, doneAction:2);

	amp = SinOsc.kr({ExpRand(0.2, 12)} !8).range(0,0.8);

	sig2 = VarSaw.ar({ExpRand(40, 60)}, {ExpRand(0.1, 0.9)}, {ExpRand(0.1, 0.9)} !8);
	sig = SinOsc.ar({ExpRand(50, 1200)} !8);
	sig = sig * sig2 * amp * env * 0.8;
	sig = Splay.ar(sig) * 0.5;
	Out.ar(out, sig);
}).add;
)

Synth(\leadSaw);

(
Pdef(\playLeadSaw,
	Pbind(
		\instrument, \leadSaw,
		\dur, 11,
		\out, 0
	);
).play;
)

Pdef(\playLeadSaw).stop;
Pdef(\playLeadSaw).play;



// ************************* percussion *************************

// beat 00
(
SynthDef(\beat00, {
	|out = 0, freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1|
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.3]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(XLine.kr(freq, freq * 2)) * env * amp * 0.8;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(out, sig !2);
}).add;
)

(
Synth(\beat00);
)

// beat 01
(
SynthDef(\beat01, {
	|out = 0, freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1|
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.1]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = LFPar.ar(freq) * env * amp;
	//sig = LFCub.ar(freq) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(out, sig !2);
}).add;
)

(
Synth(\beat01);
)

// white noise
(
SynthDef(\wNoise, {
	|out = 0,freq = 110, rate = 1, amp = 1, rfreq = 440, q = 1|
	var sig, env;
	env = Env([0, 1,0], [0.01, 0.03]);
	env = EnvGen.kr(env, doneAction: 2);
	sig = WhiteNoise.ar() * env * amp * 0.9;
	sig = RLPF.ar(sig, rfreq, q);
	Out.ar(out, sig !2);
}).add;
)

(
Synth(\wNoise);
)

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

// ************************* performance *************************
(

Pdef(\playBeat00,
	Pbind(
		\instrument, \beat00,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/70 * 4
		\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160], 4)]/3, inf),
		//\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160,160,160, 120], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		//\amp, Pseq([0.5, Pexprand(0.2, 0.3, 3), 0.4, Pexprand(0.2, 0.3, 4)], inf),
		\amp, Pseq([0.7, Pexprand(0.4, 0.6, 3), 0.5, Pexprand(0.4, 0.6, 4)], inf),
		\out, 0
	);
).play(quant: ~q);

Pdef(\playBeat00Hi,
	Pbind(
		\instrument, \beat00,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/70 * 4
		\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160], 4)], inf),
		//\freq, Pseq([160, Pseq([140], 3), 70, Pseq([160,160,160, 120], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		\amp, Pseq([0.4, Pexprand(0.1, 0.2, 3), 0.3, Pexprand(0.1, 0.2, 4)], inf),
		\out, 4
	);
).play(quant: ~q);

Pdef(\playBeat01,
	Pbind(
		\instrument, \beat01,
		\dur, Pseq([1/16], inf),
		\stretch, ~q, 	// 60/90 * 4.5
		\freq, Pseq([60, Pseq([40], 3), 70, Pseq([60], 4)], inf),
		\rfreq, Pexprand(440, 4400, inf),
		\q, Pexprand(0.025, 1, inf),
		//\amp, Pseq([0.9, Pexprand(0.2, 0.3, 3), 0.8, Pexprand(0.2, 0.3, 4)], inf),
		\amp, Pseq([0.9, Pexprand(0.4, 0.6, 3), 0.8, Pexprand(0.4, 0.6, 4)], inf),
		\out, 0
	);
).play(quant: ~q);

Pdef(\playwNoise,
	Pbind(
		\instrument, \wNoise,
		\dur, Pseq([1/32], inf),
		\stretch, ~q,
		\rfreq, Pexprand(610, 640, inf),
		\q, Pexprand(0.05, 0.9, inf),
		\amp, Pseq([0.7, Pexprand(0.1, 0.2, 7), 0.6, Pexprand(0.1, 0.3, 9)], inf),
		\out, 2
	);
).play(quant: ~q);

Pdef(\playSteelDrum,
	Pbind(
		\instrument, \steelDrum,
		\freq, Pexprand(60, 110, inf),
		\f1, Pexprand(600, 800),
		\end, Pexprand(0.8, 1.8),
		\rfreq, Pexprand(400, 4000),
		\amp, Pexprand(0.04, 0.08),
		//\dur, Pseq([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1]1) ,
		//\dur, Pwhite(0.2, 0.5,inf),
		\dur, Pseq([4/1], inf),
		\out, 6
		//\out, 0
	);
).play(quant: ~q);

)

// ************************* start/stop *************************

(
Pdef(\playBeat00Hi).stop;
Pdef(\playwNoise).stop;
Pdef(\playBeat00).stop;
Pdef(\playBeat01).stop;
Pdef(\playSteelDrum).stop;
)


(
Pdef(\playBeat00).play;
Pdef(\playBeat00Hi).play;
Pdef(\playBeat01).play;
Pdef(\playwNoise).play;
Pdef(\playSteelDrum).play;
)
