{
  pkgs ? import <nixpkgs> { },
  app,
}:

let
  scripts = {
    "vivado" = "$XILINX_HOME/Vivado/bin/vivado";
    "vitis" = "$XILINX_HOME/Vitis/bin/vitis";
  };

  fhs = pkgs.buildFHSEnv {
    name = "fhs-env";

    targetPkgs =
      pkgs: with pkgs; [
        glibc
        glib
        stdenv.cc.cc.lib

        bash
        coreutils
        zlib

        ncurses
        ncurses5
        openssl

        libGL
        libGLU
        mesa
        libgbm
        cairo
        pango
        atk
        gobject-introspection
        gtk3
        gdk-pixbuf

        nss
        nspr
        dbus
        cups
        libdrm

        libx11
        libxext
        libxrender
        libxtst
        libxi
        libxrandr
        libxcursor
        libxcomposite
        libxdamage
        libxfixes

        freetype
        fontconfig

        expat
        libxcb
        libxkbcommon
        alsa-lib

        at-spi2-atk
        libsecret
        libxshmfence
        libuuid
        udev

        libusb1
        libftdi1
      ];

    profile = ''
      export LD_LIBRARY_PATH=/lib:/usr/lib:$LD_LIBRARY_PATH
      export ELECTRON_OZONE_PLATFORM_HINT=x11
    '';

    runScript = scripts.${app} or "vivado";
  };
in
fhs.env
