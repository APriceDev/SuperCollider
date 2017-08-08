(
SynthDef(\envTest, {
	arg sigL, sigR;
	var env, gen, signal;
	env = Env.linen(0.5,2.0, 0.5, 0.5);
	gen = EnvGen.kr(env, doneAction: 2);
	signal = SinOsc.ar([sigL, sigR],0, gen, 0);
	Out.ar(0, signal);
}).add;
)

~envTest = Synth(\envTest, [\sigL, rrand(110, 220), \sigR, rrand(220, 330 )]);

~envTest.free;

{Blip.ar([61, 59], XLine.kr(2, 400, 6, doneAction: 2), 0.5, 0)}.play

{Blip.ar([rrand(20,60), rrand(20,60)], XLine.kr(2, 1400, 16, doneAction: 0), EnvGen.kr(Env.linen(0.25,12.0, 3.75, 0.75), doneAction: 2), 0)}.play

(
SynthDef(\blipTest, {
	arg leftChannel, rightChannel, time, ceiling = 1400, level = 0.75, mix, room, damp;
	var source, env, gen;

	env = Env.linen(time*0.1,time*0.7, time*0.2, level);
	gen = EnvGen.kr(env, doneAction: 2);
	source = Blip.ar([leftChannel, rightChannel], XLine.kr(2, ceiling, time, doneAction: 0), gen, 0);

	Out.ar(0, FreeVerb.ar(source, mix, room, damp));
	//Out.ar(0, source);
}).add;
)

(
~blip = Synth(\blipTest, [
	\leftChannel, rrand(20,60),
	\rightChannel, rrand(10,80),
	\ceiling, 2400,
	\time, 20,
	\mix, 0.45,
	\room, 0.8,
	\damp, 0.25
]);
)

(
	Pdef( \blipBind,
		(Pbind(\instrument, \blipTest,
			\leftChannel, Pexprand([20, 10], [160, 180], 60),
			\rightChannel, Pexprand([10, 20], [180, 160], 60),
			\ceiling, 10000,
			\time, 4,
			\mix, 0.45,
			\room, 0.8,
			\damp, 0.25,
			\dur, 1.0
			).play
		)
	)
)

(
  s.recSampleFormat = 'int16';
  s.recHeaderFormat = 'wav'
)

s.makeWindow;
s.record;
s.stopRecording;

~blipBind.stop
~blipBind.play
~blipBind.reset
