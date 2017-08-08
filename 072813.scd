(
	SynthDef(\Test, {
	arg freq = 440,
	ch = 0;
	var out = SinOsc.ar(freq, mul:0.1);

	Out.ar(ch,out);

}).add
)

a = Synth(\Test);
b = Synth(\Test, ['ch', 1, 'freq',110]);
c = Synth(\Test, ['ch', 0, 'freq',130]);
d = Synth(\Test, ['ch', 1, 'freq',220]);

a.free;b.free;c.free;d.free;

(
SynthDef(\help_isRand, {

	arg ch = 0;
    Out.ar(ch,
		SinOsc.ar(Rand(400, 800), 0, 0.2) * Line.kr(1, 0, 1, doneAction: 2)
    )
}).add;
)

e = Synth(\help_isRand);
f = Synth(\help_isRand, ['ch', 1]); // a different randomly selected freq
