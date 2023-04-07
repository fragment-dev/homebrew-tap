require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2380.0.0-darwin-x64.tar.gz"
    sha256 "0365b54482f892d10312a615e5c554264f08d78e3f26d8e390648e341c2cc91b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2380.0.0-darwin-arm64.tar.gz"
      sha256 "ba077c2c5a826f3b18a11c3eb22a8385c189bdea0336f1c888035e24265b42b1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2380.0.0-linux-x64.tar.gz"
    sha256 "c9594ef37ceec95e6f31a9863104cc17adcad3c15a03d632743e25fc88aed423"
  end
  version "2380.0.0"
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
