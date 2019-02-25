{ buildPythonPackage, fetchFromGitHub, sphinx, sphinx-rtd-theme, colorama }:

buildPythonPackage rec {
  name = "migen";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "m-labs";
    repo = "migen";
    rev = "ae421054f1e3621621bcc397df171caf3681763c";
    sha256 = "1ljj5wq5lgc1qgfxgbknshb5mwlqw6wd6va06z4gcdgbn028v7y4";
  };
  propagatedBuildInputs = [ sphinx sphinx-rtd-theme colorama ];
}
