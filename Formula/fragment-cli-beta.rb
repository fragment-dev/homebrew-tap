require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5206.0.0-darwin-x64.tar.gz"
    sha256 "0b806516c569f51bbdde03c7ed36e4b05806d4b1d4a35d99d055ca6c2792384a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5206.0.0-darwin-arm64.tar.gz"
      sha256 "3894cfd047013085b7a504d31682ae9f74fc482377230782535a3bacfa7bd11a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5206.0.0-linux-x64.tar.gz"
    sha256 "cdf40d94a57c01f9295b613caf2205acfcfe300c0a94a934d3f798f1aa240e75"
  end
  version "5206.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
