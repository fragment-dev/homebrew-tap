require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2345.0.0-darwin-x64.tar.gz"
    sha256 "1504c03e47d5c981caff92d64e08edd0b189aa707a785b7856c04f893861a70d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2345.0.0-darwin-arm64.tar.gz"
      sha256 "74ddabdec90abe1ce79b8ffcfc63ba3fe4538b14ce332e0b0bf7b129294953c6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2345.0.0-linux-x64.tar.gz"
    sha256 "d3580c0ef7414633b057380ea651dac556b334dca94f97774f4c218173a42333"
  end
  version "2345.0.0"
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
