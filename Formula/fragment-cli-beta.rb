require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5336.0.0-darwin-x64.tar.gz"
    sha256 "4219cde40c46e141af99b8e900d66ad1e096eff4bc52e87fbc0691f5b756f246"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5336.0.0-darwin-arm64.tar.gz"
      sha256 "684b60d7c9e7ab231656e74f4f4fc5cc426063909ff58adca8229845af61a505"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5336.0.0-linux-x64.tar.gz"
    sha256 "78f18dc6c99f3e50d28315d812fd625757384365649fbb9b92f77ec36234d690"
  end
  version "5336.0.0"
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
