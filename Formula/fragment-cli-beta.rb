require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3881.0.0-darwin-x64.tar.gz"
    sha256 "35b15393bcc3d3a8f12e51f324ce5dceb85f099eadf4421ece64814cca7cd72f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3881.0.0-darwin-arm64.tar.gz"
      sha256 "8eb81a65bc3a58e6a15c5c5da54f97aa2753f3d894c706e22baf6556da1959b3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3881.0.0-linux-x64.tar.gz"
    sha256 "443acb2a273ab11e8b4779326f82ef730ccdd9cf1c21c10bb50ff579e16de1cd"
  end
  version "3881.0.0"
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
