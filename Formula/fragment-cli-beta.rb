require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4985.0.0-darwin-x64.tar.gz"
    sha256 "f42cb8341c20943c8ec8b6292600bb2f6730a73241e95a2c368f4f9a13d1d895"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4985.0.0-darwin-arm64.tar.gz"
      sha256 "b54ce9e0fd3cb01834eb2774f82e20ccae099cdc31f430c174b61869963b8c54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4985.0.0-linux-x64.tar.gz"
    sha256 "b325619b0c1f0e10f1e0fb3127ad9b2a943e507c65b3fdc6993a2ce7ed70e317"
  end
  version "4985.0.0"
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
