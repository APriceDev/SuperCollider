// ------------------------------------------  SwoopOne Synth  ------------------------------------------  >
// ------------------------------------------  Created 06/11/14  ------------------------------------------  >
// ------------------------------------------  AirLoom Ltd.  ------------------------------------------------  >

(
SynthDef(\SwoopOne, {
	|freq1 = 119, freq2 = 121,               // signal freq
	cyc1 = 0.24, cyc2 = 0.26,             // cycle freq
	mix = 0.5, room = 0.5, damp = 0|  // Freeverb(2)
	// roomsize = 10, revtime = 3, damping = 0.5, inputbw = 0.5, spread = 15, drylevel = 1, earlylevel = 0.7,taillevel = 0.5,mrs = 300| // GVerb

	var auto1 = SinOsc.kr( freq:cyc1, add:freq1, mul:19 ),
	     auto2 = SinOsc.kr( freq:cyc2, add:freq2, mul:21 ),
	     sig1 = LFTri.ar(MouseX.kr(auto1, 990, 1), mul: 0.25),
	     sig2 = LFTri.ar(MouseY.kr(auto2, 1010, 1), mul: 0.25);

	//Out.ar(0, FreeVerb.ar([sig1, sig2], mix, room, damp,0.5,0));
	Out.ar(0, FreeVerb2.ar(sig1, sig2, mix, room, damp,0.5,0));

	//GVerb
	//Out.ar(0, GVerb.ar([sig1, sig2], roomsize, revtime, damping, inputbw, spread, drylevel, earlylevel, taillevel, mrs, 0.5,0));
}).add;

a = Synth(\SwoopOne);

a.set(\freq1, 29, \freq2, 31);

a.set(\cyc1, 0.1);
a.set(\cyc2, 0.2);
a.set(\mix, 0.35);
a.set(\room, 0.9);
a.set(\damp, 0);

//GVerb
//a.set(\roomsize, 9, \revtime, 1.5, \damping, 0.1, \inputbw, 0.75, \spread, 50, \drylevel, 0.45, \earlylevel, 0.5, \taillevel,0.85, \mrs,50);

a.free;
)

// ------------------------------------------  ---------------  ---------------------------------------------------  >