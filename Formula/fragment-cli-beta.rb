require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2428.0.0-darwin-x64.tar.gz"
    sha256 "da43d507cf09d594af94b18c3e3ba08969a5a6e24963ba4cfd5879c88bc737f0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2428.0.0-darwin-arm64.tar.gz"
      sha256 "6963798b04f274d6140fb553f4d1cf0d78d54e1abfc2ddf34ea313ac7a236f27"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2428.0.0-linux-x64.tar.gz"
    sha256 "683ffa182f96b25d3e807d152ab2d5f0b2ca81219fbc4a5058b3da416c2ae6a3"
  end
  version "2428.0.0"
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
