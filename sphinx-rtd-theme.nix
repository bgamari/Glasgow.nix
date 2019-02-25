{ buildPythonPackage, fetchPypi, sphinx, pytest }:

buildPythonPackage rec {
  pname = "sphinx_rtd_theme";
  version = "0.4.3";
  src = fetchPypi {
    inherit pname version;
    sha256 = "02h42j24rybmxb2mdyc23fr2if5g6v91z6f7dirnsib09pihg1kj";
  };
  buildInputs = [ sphinx pytest ];
  propagatedBuildInputs = [ ];
}
