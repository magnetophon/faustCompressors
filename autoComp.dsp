declare name "autoComp";
declare version "0.1.1";
declare author "Bart Brouns";
declare license "GPL-3.0-only";
declare copyright "2018 - 2023, Bart Brouns";



import("compressors.lib");

process = autoComp,autoComp;


autoComp(x) =
 (sig,GRlagged)~(((_<:_,_),(_<:_,_)):ro.interleave(2,2)):(_,!)
 // (sig,GR)~((_,(_<:_,_)))
  with {
  level =
    (abs(x):ba.linear2db);
  sig(prevX,prevGR) =
        x*(GRlagged(prevX,prevGR) :GRmeter:ba.db2linear);
  // GR(prevX,prevGR) = gain_computer(strength,threshold,knee,(abs(prevX):ba.linear2db));
  GR(prevX,prevGR)= gain_computer(1,threshold,knee,(abs(prevX):ba.linear2db));
  GRlagged(prevX,prevGR) = GR(prevX,prevGR):si.lag_ud(autoRel(prevX,prevGR),att);
  // avgDeltaGR(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( prevGR-GR(prevX,prevGR) ) ) *1024/avgNR   * pow((rel*16),4):si.smooth(0.999) :avgDeltaGRmeter :max(0);

  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( GR(prevX,prevGR)' - GR(prevX,prevGR) )  )   /avgNR :avgDeltaGRmeter  *autoRelAmount *32 :max(-0.75):min(1)  :si.smooth(ba.tau2pole(metaRel)) +(rel) :max(0.005)  :releaseMeter ;

  // autoRel(prevX,prevGR) = (slidingReduce(avgNR,maxN,+,0,( prevGR' - prevGR )  )   /avgNR) *128 :avgDeltaGRmeter  *autoRelAmount :max(-0.6):min(1)  +(rel) :max(0.005) :si.smooth(ba.tau2pole(metaRel))  :releaseMeter ;

  // autoRel(prevX,prevGR) = (slidingReduce(avgNR,maxN,+,0,(  GR(prevX,prevGR)' - GR(prevX,prevGR)  )  )   /avgNR) *128 :avgDeltaGRmeter  *autoRelAmount :max(-0.9):min(1)  +(rel) :max(0.005) :si.smooth(ba.tau2pole(metaRel))  :releaseMeter ;

  meanGR(prevX,prevGR) = (slidingReduce(avgNR,maxN,+,0,(  GR(prevX,prevGR)' - GR(prevX,prevGR)  )  )   /avgNR) *128 :avgDeltaGRmeter;

  // autoRel(prevX,prevGR) = meanGR(prevX,prevGR) *128 :avgDeltaGRmeter  *autoRelAmount :max(-9):min(9)  +(rel) :max(0.005) :si.smooth(ba.tau2pole(metaRel))  :releaseMeter ;

  autoRel(prevX,prevGR) = rel +( (slowGR(prevX,prevGR) - fastGR(prevX,prevGR) )  *autoRelAmount ) :max(0.004)  :releaseMeter ;

  // slowGR(prevX,prevGR)  =  GR(x,prevGR):si.lag_ud(metaRel,metaAtt)  *0.05 *-slowAmount :slowReleaseMeter;
  // fastGR(prevX,prevGR)  =  GR(GR(x,prevGR):si.lag_ud(metaRel,metaAtt) *-1 :pow(1+(ratio*10)) *-1 :ba.db2linear*x,prevGR):si.lag_ud(shortRel,0) *0.05  *-fastAmount :fastReleaseMeter;

  slowGR(prevX,prevGR)  =  GR(x,prevGR):si.lag_ud(metaRel,metaAtt) /prevGR  *1 *slowAmount :slowReleaseMeter;
  fastGR(prevX,prevGR)  =  GR(GR(x,prevGR):si.lag_ud(metaRel,metaAtt) *ratio*1000 :ba.db2linear *x *2,prevGR) +3 :min(0) :si.lag_ud(shortRel,0) *0.05  *-fastAmount :fastReleaseMeter;

  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( GR(prevX,prevGR)' - GR(prevX,prevGR) )  ) /(prevGR*2)  /avgNR   *128 :max(-0.2):min(1) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) :max(rel)  :avgDeltaGRmeter ;
  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( GR(prevX,prevGR)' - GR(prevX,prevGR) )  )   /avgNR   *128 :max(-1):min(3) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) :max(rel)  :avgDeltaGRmeter ;
  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( GR(prevX,prevGR)' - GR(prevX,prevGR) )  )   /avgNR   *128 :max(-0.4):min(2) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) :max(rel)  :avgDeltaGRmeter ;

  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( prevGR  - GR(prevX,prevGR) )  )   /(avgNR*abs(prevGR-GR(prevX,prevGR)))   *0.25 :avgDeltaGRmeter  :max(-0.4):min(1) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) +rel  :releaseMeter :max(0.004);

  // autoRel(prevX,prevGR) = ( slidingReduce(avgNR,maxN,+,0,( prevGR  - GR(x,prevGR):si.smooth(ba.tau2pole(metaRel)) )  ) /(avgNR*max(prevGR,1)*GRcompensate) :avgDeltaGRmeter      *1 :max(-1):min(2) *autoRelAmount ) +rel  :releaseMeter              :max(0);
  // autoRel(prevX,prevGR) = ( slidingReduce(avgNR,maxN,+,0,( prevGR'  - prevGR )  ) /(avgNR*(1:max(-prevGR :si.smooth(ba.tau2pole(metaRel)) *GRcompensate))) :avgDeltaGRmeter      *64 :max(-2):min(2) *autoRelAmount ) +rel  :si.smooth(ba.tau2pole(metaRel)) :releaseMeter              :max(0);
  // autoRel(prevX,prevGR) = ( slidingReduce(avgNR,maxN,+,0,( prevGR  - GR(x,prevGR) )  ) /(avgNR) :avgDeltaGRmeter      *0.1 :max(-1):min(2) *autoRelAmount :si.smooth(ba.tau2pole(metaRel))) +rel  :releaseMeter              :max(0);
  // autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( prevGR  - GR(x,prevGR) )  )   /(avgNR*prevGR)   *32 :max(-1):min(2) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) +rel  :avgDeltaGRmeter :max(0.004);
  // /(prevGR*GRcompensate)

  // autoRel(prevX,prevGR) =
  // ( slidingReduce(avgNR,maxN,+,0,( (GR(x,prevGR) :si.lag_ud(shortRel,0) )  - ( GR(x,prevGR) :si.lag_ud(longRel,metaAtt) )  )  ) /(avgNR*4) :avgDeltaGRmeter
  //    *0.1 :max(-1):min(3) *autoRelAmount :si.smooth(ba.tau2pole(metaRel)) ) +rel  :releaseMeter              :max(0.004);


// autoRel(prevX,prevGR) = slidingReduce(avgNR,maxN,+,0,( GR(prevX,prevGR) - prevGR ) )   /avgNR  *16 *autoRelAmount  :si.smooth(ba.tau2pole(metaRel)) :avgDeltaGRmeter :max(rel) ;

// autoRel(prevX,prevGR) = avgDeltaGR(prevX,prevGR) > avgDeltaGR(prevX,prevGR)'

  // GR(prevX,prevGR)= gain_computer(1,threshold,knee,(abs(prevX):ba.linear2db)):min(prevGR*rel);
  // autoSpeed(prevGR) = _<:
  //   select2( _ < prevGR,
  //     (slidingReduce((maxN)+1,maxN,+,0,_)/ ((maxN)+1))
  //     ,_);
  //   // select2((level>group(threshold)),(_+1),0): min(group(maxHoldTime));
  };
// gain_computer(strength,threshold,knee,x:abs:ba.linear2db);
// (gain(x))
//  ~ (_,_)
// with {
// gain(x,prevX,prevG) =
// (x*gain_computer(strength,threshold,knee,prevX:abs:ba.linear2db))
// ,
// (  gain_computer(strength,threshold,knee,prevX:abs:ba.linear2db)-prevG)
// ;
// // (x*gain_computer(strength,threshold,knee,prevX:abs:ba.linear2db))
// // ,
// //    gain_computer(strength,threshold,knee,prevX:abs:ba.linear2db);
// };



// slidingReduce(maxN,maxN,+,0,gain_computer(strength,threshold,knee,x:abs:ba.linear2db));
// slidingReduce(4:max(0):min(maxN),maxN,+,0,x);
// par(i, rmsMaxSize, )
maxN = pow(2,11);
// maxN = 8;
ratio             = (hslider("[01]ratio[tooltip: 0 is 1:1 and 1 is 1:inf]",1, 0,   1,   0.001));
att             = (hslider("[01]attack[tooltip: 0 is instant attack and 1 is no attack][scale:log]",1, 0.0001,   1,   0.001));
metaAtt             = (hslider("[01]metaAttack[tooltip: 0 is instant metaAttack and 1 is no metaAttack][scale:log]",1, 0.0001,   1,   0.001));
rel             = (hslider("[02]release[tooltip: 0 is instant release and 1 is no release][scale:log]",0.1, 0.0001,   1,   0.001));
shortRel             = (hslider("[03]short release[tooltip: 0 is instant release and 1 is no release][scale:log]",0.1, 0.0001,   1,   0.001));
longRel             = (hslider("[03]long release[tooltip: 0 is instant release and 1 is no release][scale:log]",0.1, 0.0001,   1,   0.001));
metaRel             = (hslider("[04]meta release[tooltip: 0 is instant release and 1 is no release][scale:log]",0.1, 0.0001,   1,   0.001));
autoRelAmount             = (hslider("[02]auto release[tooltip: 0 is instant release and 1 is no release]",0.1, 0,   1,   0.001));
slowAmount             = (hslider("[02]slow release[tooltip: 0 is instant release and 1 is no release]",0.1, 0,   1,   0.001));
fastAmount             = (hslider("[02]fast release[tooltip: 0 is instant release and 1 is no release]",0.1, 0,   1,   0.001));
GRmeter             = _<:(_, (min(0):max(maxGR):(hbargraph("[1][unit:dB][tooltip: gain reduction in dB]", maxGR, 0)))):attach;
releaseMeter             = _<:(_, (min(0.250):max(0):(hbargraph("[2][unit:ms]rel[tooltip: avgDeltaGRmeter]", 0, 0.250)))):attach;
slowReleaseMeter             = _<:(_, (min(0.250):max(0):(hbargraph("[2][unit:ms]slow rel[tooltip: avgDeltaGRmeter]", 0, 0.250)))):attach;
fastReleaseMeter             = _<:(_, (min(0.250):max(0):(hbargraph("[2][unit:ms]fast rel[tooltip: avgDeltaGRmeter]", 0, 0.250)))):attach;
avgDeltaGRmeter             = _<:(_, (min(20):max(-20):(hbargraph("[3][tooltip: avgDeltaGRmeter]", -1, 1)))):attach;
avgNR             = (hslider("[01]the number of GR deltas to average",maxN, 1,   maxN,   1));
GRcompensate             = (hslider("[01]GRcompensate",0, 0,   1,   0.001));
// op = my_compression_gain_mono(strength,threshold,attack,rel,knee,prePost);
