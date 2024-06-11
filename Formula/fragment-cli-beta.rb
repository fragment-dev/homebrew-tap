require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5255.0.0-darwin-x64.tar.gz"
    sha256 "65cd798425c677039092eeaf7f138bce9e46b922480b5c0b59ebed78e39901cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5255.0.0-darwin-arm64.tar.gz"
      sha256 "bbea39e2872542df323606bcfb96404f595855a5e0ea298f1763771826b9ec77"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5255.0.0-linux-x64.tar.gz"
    sha256 "cdece8aabc1d54bcafb9b5a7af7a72af2fbc784b736e618c63279f6ae914e212"
  end
  version "5255.0.0"
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
