require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4854.0.0-darwin-x64.tar.gz"
    sha256 "060618ff265ecf49a727e59de4ffa1d8322fe191797829451c8119fad54f13fe"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4854.0.0-darwin-arm64.tar.gz"
      sha256 "180cf73ead1a5d39fd174d5785cf2acfaac3373a492f10cd0538094d381c7ed4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4854.0.0-linux-x64.tar.gz"
    sha256 "e3653796336639fe7189e2c26f0cd940f2f63c704c409f42651c69c20080378b"
  end
  version "4854.0.0"
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
