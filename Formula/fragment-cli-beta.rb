require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3910.0.0-darwin-x64.tar.gz"
    sha256 "61b3815c05d3173c212586e347a89cd83b08b1f49be2aff7a2f5855cc7ca0ca2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3910.0.0-darwin-arm64.tar.gz"
      sha256 "105d6024a0d4b17bfcc753adcce00d4a00c39a74119876b40255715c2b321e07"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3910.0.0-linux-x64.tar.gz"
    sha256 "ccf457d2e31f553190288082b01d805942d6410c0f1ea1c5b54fd9c836c4f5f2"
  end
  version "3910.0.0"
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
