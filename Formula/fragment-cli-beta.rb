require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4718.0.0-darwin-x64.tar.gz"
    sha256 "6b34c5014124201ccca54dc5d8d981859e43576922229894ef203015b545530a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4718.0.0-darwin-arm64.tar.gz"
      sha256 "89a45a73c1aaa8694a41f3b0737b22167a5dc9259436b0aef9f946d30d9fdbda"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4718.0.0-linux-x64.tar.gz"
    sha256 "b9aa74b3e8f8caa5434d7e4786a688a922bfbd2ab1f9ee564a35b68d2fb46880"
  end
  version "4718.0.0"
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
