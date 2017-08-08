//http://sccode.org/1-4Zx

(
play{x = 165;
	b = SinOsc;
	p = Trig.ar(Saw.ar(x),1);
	y = b.ar(p*x);
	z = b.ar(p);
	(GVerb.ar(GrainIn.ar(2,y,y/2,z,p*z,-1),9))/9;
}//basso gettato
)

