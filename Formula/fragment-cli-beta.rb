require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5202.0.0-darwin-x64.tar.gz"
    sha256 "51196d104c8aa4a13521c806e1c4b7ba8528c643626cd95f4ec1e58eeca94b1c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5202.0.0-darwin-arm64.tar.gz"
      sha256 "793a54e764f6a2bbd05f0716fb8d4cf917f20d30f1859bcebc736634ddd62aad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5202.0.0-linux-x64.tar.gz"
    sha256 "49d99fe2b7704d326f0931b2768b5479e90345da27f29d219cef6efeabe7045a"
  end
  version "5202.0.0"
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
