require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.9.0-darwin-x64.tar.gz"
    sha256 "b0734957c161e82850f912f078c4fc843286828f4913c0094c785804f5395a97"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.9.0-darwin-arm64.tar.gz"
      sha256 "4df3463f603a7cbcae9a3df109d3a50d00db1df89add60769a3776b8eaccbe88"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3955.9.0-linux-x64.tar.gz"
    sha256 "4fd757c204dfb01bfa6d5c0f5b2a7397f64117f398ed0b558a8d8c2ed2ba82f8"
  end
  version "3955.9.0"
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
