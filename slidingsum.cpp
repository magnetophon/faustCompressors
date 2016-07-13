//-----------------------------------------------------
//
// Code generated with Faust 0.9.73 (http://faust.grame.fr)
//-----------------------------------------------------
/* link with  */
#ifndef FAUSTFLOAT
#define FAUSTFLOAT float
#endif  


#ifndef FAUSTCLASS 
#define FAUSTCLASS mydsp
#endif

class mydsp : public dsp {
  private:
	float 	fVec0[2];
	float 	fVec1[3];
	float 	fVec2[7];
	float 	fVec3[15];
	FAUSTFLOAT 	fslider0;
  public:
	static void metadata(Meta* m) 	{ 
		m->declare("slidingReduce.lib/name", "Sliding Reduce Library");
		m->declare("slidingReduce.lib/author", "Bart Brouns (bart@magnetophon.nl)");
		m->declare("slidingReduce.lib/copyright", "Bart Brouns");
		m->declare("slidingReduce.lib/version", "0.1");
		m->declare("slidingReduce.lib/license", "LGPL");
		m->declare("math.lib/name", "Math Library");
		m->declare("math.lib/author", "GRAME");
		m->declare("math.lib/copyright", "GRAME");
		m->declare("math.lib/version", "1.0");
		m->declare("math.lib/license", "LGPL with exception");
	}

	virtual int getNumInputs() 	{ return 1; }
	virtual int getNumOutputs() 	{ return 1; }
	static void classInit(int samplingFreq) {
	}
	virtual void instanceInit(int samplingFreq) {
		fSamplingFreq = samplingFreq;
		for (int i=0; i<2; i++) fVec0[i] = 0;
		for (int i=0; i<3; i++) fVec1[i] = 0;
		for (int i=0; i<7; i++) fVec2[i] = 0;
		for (int i=0; i<15; i++) fVec3[i] = 0;
		fslider0 = 8.0f;
	}
	virtual void init(int samplingFreq) {
		classInit(samplingFreq);
		instanceInit(samplingFreq);
	}
	virtual void buildUserInterface(UI* interface) {
		interface->openVerticalBox("0x00");
		interface->addVerticalSlider("sum number", &fslider0, 8.0f, 1.0f, 8.0f, 1.0f);
		interface->closeBox();
	}
	virtual void compute (int count, FAUSTFLOAT** input, FAUSTFLOAT** output) {
		float 	fSlow0 = float(fslider0);
		int 	iSlow1 = (int(floorf((0.25f * fSlow0))) % 2);
		int 	iSlow2 = (int(floorf((0.5f * fSlow0))) % 2);
		int 	iSlow3 = (int(floorf(fSlow0)) % 2);
		int 	iSlow4 = (iSlow3 + (2 * iSlow2));
		int 	iSlow5 = int((iSlow4 + (4 * iSlow1)));
		int 	iSlow6 = int((int(floorf((0.125f * fSlow0))) % 2));
		int 	iSlow7 = (fSlow0 == 0);
		int 	iSlow8 = int((0 & iSlow7));
		int 	iSlow9 = int(iSlow4);
		int 	iSlow10 = int(iSlow1);
		int 	iSlow11 = int(iSlow3);
		int 	iSlow12 = int(iSlow2);
		int 	iSlow13 = int((1 & iSlow7));
		FAUSTFLOAT* input0 = input[0];
		FAUSTFLOAT* output0 = output[0];
		for (int i=0; i<count; i++) {
			float fTemp0 = (float)input0[i];
			fVec0[0] = fTemp0;
			float fTemp1 = (fVec0[0] + fVec0[1]);
			fVec1[0] = fTemp1;
			float fTemp2 = (fVec1[0] + fVec1[2]);
			fVec2[0] = fTemp2;
			fVec3[0] = (fVec2[0] + fVec2[4]);
			float fTemp3 = fVec3[iSlow5];
			float fTemp4 = fVec2[iSlow9];
			float fTemp5 = fVec1[iSlow11];
			output0[i] = (FAUSTFLOAT)(((((iSlow13)?fVec0[0]:((iSlow11)?fVec0[0]:0)) + ((iSlow8)?fTemp5:((iSlow12)?fTemp5:0))) + ((iSlow8)?fTemp4:((iSlow10)?fTemp4:0))) + ((iSlow8)?fTemp3:((iSlow6)?fTemp3:0)));
			// post processing
			for (int i=14; i>0; i--) fVec3[i] = fVec3[i-1];
			for (int i=6; i>0; i--) fVec2[i] = fVec2[i-1];
			fVec1[2] = fVec1[1]; fVec1[1] = fVec1[0];
			fVec0[1] = fVec0[0];
		}
	}
};


