{ lib, python, buildPythonPackage, pdm-backend,
  src,
  amaranth, pyvcd, bitarray, crcmod, fx2, colorama, sdcc, versioneer, aiohttp,
  yosys, arachne-pnr, nextpnr, icestorm,
  platformdirs, packaging
}:

buildPythonPackage {
  pname = "glasgow";
  version = "0.1";
  inherit src;
  build-system = [ pdm-backend ];
  propagatedBuildInputs = [
    amaranth pyvcd bitarray crcmod fx2 colorama versioneer
    yosys arachne-pnr nextpnr icestorm aiohttp
    platformdirs packaging
  ];
  doCheck = false;
  sourceRoot = "source/software";
  format = "pyproject";
}
