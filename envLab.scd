// ------------------------------------------  EnvLab ------------------------------------------  >
// ------------------------------------------  Created 07/09/14  ---------------------------  >
// ------------------------------------------  AirLoom Ltd.  ----------------------------------  >

// http://sc3howto.blogspot.com/2010/05/envelopes.html
// http://danielnouri.org/docs/SuperColliderHelp/Control/Env.html

(

SynthDef(\envTest, {
	| freq = 440, gain = 0.1, dur = 1|
	var sig, env, env_gen;

	env = Env.triangle(dur, gain);
    env_gen = EnvGen.kr(env, doneAction: 2);
	sig = SinOsc.ar(freq, mul:env_gen);
	Out.ar(0, sig!2);

}).add;

x = Synth(\envTest);

x.set(\freq, 220, \dur, 2);
x.free;

)