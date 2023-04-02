require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2335.0.0-darwin-x64.tar.gz"
    sha256 "d464468504c8265e2dae3119f6c8dc8e72440a7cc8f3f9d3ab91b7f9aac8eb24"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2335.0.0-darwin-arm64.tar.gz"
      sha256 "f489fe824b73fa94eba289954217bcba7910d18f8b8b44716069c09f6b9ed738"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2335.0.0-linux-x64.tar.gz"
    sha256 "56c4cf20a13666192b72ae4d0fec28ab8b3916a305602dc57f2aff66dfd81c05"
  end
  version "2335.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
