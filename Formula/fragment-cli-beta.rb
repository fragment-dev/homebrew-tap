require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4818.0.0-darwin-x64.tar.gz"
    sha256 "0b875ad31e1502e9fb48922248e4de2f1b6d2f18cfe63212f6249512b74d60a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4818.0.0-darwin-arm64.tar.gz"
      sha256 "9c6849a16dd257912ab81288a416753a25a518d505f0fbca79ae1c837ddd4754"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4818.0.0-linux-x64.tar.gz"
    sha256 "02144d0914f61925225415a4622e752a273c97a09303b12496f7cb29e4c2f317"
  end
  version "4818.0.0"
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
