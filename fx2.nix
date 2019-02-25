{ buildPythonPackage, fetchPypi, sdcc, crcmod, libusb1 }:

buildPythonPackage rec {
  pname = "fx2";
  version = "0.6";
  src = Glasgow/vendor/libfx2;
  nativeBuildInputs = [ sdcc ];
  propagatedBuildInputs = [ libusb1 crcmod ];
  preConfigure = "cd software";
}

