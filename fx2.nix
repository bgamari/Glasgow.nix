{ buildPythonPackage, fetchPypi, libusb1 }:

buildPythonPackage rec {
  pname = "fx2";
  version = "0.6";
  src = fetchPypi {
    inherit pname version;
    sha256 = "1n86zgld41yawas512dc141fh2fnb04y9h2acsfkj7ppzzcnq4n2";
  };
  buildInputs = [ ];
  propagatedBuildInputs = [ libusb1 ];
}

