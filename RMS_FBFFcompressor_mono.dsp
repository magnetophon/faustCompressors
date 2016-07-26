declare author "Bart Brouns";
declare name "RMS_FBFFcompressor_mono";
declare version "1.0";
declare license "GPLv3";

import("compressors.lib");

process =
RMS_FBFFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,FBFF,meter,1);
