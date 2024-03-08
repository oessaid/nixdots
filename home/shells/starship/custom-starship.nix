{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  installShellFiles,
  cmake,
  git,
  nixosTests,
}:
rustPlatform.buildRustPackage rec {
  pname = "starship";
  version = "1.18.0";

  src = fetchFromGitHub {
    owner = "starship";
    repo = pname;
    # rev = "v${version}";
    rev = "a1116a87535b32aa6d275fcce1cfa8695584cee4";
    hash = "sha256-HgQxl7vYRTUiKbbAY93wcljGjkQMEIFE5fz9wOdwg44=";
  };

  nativeBuildInputs = [installShellFiles cmake];

  postInstall = ''
    installShellCompletion --cmd starship \
      --bash <($out/bin/starship completions bash) \
      --fish <($out/bin/starship completions fish) \
      --zsh <($out/bin/starship completions zsh)

    presetdir=$out/share/starship/presets/
    mkdir -p $presetdir
    cp docs/public/presets/toml/*.toml $presetdir
  '';

  cargoHash = "sha256-FmSM8EqH0Dh8RPiVjs7IOTgSrH5ObPGRFtYM/pd5WdY=";

  nativeCheckInputs = [git];

  preCheck = ''
    HOME=$TMPDIR
  '';

  passthru.tests = {
    inherit (nixosTests) starship;
  };

  meta = with lib; {
    description = "A minimal, blazing fast, and extremely customizable prompt for any shell";
    homepage = "https://starship.rs";
    license = licenses.isc;
    maintainers = with maintainers; [danth davidtwco Br1ght0ne Frostman marsam];
    mainProgram = "starship";
  };
}
