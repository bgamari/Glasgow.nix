{ lib, python, buildPythonPackage,
  migen, pyvcd, bitarray, crcmod, fx2, colorama, sdcc, versioneer, aiohttp,
  yosys, arachne-pnr, nextpnr, icestorm
}:

buildPythonPackage {
  pname = "glasgow";
  version = "0.1";
  src = ./Glasgow;
  propagatedBuildInputs = [
    migen pyvcd bitarray crcmod fx2 colorama versioneer
    yosys arachne-pnr nextpnr icestorm aiohttp
  ];
  buildInputs = [ sdcc ];
  doCheck = false;
  preConfigure = ''
    make -Cvendor/libfx2/firmware
    cd software
  '';
  preBuild = ''
    ${python.interpreter} setup.py build_ext -i
  '';
}
