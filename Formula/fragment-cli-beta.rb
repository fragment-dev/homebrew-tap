require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2221.0.0-darwin-x64.tar.gz"
    sha256 "5be5e9ea6428ddfa307fe2cce897ef23cd46c2980ad88709ac3a5713a97c8431"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2221.0.0-darwin-arm64.tar.gz"
      sha256 "6620f7663d128dad853593298b6bad4cd847ba22fafc8b2231529727c48992d1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2221.0.0-linux-x64.tar.gz"
    sha256 "7d2831d5c3df8ca5761fa92e955e141cacd886897be6f6b9ed4e5ea93129f2f7"
  end
  version "2221.0.0"
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
