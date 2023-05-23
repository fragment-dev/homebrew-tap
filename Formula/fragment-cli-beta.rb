require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2728.0.0-darwin-x64.tar.gz"
    sha256 "32990acfe3f4d90500442f23b16170b4aee22b94579246beaefaacabed0c3d66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2728.0.0-darwin-arm64.tar.gz"
      sha256 "7bc64bf467c0e5dbc328b0d288cb8b3fe9d01ccc0c8309685b4e341f4ea512de"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2728.0.0-linux-x64.tar.gz"
    sha256 "5a7fb0aafc5989d405103336939b51bf8e1dd85e4d29db977fae90be29bc8f8a"
  end
  version "2728.0.0"
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
