declare name "RMS_FBcompressor_peak_limiter";
declare version "1.2.1";
declare author "Bart Brouns";
declare license "GPL-3.0-only";
declare copyright "2018 - 2023, Bart Brouns";

import("compressors.lib");

process =
RMS_FBcompressor_peak_limiter_N_chan(strength,threshold,thresholdLim,attack,release,knee,link,meter,2);
