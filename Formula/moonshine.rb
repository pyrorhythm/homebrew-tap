class Moonshine < Formula
  desc "Missing declarative package manager aggregator for macOS"
  homepage "https://pyrorhythm.dev/moonshine"
  license "MIT"
  version "v0.3.0"
  version_schema 1
  
  on_arm do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.3.0/moonshine_0.3.0_macOS_arm64.tar.gz"
    sha256 "ff6a0c4d5fb317b6d303efd9a55c97ccb9bd85c99218410fde90efed52b62cf0"
  end

  on_intel do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.3.0/moonshine_0.3.0_macOS_x86_64.tar.gz"
    sha256 "56468b0b05179952cbd187dd8ec420cb2cdc58befce7a5c1d02e9f57ad71f46c"
  end

  def install
    bin.install "moonshine"
    bin.install_symlink bin/"moonshine" => "moon"

    generate_completions_from_executable(
      bin/"moonshine",
      "completion",
      shells: [:bash, :zsh, :fish]
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moonshine --version")
  end
end
