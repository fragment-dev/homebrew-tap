require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5366.0.0-darwin-x64.tar.gz"
    sha256 "d5f3637e24a5fa44e4c0b314dd807de6a428087a8ed298e0102006b4f18183c8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5366.0.0-darwin-arm64.tar.gz"
      sha256 "1a6de53b265a0530096c6e4abca2838f7a46e4437ad1096ba0be0465948f0d8f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5366.0.0-linux-x64.tar.gz"
    sha256 "5beaaa43915b34681a8edf593742761f2976b22221f685a2f2d62639cf95d781"
  end
  version "5366.0.0"
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
