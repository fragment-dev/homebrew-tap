require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3907.0.0-darwin-x64.tar.gz"
    sha256 "018fb0b065127436f8d88c066473f8bcdff2ef6e8aabd9215d209c051f8f1f21"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3907.0.0-darwin-arm64.tar.gz"
      sha256 "4bae52f9fb004d19d3810935c4ac566bcff67ca891b07011d4595e9fc1fc5187"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3907.0.0-linux-x64.tar.gz"
    sha256 "2d9b65c14070c6b662bbd41ee2531059ecae9ace07e64ad9fa8bff807486e592"
  end
  version "3907.0.0"
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
