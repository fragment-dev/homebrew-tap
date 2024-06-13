require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5275.0.0-darwin-x64.tar.gz"
    sha256 "1c0883b1f9e1fd5be1b3bf43252121f58e6ebe45584d6d3fe3a279e5ef951bdd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5275.0.0-darwin-arm64.tar.gz"
      sha256 "d26e0d6916ba1d55bff51a82d8c3583adb5561bfb21e66ec431ef34012610942"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5275.0.0-linux-x64.tar.gz"
    sha256 "e180af40418d40a2f30cafe8bed26b30f01165bb504cd08f7181830d0b086df0"
  end
  version "5275.0.0"
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
