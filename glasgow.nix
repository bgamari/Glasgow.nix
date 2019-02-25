{ lib, python, buildPythonPackage, migen, pyvcd, bitarray, crcmod, fx2, colorama, sdcc, versioneer }:

buildPythonPackage {
  pname = "glasgow";
  version = "0.1";
  src = ../.;
  propagatedBuildInputs = [ migen pyvcd bitarray crcmod fx2 colorama versioneer ];
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
