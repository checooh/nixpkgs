{ lib
, buildPythonPackage
, fetchFromGitHub
, pytestCheckHook
, yara
}:

buildPythonPackage rec {
  pname = "yara-python";
  version = "4.2.0";

  src = fetchFromGitHub {
    owner = "VirusTotal";
    repo = "yara-python";
    rev = "v${version}";
    sha256 = "sha256-jNxYuIddMzANZoQ0p7BbRrX6ISpaCA7T6j+iS+FOocg=";
  };

  buildInputs = [
    yara
  ];

  checkInputs = [
    pytestCheckHook
  ];

  setupPyBuildFlags = [
    "--dynamic-linking"
  ];

  pytestFlagsArray = [ "tests.py" ];

  pythonImportsCheck = [ "yara" ];

  meta = with lib; {
    description = "Python interface for YARA";
    homepage = "https://github.com/VirusTotal/yara-python";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ fab ];
  };
}
