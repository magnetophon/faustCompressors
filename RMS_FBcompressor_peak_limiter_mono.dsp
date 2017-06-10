declare author "Bart Brouns";
declare name "RMS_FBcompressor_peak_limiter_mono";
declare version "1.2";
declare license "GPLv3";

import("compressors.lib");

process =
RMS_FBcompressor_peak_limiter_N_chan(strength,threshold,thresholdLim,attack,release,knee,link,meter,1);
