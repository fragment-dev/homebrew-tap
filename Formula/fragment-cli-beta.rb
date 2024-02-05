require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4493.0.0-darwin-x64.tar.gz"
    sha256 "f0b101e7c1adc81b6e95763d10b64fdb085f24868960f5ff90109d1e0ef770cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4493.0.0-darwin-arm64.tar.gz"
      sha256 "4848ae749c3a5d13a9cd767d3d7efa302941e8c47e751d838fd00b5494b527b5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4493.0.0-linux-x64.tar.gz"
    sha256 "612a08526f05f4ee582679b813bdf0852c72860637598148452f57aeb27f09f7"
  end
  version "4493.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
