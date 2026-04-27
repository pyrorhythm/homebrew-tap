class Moonshine < Formula
  desc "Missing declarative package manager aggregator for macOS"
  homepage "https://pyrorhythm.dev/moonshine"
  license "MIT"

  on_arm do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.2.0/moonshine_0.2.0_macOS_arm64.tar.gz"
    sha256 "95ca0fd353b54442bd66d19fb87851a5415c7daeb31250bb31290be3bdee48f0"
  end

  on_intel do
    url "https://github.com/pyrorhythm/moonshine/releases/download/v0.2.0/moonshine_0.2.0_macOS_x86_64.tar.gz"
    sha256 "739585ff048fe71d3ac02b914edaec0f1679afdee7d924ad0fe600194d6ce504"
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
    assert_match version.to_s, shell_output("#{bin}/moonshine version")
  end
end
