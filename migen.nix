{ buildPythonPackage, fetchFromGitHub, sphinx, sphinx-rtd-theme, colorama }:

buildPythonPackage rec {
  name = "migen";
  version = "0.1";
  src = fetchGit {
    url = "https://github.com/m-labs/migen";
    rev = "e43cd74e7389a0a491b7aeb1f6e56b42805a25ad";
  };
  propagatedBuildInputs = [ sphinx sphinx-rtd-theme colorama ];
}
