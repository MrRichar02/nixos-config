{
  lib,
  config,
  ...
}: {
  options.myModules.zswap.enable = lib.mkEnableOption "Enables zswap";

  config = lib.mkIf config.myModules.zswap.enable {
    boot.initrd.systemd.enable = true;

    boot.kernelParams = [
      "zswap.enabled=1" # enables zswap
      "zswap.compressor=lz4" # compression algorithm
      "zswap.max_pool_percent=100" # maximum percentage of RAM that zswap is allowed to use
      "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
    ];
  };
}
