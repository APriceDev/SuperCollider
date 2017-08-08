// ------------------------------------------  Indus 3 ------------------------------------------  >
// ------------------------------------------  Created 07/02/14  ---------------------------  >
// ------------------------------------------  AirLoom Ltd.  ----------------------------------  >

(

SynthDef(\Indus3, {

	arg fund = 261.63;
	var delta = MouseX.kr(fund, (fund*2), 1, 1.5),
	     bass = (0.25*(delta/1)),
	     sigF = SinOsc.ar(delta),
	     sigB = SinOsc.ar(SinOsc.kr( freq:1.25, add:bass));
	Out.ar(0,[sigF,sigB]!2);
}).add;

a = Synth(\Indus3);

z = s.scope;

a.free;
z.window.close;

)

// ------------------------------------------  ---------------------  -------------------------------  >

// for 07/04/14 EnvGen and Env
// http://sc3howto.blogspot.com/2010/05/envelopes.html
// http://doc.sccode.org/Tutorials/Getting-Started/16-Sequencing-with-Patterns.html

(
SynthDef(\smooth, { |freq = 440, sustain = 1, amp = 0.5|
    var sig;
    sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.linen(0.05, sustain, 0.1), doneAction: 2);
    Out.ar(0, sig ! 2)
}).add;
)

(
p = Pbind(
        // the name of the SynthDef to use for each note
    \instrument, \smooth,
        // MIDI note numbers -- converted automatically to Hz
    \midinote, Pseq([60, 72, 71, 67, 69, 71, 72, 60, 69, 67], 1),
        // rhythmic values
    \dur, Pseq([2, 2, 1, 0.5, 0.5, 1, 1, 2, 2, 3], 1)
).play;
)












