{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "switchbot-api";
  version = "2.7.0";
  pyproject = true;

  disabled = pythonOlder "3.10";

  src = fetchFromGitHub {
    owner = "SeraphicCorp";
    repo = "py-switchbot-api";
    tag = "v${version}";
    hash = "sha256-uGaM/pzO9HuLJjXdhdrCfbTxMvYxF4OgFo/m5R2jm5s=";
  };

  build-system = [ poetry-core ];

  dependencies = [ aiohttp ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [ "switchbot_api" ];

  meta = with lib; {
    description = "Asynchronous library to use Switchbot API";
    homepage = "https://github.com/SeraphicCorp/py-switchbot-api";
    changelog = "https://github.com/SeraphicCorp/py-switchbot-api/releases/tag/${src.tag}";
    license = licenses.mit;
    maintainers = with maintainers; [ fab ];
  };
}
