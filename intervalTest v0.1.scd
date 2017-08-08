// ------------------------------------------  Interval Test ------------------------------------------  >
// ------------------------------------------  Created 06/30/14  ----------------------------------  >
// ------------------------------------------  AirLoom Ltd.  ----------------------------------------  >

// Interval     Frequency Ratio     Examples
// Octave               2:1              512 Hz and 256 Hz

// Third                  5:4              320 Hz and 256 Hz

// Fourth                4:3              342 Hz and 256 Hz

// Fifth                  3:2               384 Hz and 256 Hz
// --------------------------------------------------------------------  >
(

SynthDef(\intervalTest, {
	arg fund = 256, int1 = 3, int2 = 2, int3 = 2, int4 = 1, mulF, mul1, mul2;
	var intOne = int1*(fund/int2),
	     intTwo = int3*(fund/int4),
	     sig1 = SinOsc.ar(fund, mul: mulF),
	     sig2 = SinOsc.ar(intOne, mul: mul1),
	     sig3 = SinOsc.ar(intTwo, mul: mul2);
	Out.ar(0,[sig1,sig2,sig3]!2);

}).add;

a = Synth(\intervalTest, [\mulF, 0.1, \mul1, 0.1, \mul2, 0.1]);
a.set(\fund,261.63);  // fundamental

a.set(\mulF, 0.1);  // vol fund
a.set(\mul1, 0.1);  // vol one
a.set(\mul2,0.1);  // vol two

a.free;

// --------------------------------------------------------------------  >

SynthDef(\TriadTest, {
	arg fund = 256,
	     int1 = 3, int2 = 2, int3 = 2, int4 = 1,
	     mulF, mul1, mul2;
	var
	     delta = MouseX.kr(fund, (fund*4), 1),
	     intervalOne = int1*(delta/int2),
	     intervalTwo = int3*(delta/int4),
	     sig1 = SinOsc.ar(delta, mul: mulF),
	     sig2 = SinOsc.ar(intervalOne, mul: mul1),
	     sig3 = SinOsc.ar(intervalTwo, mul: mul2);

	Out.ar(0,[sig1,sig2,sig3]!2);
}).add;


b = Synth(\TriadTest, [\mulF, 0.1, \mul1, 0.1, \mul2, 0.1]);

b.set(\fund,261.63);  // fundamental

b.set(\int1, 4);
b.set(\int2, 3);
b.set(\int3, 5);
b.set(\int4, 4);
b.set(\mulF, 0.1);  // vol fund
b.set(\mul1, 0.1);  // vol one
b.set(\mul2,0.1);  // vol two

b.free;


)

// ------------------------------------------  ---------------  ----------------------------------------  >
