require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2708.0.0-darwin-x64.tar.gz"
    sha256 "c72b6b56e99e28c3340cc1d92fda9c3662fd53616f913169f8a93fcfb9c28a1e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2708.0.0-darwin-arm64.tar.gz"
      sha256 "2d618b923319cd9890923b48d66f9134686a8c6714499238046e2c6519ece568"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2708.0.0-linux-x64.tar.gz"
    sha256 "a574532ce65f0c2f26b1d1c87b572f0f452cc9657876705834603a79bcbadf5a"
  end
  version "2708.0.0"
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
