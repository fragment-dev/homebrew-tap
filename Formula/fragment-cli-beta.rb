require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5698.0.0-darwin-x64.tar.gz"
    sha256 "7df1516811aa3439299bbb6c689b63e98131b6cd9dd634baa1da2b814d47e456"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5698.0.0-darwin-arm64.tar.gz"
      sha256 "c805e48d30a8cf56f8ba37a46f7c31c3a3adcf5cf961c49606fe544001bbb4a6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5698.0.0-linux-x64.tar.gz"
    sha256 "3c98e40a9db267423fa7da50ed8f1153cff5998f1737d3251a166a0240518520"
  end
  version "5698.0.0"
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
