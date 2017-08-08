// ------------------------------------------  test tone  ---------------------------------------------------  >
{SinOsc.ar()!2}.play;

{Balance2.ar(SinOsc.ar(330), SinOsc.ar(440), MouseX.kr(-1,1), 0.5)}.play;

// ------------------------------------------  OSC trace  ---------------------------------------------------  >
OSCdef.trace(false);

// ------------------------------------------  frequency analyzer  ---------------------------------------------------  >
FreqScope.new(400,200,0);

// ------------------------------------------  read samples into buffer  ---------------------------------------------------  >
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");
b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01-44_1.aiff");

b.play

// ------------------------------------------  live input  ---------------------------------------------------  >
(
SynthDef(\Live, {
	var mic = SoundIn.ar(0);
	Out.ar(0,mic);
}).add;
)
b = Synth(\Live);
b.free;

{FreeVerb.ar(SoundIn.ar(0).distort)}.play

// ------------------------------------------  record session  ---------------------------------------------------  >
(
  s.recSampleFormat = 'int16';
  s.recHeaderFormat = 'wav'
)

// s.makeWindow;
s.record;
s.stopRecording;

