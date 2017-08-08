// http://sccode.org/1-4YS

Env([0, 1,0], [0.001, 0.001]).plot

(
SynthDef(\percussion03, {
	arg freq = 110, freq2 = 110,
	rate = 1,
	width = 0.5,
	amp = 1, amp2 = 0.25, amp3 = 0.8,
	rfreq = 440, q = 1,
	rfreq2 = 1440, q2 = 1,
	rfreq3 = 1440, q3 = 1;

	var sig, env, sig2, env2, sig3, env3;

	env = Env([0, 1,0], [0.01, 0.3]);
	env = EnvGen.kr(env, doneAction: 2);

	sig3 = WhiteNoise.ar();
	env3 = Env([0, 1,0], [0.001, 0.01]);
	env3 = EnvGen.kr(env3, doneAction: 0);
	sig3 = RLPF.ar(sig3, rfreq3, q3) * env3 * amp3;

	env2 = Env([0, 1,0], [0.001, 0.03]);
	env2 = EnvGen.kr(env2, doneAction: 0);
	sig2 = Pulse.ar(freq2, width) * env2 * amp2;
	sig2 = RLPF.ar(sig2, rfreq2, q2);

	sig = LFPar.ar(XLine.kr(freq, freq * 2)) * env * amp;
	sig = RLPF.ar(sig, rfreq, q);
	sig = sig + sig2 + sig3;
	Out.ar(0, sig !2);
}).add;
)

(
Synth(\percussion03, [
	\freq, rrand(1600, 3400),
	//\freq, rrand(60, 100),
	\rfreq1, rrand(20, 40),
	\freq2, rrand(600, 4000),
	\rfreq2, rrand(200, 2000)
]);
)

(
Synth(\percussion03, [
	//\freq, rrand(1600, 3400),
	\freq, rrand(60, 100),
	\rfreq1, rrand(20, 40),
	\freq2, rrand(100, 200),
	\rfreq2, rrand(200, 2000)
]);
)

(
Pdef(\playPerc03,
	Pbind(
		\instrument, \percussion03,
		\freq, Pexprand(1600, 3400, inf),
		\rfreq1, Pexprand(20, 40, inf),
		\freq2, Pexprand(600, 4000, inf),
		\rfreq2, Pexprand(200, 2000, inf),
		//\dur, Pexprand(0.08, 0.1, inf),
		\dur, 0.2,
	);
).play;

Pdef(\playPerc04,
	Pbind(
		\instrument, \percussion03,
		\freq, Pexprand(50, 70, inf),
		\rfreq1, Pexprand(20, 40, inf),
		\freq2, Pexprand(100, 2000, inf),
		\rfreq2, Pexprand(200, 2000, inf),
		//\dur, Pexprand(0.08, 0.1, inf),
		\dur, 0.6,
	);
).play;

Pdef(\playPerc05,
	Pbind(
		\instrument, \percussion03,
		\freq, Pexprand(40, 60, inf),
		\rfreq1, Pexprand(20, 40, inf),
		\freq2, Pexprand(400, 600, inf),
		\rfreq2, Pexprand(200, 2000, inf),
		//\dur, Pexprand(0.08, 0.1, inf),
		\dur, 0.4,
	);
).play;
)

Pdef(\playPerc03).stop;
Pdef(\playPerc04).stop;
Pdef(\playPerc05).stop;

Klang
Klank
Ringz
Resonz

{ Ringz.ar(SinOsc.ar(220), 221, 2) }.play

{Saw.ar(165)}.plot(0.1);

{Trig.ar(Saw.ar(165),1).poll}.play

{Trig.ar(Saw.ar(165),1)}.plot(30)

{SinOsc.ar((Trig.ar(Saw.ar(165),1)*165).poll)}.play

{ Trig.ar(Dust.ar(4), 0.2) }.plot(30)


{ PMOsc.ar(60, 20, Line.ar(0,20,8), 0.5) }.play;

(
e = Env.linen(2, 5, 2);
Routine.run({
    loop({
        play({
            LinPan2.ar(EnvGen.ar(e) *
                PMOsc.ar(2000.0.rand,800.0.rand, Line.kr(0.0, 12.0.rand,9),0,0.1), 1.0.rand2)});
        2.wait;
    })
}))

fork
