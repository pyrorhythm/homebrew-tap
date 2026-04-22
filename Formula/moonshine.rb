class Moonshine < Formula
  desc "Missing declarative package manager aggregator for macOS"
  homepage "https://pyrorhythm.dev/moonshine"
  license "MIT"

  on_arm do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.1.2/moonshine_0.1.2_macOS_arm64.tar.gz"
    sha256 "226f85fb01ac3bb7f846ec65ddb3bcf630ee5a16c634cdc62e673cb0cb0b1e82"
  end

  on_intel do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.1.2/moonshine_0.1.2_macOS_x86_64.tar.gz"
    sha256 "d5d4f6a1ab98c52fce90a3a8e593616ce9c78722a667120719bd5f467190dd04"
  end

  def install
    bin.install "moonshine"
    bin.install_symlink bin/"moonshine" => "moon"

    generate_completions_from_executable(
      bin/"moonshine",
      "completion",
      shells: [:bash, :zsh, :fish, :pwsh]
    )
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/moonshine --version")
  end
end
