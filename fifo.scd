// a FIFO Synth

c = 0;
(
TempoClock.default.sched(1, {
	c = c + 1;
	{
		var env = Env([0, 1, 1, 0], [1, 298, 1],[5, 0, -5]),
		signal = Ringz.ar(Amplitude.ar(Dust.ar(0.4, rand(0.6,0.9))), rand(1000,2000), 4) * EnvGen.kr(env, doneAction: 2);
		Out.ar(0, FreeVerb.ar(Pan2.ar(signal, FSinOsc.kr(0.15)), 0.6, 0.9));
	}.play;
	c.postln;
	if (c < 30, {
		20;
	}, {
		nil;
	});
});
)

// a FIFO SynthDef

