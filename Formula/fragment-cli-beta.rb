require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6532.0.0-darwin-x64.tar.gz"
    sha256 "408e230f2c2fb9db5ffc92f18185556b9aec9fc0812f70322a1a07385793e2e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6532.0.0-darwin-arm64.tar.gz"
      sha256 "2fd28a37d6a3e706cd15fd54a2f8c8232854e8fd523300f5803cf28ed9c217e1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6532.0.0-linux-x64.tar.gz"
    sha256 "28021a92c740afd323dc25aacbf136b9e381d162348857a3984ad70ad67aff97"
  end
  version "6532.0.0"
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
