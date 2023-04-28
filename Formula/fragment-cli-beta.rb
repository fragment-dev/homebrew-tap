require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2548.0.0-darwin-x64.tar.gz"
    sha256 "7fc6ee6f77490221839eb1fce0dfeb7fb53038ee7582f1337b955b84d1728fbc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2548.0.0-darwin-arm64.tar.gz"
      sha256 "b7ba33cc2093a6019b755535af8746048bb75754d5513e8a04eddf8a3b5e23bb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2548.0.0-linux-x64.tar.gz"
    sha256 "a0827cea83214836310b74ad91262c8d9911e4ebb0218286a2512415bb0b03b4"
  end
  version "2548.0.0"
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
