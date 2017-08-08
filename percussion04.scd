// http://blog.carltesta.net/post/21145244657/approach-to-working-with-supercollider-in

/*

You can now use Pbindef to only change one parameter of the Pdef at a time. This basically just provides a streamlined interface to changing parameters. So you don’t have to execute the whole Pdef each time you want to change something.

Pbindef(\space, \density, Pseg(Pseq([2,100], inf), 10, \exponential));
Pbindef(\space, \freq, Prand([6000,100,200,400],inf));
You can change the fade time between changes using the following code

Pdef(\space).fadeTime = 10;

*/

~qa = 3.4;

(
SynthDef(\reverb, { |in=0, out=0, mix=0.5, room=0.5, damp=0.5, pan=0, amp=1 |
	var reverb;
	reverb = FreeVerb.ar(InFeedback.ar(in),mix,room,damp);
	Out.ar(out, Pan2.ar(reverb, pan, amp));
}).add;
)

~reverb = Synth(\reverb, [\out, 0, \in, 3, \room, 0.5, \mix, 0.7, \damp, 0.5]);
~reverb.set(\room, 0.9);
~reverb.set(\mix, 0.9);
~reverb.set(\damp, 0.6);

(
SynthDef(\biTone, {

	|out = 0, freq1 = 220, amp = 0.5, rfreq = 440, q = 1|

	var sig0, sig1, sig2, sig3, env, freq2 = freq1 + 20;

	env = Env([0, 1,0], [0.01, 1.0]);
	env = EnvGen.kr(env, doneAction: 2);

	sig1 = LFPar.ar(XLine.kr(freq1, freq1 * 2));
	sig2 = LFPar.ar(XLine.kr(freq2 * 2, freq2));


	sig0 = (sig1 + sig2) * env * amp;
	sig0 = RLPF.ar(sig0, rfreq, q);

	Out.ar(out, sig0 !2);
}).add;
)

(
Synth(\biTone, [
	\freq1, rrand(60, 110),
	\amp, rrand(0.15, 0.3),
	\rfreq, rrand(600, 1000),
]);
)

(
SynthDef(\steelDrum01, {
	|out = 0, freq = 110, f1 = 800, f2 = 1071, f3 = 1153, f4 = 1723, end = 1.8, rfreq = 440, q = 1, amp= 0.5|
	var sig, env;

	env = Env([0, 1,0], [0.01, end]);
	env = EnvGen.kr(env, doneAction: 2);

	sig = Klank.ar(`[[f1, f2, f3, f4], nil, [0.5, 0.5, 0.5, 0.5]], LFPar.ar(freq));
	sig = RLPF.ar(sig, rfreq, q) * env * amp;
	Out.ar(out, sig !2);

}).add;
)

(
Synth(\steelDrum01, [
	\freq, rrand(60, 110),
	\f1, rrand(600, 800),
	\end, rrand(0.8, 1.8),
	\rfreq, rrand(400, 4000),
	\amp, rrand(0.08, 0.15),
	\out, 0
]);
)

(
Pdef(\playPerc04,
	Pbind(
		\instrument, \steelDrum01,

		\dur, Pseq([1/4], inf),
		\stretch, ~qa, 	// 60/90 * 4.5

		\freq, Pexprand(60, 110, inf),
		\f1, Pexprand(600, 800),
		\end, Pexprand(0.8, 1.8),
		\rfreq, Pexprand(400, 4000),
		\amp, Pexprand(0.07, 0.12),
		//\dur, Pseq([1.0, 0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1]1) ,
		//\dur, Pwhite(0.2, 0.5,inf),
		\out, 0,
	);
).play(quant: ~qa);
)

Pdef(\playPerc04).stop;
Pdef(\playPerc04).play;


(
SynthDef(\biToneCombo, {

	|out = 0, freq1 = 220, amp = 0.5, rfreq = 440, q = 1,
	freq = 110, f1 = 800, f2 = 1071, f3 = 1153, f4 = 1723|

	var sig0, sig1, sig2, sig3, env, freq2 = freq1 + 20;

	env = Env([0, 1,0], [0.01, 1.0]);
	env = EnvGen.kr(env, doneAction: 2);

	sig1 = LFPar.ar(XLine.kr(freq1, freq1 * 2));
	sig2 = LFPar.ar(XLine.kr(freq2 * 2, freq2));

	sig3 = Klank.ar(`[[f1, f2, f3, f4], nil, [0.5, 0.5, 0.5, 0.5]], LFPar.ar(freq));

	//sig0 = (sig1 + sig2 + sig3) * env * amp;
	sig0 = Mix([sig1, sig2, sig3]) * env * amp;
	sig0 = RLPF.ar(sig0, rfreq, q);

	Out.ar(out, sig0 !2);
}).add;
)

(
Synth(\biToneCombo, [
	\freq1, rrand(60, 110),
	\amp, rrand(0.15, 0.3),
	\rfreq, rrand(600, 1000),
	\freq, rrand(60, 110),
	\f1, rrand(600, 800),
	\end, rrand(0.8, 1.8)
]);
)


(
Pdef(\playPerc04a,
	Pbind(
		\instrument, \biToneCombo,
		\freq1, Pexprand(60, 110),
		\amp, Pexprand(0.15, 0.3),
		\rfreq, Pexprand(600, 1000),
		\freq, Pexprand(60, 110),
		\f1, Pexprand(600, 800),
		\end, Pexprand(0.8, 1.8),
		\dur, Pwhite(0.1,1.0,inf),
		//\dur, 0.4,
	);
).play;
)

Pdef(\playPerc04a).stop;
Pdef(\playPerc04a).play;