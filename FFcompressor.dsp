declare name "FFcompressor";
declare version "1.2.1";
declare author "Bart Brouns";
declare license "GPL-3.0-only";
declare copyright "2018 - 2023, Bart Brouns";

import("compressors.lib");

process =
FFcompressor_N_chan(strength,threshold,attack,release,knee,prePost,link,meter,2);
