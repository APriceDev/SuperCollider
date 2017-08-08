(



SynthDef(\Swoop, {
	arg freq1 = 119, freq2 = 121,               // signal freq
	cyc1 = 0.24, cyc2 = 0.26,       // cycle freq
	out = 0;
	//mix = 0.5, room = 0.5, damp = 0;  // reverb

	var auto1 = SinOsc.kr( freq:cyc1, add:freq1, mul:19 ),
	     auto2 = SinOsc.kr( freq:cyc2, add:freq2, mul:21 ),
	     sig1 = LFTri.ar(MouseX.kr(auto1, 990, 1), mul: 0.25),
	     sig2 = LFTri.ar(MouseY.kr(auto2, 1010, 1), mul: 0.25);

	Out.ar(out, [sig1, sig2]);
}).add;

SynthDef(\Verb, {
	arg mix = 0.5, room = 0.5, damp = 0, input = 0;
	var sig = In.ar(input,2);
	sig = FreeVerb2.ar(sig[0], sig[1], mix, room, damp,0.5,0);
	Out.ar(0, sig);
	}).add;



a = Synth(\Swoop, [\out,b]);
f = Synth.after(a,\Verb,[\input,b]);
f.set(\room, 0.35);
f.set(\mix, 0.3);
b = Bus.audio(s,numChannels:2);

a.free;
)