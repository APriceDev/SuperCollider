// *********************** tronics ***********************
(
SynthDef(\tronics, {
	arg dur = 2, cutoff = 440, pan = 0.6, freq = 220, offset = 1, mul = 1, mix = 0.5, room = 0.5, damp = 0.5;
	var verb1 = FreeVerb2.ar(Pulse.ar(freq - offset), Pulse.ar(freq + offset), mix, room, damp);
	var verb2 = FreeVerb2.ar(Pulse.ar(freq - offset), Pulse.ar(freq + offset), mix, room, damp);
	var signal = Balance2.ar(verb1, verb2, SinOsc.kr(dur) * pan, SinOsc.kr(0.025) * 0.9 + 0.5) * mul;
	//var signal = Balance2.ar(Pulse.ar(freq), Pulse.ar(freq), SinOsc.kr(dur) * pan, SinOsc.kr(0.025) * 0.9 + 0.5) * mul;
	signal = LPF.ar(signal, cutoff);
	Out.ar(0, signal);
}).add;
)

v = Synth(\tronics);
v.set(\mul, 0.7);
v.free;

w = Synth(\tronics);
w.set(\dur, 0.04, \cutoff, 1400, \pan, 0.25, \freq, 55, \mul, 0.5, \offset, 1);
w.free;

x = Synth(\tronics);
x.set(\dur, 0.05, \cutoff, 1880, \pan, 0.15, \freq, 110, \mul, 0.25, \offset, 3);
x.free;

y = Synth(\tronics);
y.set(\dur, 0.025, \cutoff, 440, \pan, 0.09, \freq, 220, \mul, 0.25, \offset, 5);
y.free;

z = Synth(\tronics);
z.set(\dur, 0.06, \cutoff, 3880, \pan, 0.2, \freq, 440, \mul, 0.15, \offset, 7);
z.free;
LFCub