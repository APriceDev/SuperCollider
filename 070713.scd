x = {[SinOsc.ar(rand(440),0,0.25,0),SinOsc.ar(rand(220),0,0.25,0)]}.play;

y = {[SinOsc.ar(exprand(119.9,120.1),0,0.25,0),SinOsc.ar(exprand(119.9,120.1),0.5,0.25,0)]}.play;

y.free;

1000.0.rand;
rand(1000.0,round( 0.01))

5+(10*4)

exprand(1,1000.0)

x = {exprand(1,1000.0)};

x;

{LFNoise0.ar}.play;
{LFNoise0.ar(10000)}.plot;
{LFNoise0.ar(10000)}.scope;
{100.rand}.dup(10);
{100.rand} !10;
{100.rand}.dup(10).postln.plot;
{100.rand}.dup(10).sort.plot;

{Blip.ar(25, LFNoise0.kr([5,5], 12, 14), 0.3)}.play; // use this
(
s.recSampleFormat = 'int16';
s.recHeaderFormat = 'wav'
)

s.record();

{Blip.ar(25, LFNoise0.kr(5, 12, 14), 0.3)}.play;
{Blip.ar(25, LFNoise0.kr([5,10], 12, 14), 0.3)}.play;
{Blip.ar(25, LFNoise0.kr([5,10,2,25], 12, 14), 0.3)}.play;

{PMOsc.ar(440, MouseY.kr(1,550), MouseX.kr(1,15))}.scope;

{[SinOsc.ar(MouseX.kr(220,440)),SinOsc.ar(MouseY.kr(440,220))]}.scope;
{[SinOsc.ar(Line.kr(220,440,10)),SinOsc.ar(Line.kr(440,220,10))]}.scope;

{PMOsc.ar(
	Line.kr([220,270],[440,660],10),
	Line.kr(1,[550,550],12),
	Line.kr(1,[15,25],15)
)}.scope;


{Blip.ar(MouseX.kr(220,550), MouseY.kr(1,10), 0.5)}.play;

x = {PinkNoise.ar *0.5}.play


