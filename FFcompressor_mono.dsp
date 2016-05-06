declare author "Bart Brouns";
declare name "FFcompressor_mono";
declare version "0.1.1";
declare license "GPLv3";

import("compressors.lib");

process =
FFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,meter,1);