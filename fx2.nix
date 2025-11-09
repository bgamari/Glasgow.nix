{ buildPythonPackage, setuptools, setuptools-scm, src, sdcc, crcmod, libusb1 }:

buildPythonPackage rec {
  pname = "fx2";
  version = "0.13";
  inherit src;
  nativeBuildInputs = [ sdcc ];
  propagatedBuildInputs = [ libusb1 crcmod ];
  sourceRoot = "source/software";
  format = "pyproject";
  build-system = [ setuptools setuptools-scm ];
  # Relax setuptools constraint
  patchPhase = ''
    substituteInPlace pyproject.toml --replace 'setuptools~=67.0' 'setuptools>=67.0'
  '';
}

