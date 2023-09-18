require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3600.0.0-darwin-x64.tar.gz"
    sha256 "70f7b4de999a2c7bc55af840362d70e5c3c7a96c658391cbf00cce5a18dd109c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3600.0.0-darwin-arm64.tar.gz"
      sha256 "93ebea209b672dce38f15fa32149dc01f72a518344f8b9bdca432e14ee6e12bc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3600.0.0-linux-x64.tar.gz"
    sha256 "c9d4a119d4de322bfff28b551067d489a5d9560991cda436213373ccc9bd6b22"
  end
  version "3600.0.0"
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
