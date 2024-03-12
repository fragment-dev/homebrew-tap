require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4749.0.0-darwin-x64.tar.gz"
    sha256 "80c4112db970e523b5567f8cd556f3b2ebb44c0a0399bff2f4fc83ddc039aefa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4749.0.0-darwin-arm64.tar.gz"
      sha256 "6d841a0f7f6336786acce836effb15bed39cd73a05484436876be67332628923"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4749.0.0-linux-x64.tar.gz"
    sha256 "4c44ce77e56359b220fe308df5b90f5badae75d8766549c76c841ad12959dbac"
  end
  version "4749.0.0"
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
