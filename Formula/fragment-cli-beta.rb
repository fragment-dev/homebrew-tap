require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5456.0.0-darwin-x64.tar.gz"
    sha256 "285c404256564b76d80b7820278c4c1092355f0694b354632b8524b412dda422"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5456.0.0-darwin-arm64.tar.gz"
      sha256 "5a95809002c677acb1b4fa534dde2148cfeab2858a5551d2d67e504fedf32689"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5456.0.0-linux-x64.tar.gz"
    sha256 "47d7c407274b06082377cb3cf7a487180e503ed6f4c4aeefcf2e99137a0be5bd"
  end
  version "5456.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
