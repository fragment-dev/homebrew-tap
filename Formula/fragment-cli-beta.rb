require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3824.0.0-darwin-x64.tar.gz"
    sha256 "96b04c07049a5f0d91abf1b5e4869612ba26b0a790923b4c8759c1847fafd799"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3824.0.0-darwin-arm64.tar.gz"
      sha256 "651fa2853b0c0d8c1960c8005a811d2b6a538c8671248de8c6510b6be0cbce65"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3824.0.0-linux-x64.tar.gz"
    sha256 "65259e539e76e461430c078c6849947dcd0169588f7fb0f85519f210864fb2e9"
  end
  version "3824.0.0"
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
