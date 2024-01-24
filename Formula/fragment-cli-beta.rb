require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4422.0.0-darwin-x64.tar.gz"
    sha256 "13928d02c1fec09d59c00b4296123a6d820a40847e02866dcdb4075fc5182e74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4422.0.0-darwin-arm64.tar.gz"
      sha256 "ee1f5a762b83128b4e9e12e52cda0a182b2d470c96cb702c721f03e647e38ba5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4422.0.0-linux-x64.tar.gz"
    sha256 "f7d5f533d35104a6303f95bb1603e74b1a59661a754a9ddaed90693b077f22e3"
  end
  version "4422.0.0"
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
