// sequence 01-04-02-03-02-04 end bass end perc

// ********************* 01 *********************

(
Pdef(\playBass,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/16], inf),
		//\dur, Pseq([1/18], inf),  // perc solo
		\stretch, 2.6666666666667, 	// 60/90 * 4;
		\buf, Pwrand([
			Prand(d[\bass]),
			Prand(d[\lead]),

			// ******
			Prand(d[\harm]),
			Prand(d[\perc]),
			Prand(d[\pluck])
			// ******

			//Prand(d[\silence]) // perc solo silence

			],

			// ******
			[0.30, 0.50, 0.04, 0.02, 0.02].normalizeSum,
			//[0.10, 0.30, 0.60].normalizeSum, // perc solo silence
			// ******

			//[0.25, 0.50, 0.8, 0.08, 0.8].normalizeSum, // perc solo
			inf),

		// ******
		\rate, 1,
		//\rate, Pexprand(0.8, 1.25, inf), // perc solo silence
		// ******
		//\amp, 0.35,
		\amp, Pseq([0.8, Pexprand(0.4, 0.6,7)], inf),
	);


).play(quant: 2.6666666666667);

Pdef(\playPerc,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/4], inf),
		\stretch, 2.6666666666667,
		//\buf, Prand(d[\perc]++ d[\pluck], inf),

		\buf, Pseq([
			Prand(d[\perc], 1),
			Prand(d[\perc]++ d[\pluck], 3),
		], inf),

		//\rate, 1,
		\rate, Pexprand(0.8, 1.25, inf),
		//\amp, 0.6,
		\amp, Pseq([0.7, Pexprand(0.4, 0.6, 4)], inf),
	);

).play(quant: 2.6666666666667);

Pdef(\playPerc).stop;
)

// ********************* 02 *********************

(
Pdef(\playBass,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/16], inf),
		//\dur, Pseq([1/18], inf),  // perc solo
		\stretch, 2.6666666666667, 	// 60/90 * 4;
		\buf, Pwrand([
			Prand(d[\bass]),
			Prand(d[\lead]),

			// ******
			//Prand(d[\harm]),
			//Prand(d[\perc]),
			//Prand(d[\pluck])
			// ******

			Prand(d[\silence]) // perc solo silence

			],

			// ******
			//[0.30, 0.50, 0.04, 0.02, 0.02].normalizeSum,
			[0.10, 0.30, 0.60].normalizeSum, // perc solo silence
			// ******

			//[0.25, 0.50, 0.8, 0.08, 0.8].normalizeSum, // perc solo
			inf),

		// ******
		\rate, 1,
		//\rate, Pexprand(0.8, 1.25, inf), // perc solo silence
		// ******
		//\amp, 0.35,
		\amp, Pseq([0.8, Pexprand(0.4, 0.6,7)], inf),
	);


).play(quant: 2.6666666666667);

Pdef(\playPerc,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/8], inf),
		\stretch, 2.6666666666667,
		//\buf, Prand(d[\perc]++ d[\pluck], inf),

		\buf, Pseq([
			Prand(d[\perc], 1),
			Prand(d[\perc]++ d[\pluck], 3),
		], inf),

		//\rate, 1,
		\rate, Pexprand(0.8, 1.25, inf),
		//\amp, 0.6,
		\amp, Pseq([0.7, Pexprand(0.4, 0.6, 4)], inf),
	);

).play(quant: 2.6666666666667);
)
// ********************* 03 *********************

(
Pdef(\playBass,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/16], inf),
		//\dur, Pseq([1/18], inf),  // perc solo
		\stretch, 2.6666666666667, 	// 60/90 * 4;
		\buf, Pwrand([
			Prand(d[\bass]),
			Prand(d[\lead]),

			// ******
			//Prand(d[\harm]),
			//Prand(d[\perc]),
			//Prand(d[\pluck])
			// ******

			Prand(d[\silence]) // perc solo silence

			],

			// ******
			//[0.30, 0.50, 0.04, 0.02, 0.02].normalizeSum,
			[0.10, 0.30, 0.60].normalizeSum, // perc solo silence
			// ******

			//[0.25, 0.50, 0.8, 0.08, 0.8].normalizeSum, // perc solo
			inf),

		// ******
		//\rate, 1,
		\rate, Pexprand(0.8, 1.25, inf), // perc solo silence
		// ******
		//\amp, 0.35,
		\amp, Pseq([0.8, Pexprand(0.4, 0.6,7)], inf),
	);


).play(quant: 2.6666666666667);

Pdef(\playPerc,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/8], inf),
		\stretch, 2.6666666666667,
		//\buf, Prand(d[\perc]++ d[\pluck], inf),

		\buf, Pseq([
			Prand(d[\perc], 1),
			Prand(d[\perc]++ d[\pluck], 3),
		], inf),

		//\rate, 1,
		\rate, Pexprand(0.8, 1.25, inf),
		//\amp, 0.6,
		\amp, Pseq([0.7, Pexprand(0.4, 0.6, 4)], inf),
	);

).play(quant: 2.6666666666667);
)

// ********************* 04 *********************

(
Pdef(\playBass,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/16], inf),
		//\dur, Pseq([1/18], inf),  // perc solo
		\stretch, 2.6666666666667, 	// 60/90 * 4;
		\buf, Pwrand([
			Prand(d[\bass]),
			Prand(d[\lead]),

			// ******
			Prand(d[\harm]),
			Prand(d[\perc]),
			Prand(d[\pluck])
			// ******

			//Prand(d[\silence]) // perc solo silence

			],

			// ******
			[0.30, 0.50, 0.04, 0.02, 0.02].normalizeSum,
			//[0.10, 0.30, 0.60].normalizeSum, // perc solo silence
			// ******

			//[0.25, 0.50, 0.8, 0.08, 0.8].normalizeSum, // perc solo
			inf),

		// ******
		\rate, 1,
		//\rate, Pexprand(0.8, 1.25, inf), // perc solo silence
		// ******
		//\amp, 0.35,
		\amp, Pseq([0.8, Pexprand(0.4, 0.6,7)], inf),
	);


).play(quant: 2.6666666666667);

Pdef(\playPerc,
	Pbind(
		\instrument, \playWav,
		\dur, Pseq([1/8], inf),
		\stretch, 2.6666666666667,
		//\buf, Prand(d[\perc]++ d[\pluck], inf),

		\buf, Pseq([
			Prand(d[\perc], 1),
			Prand(d[\perc]++ d[\pluck], 3),
		], inf),

		//\rate, 1,
		\rate, Pexprand(0.8, 1.25, inf),
		//\amp, 0.6,
		\amp, Pseq([0.7, Pexprand(0.4, 0.6, 4)], inf),
	);

).play(quant: 2.6666666666667);
)