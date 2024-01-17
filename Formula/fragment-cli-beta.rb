require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4355.0.0-darwin-x64.tar.gz"
    sha256 "86ca8ed557caadb3e057a0447404ce70471c935dddb1f37b211549b43896b286"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4355.0.0-darwin-arm64.tar.gz"
      sha256 "c3439cc55753350f9f484df74c7165a13a8adcf9719f9dd59cea4ba897717ba4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4355.0.0-linux-x64.tar.gz"
    sha256 "f9602972a9defac60ddfa371c6b5b9e53e786f35db32d6b9f8cbfa272cc697f6"
  end
  version "4355.0.0"
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
