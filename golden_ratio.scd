
{30.do({{SinOsc.ar(Rand([404.5,809]), 0 ,0.05)}.play; 1.0.wait;})}.fork;
{30.do({{SinOsc.ar(Rand([809,1618]), 0 ,0.05)}.play; 1.0.wait;})}.fork;

{30.do({{SinOsc.ar(Rand([404.5,1618]), 0 ,0.05)}.play; 1.0.wait;})}.fork;