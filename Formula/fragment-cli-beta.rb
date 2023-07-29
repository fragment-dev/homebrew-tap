require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3191.0.0-darwin-x64.tar.gz"
    sha256 "11fb5a08c8c5e3dc80ca9cc03cba418457c96352f02be0f0d575fcb7437d76dc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3191.0.0-darwin-arm64.tar.gz"
      sha256 "6a91d2478e9d7957dd45361b34b34da3aef1ca1b61092010ddffe313339199e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3191.0.0-linux-x64.tar.gz"
    sha256 "2eaeb4549eb8dce92c383a412e977119f719eb5d531693337707106b5c31373c"
  end
  version "3191.0.0"
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
