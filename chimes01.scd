(
SynthDef(\chime, {

	arg tone = 261.63, releaseTime = 1.5 , amp = 0.5;
	var env, gen, signal;
	env = Env.linen(0.01,0.1, releaseTime, amp);
	gen = EnvGen.kr(env, doneAction: 2);
	//signal = Ringz.ar(Impulse.ar(tone), tone, releaseTime);
	signal = SinOsc.ar(tone ,0, gen, 0);
	Out.ar(0, signal);
}).add;
)

a = Synth(\chime);
a.free;

(
	Pdef( \chimes,
		(Pbind(\instrument, \chime,
		   \tone, Prand([261.63, (9*261.63/8), 4*(261.63/3), 3*(261.63/2), 5*(261.63/3), 261.63*2], inf),
		  \releaseTime, Pexprand(1.5, 2.5, inf),
		   \amp, Pexprand(0.2, 0.5, inf),
		   \dur, Pexprand(0.5,1.8, inf)
		).play
		)
	)
)

// ***********************************************
{ Ringz.ar(Dust.ar(3, 0.3), 2000, 2) }.scope(1, zoom:4);

{ Ringz.ar(WhiteNoise.ar(0.005), 2000, 0.5) }.scope(1);

// modulate frequency
{ Ringz.ar(WhiteNoise.ar(0.005), XLine.kr(100,3000,10), 0.5) }.scope(1, zoom:4);

{ Ringz.ar(Impulse.ar(6, 0, 0.3),  XLine.kr(100,3000,10), 0.5) }.scope(1, zoom:4);

// modulate ring time
{ Ringz.ar(Impulse.ar(6, 0, 0.3), 2000, XLine.kr(0.04, 4, 8)) }.scope(1, zoom:4);

// ***********************************************

// "http://doc.sccode.org/Tutorials/Getting-Started/14-Scheduling-Events.html
TempoClock.default.sched(1, { rrand(1, 3).postln; });
TempoClock.default.sched(1, {{SinOsc.ar(rand(100,200));}.play;  rrand(1, 3).postln;});



{ Ringz.ar(Dust.ar(0.4, rand(0.2,0.3)), rand(1000,2000), 4) }.play;

var env = Env([0, 1, 1, 0], [10, 480, 30],[5, 0, -5]);


{
	var env = Env([0, 1, 1, 0], [1, 298, 1],[5, 0, -5]);
	Ringz.ar(Dust.ar(0.4, rand(0.2,0.3)), rand(1000,2000), 4) * EnvGen.kr(env, doneAction: 2);
}.play;

c = 0;
TempoClock.default.sched(1, {
	c = c + 1;
	{
		var env = Env([0, 1, 1, 0], [1, 298, 1],[5, 0, -5]);
		//Ringz.ar(Dust.ar(0.4, rand(0.1,0.2)), rand(1000,2000), 4) * EnvGen.kr(env, doneAction: 2);
		Ringz.ar(Amplitude.ar(Dust.ar(0.4, rand(0.6,0.9))), rand(1000,2000), 4) * EnvGen.kr(env, doneAction: 2);
	}.play;
	c.postln;
	if (c < 30, {
		20;
	}, {
		nil;
	});
});

(
SynthDef(\chimes2, {
	arg mul = 0.3, freq = 2000;
	var signal;

	signal = Ringz.ar(Dust.ar(0.4, mul), freq, 4);
	Out.ar(0, signal);
}).add
)

b = Synth(\chimes2);
b.set(\mul, rand(0.2, 0.3));
b.set(\freq, rand(1000, 2000));
b.free;

(
Pdef(\chimesTwo,
	(Pbind(\Instrument, \chimes2,
		\mul, Pexprand(0.2, 0.3, inf),
		\freq, Pexprand(1000,2000, inf),
		\dur, 2
		).play;
	)
)
)
