require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5793.0.0-darwin-x64.tar.gz"
    sha256 "ae8826384293607c733f9894844130f2da8e294422511e78f05f03d0ad7f3a05"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5793.0.0-darwin-arm64.tar.gz"
      sha256 "15a9674ceced076800851303d0c4520ed3cadb73dee43d432525462845afd32e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5793.0.0-linux-x64.tar.gz"
    sha256 "66f2b6c1ae8c0f643cfa670ed2e6b4885621a66df2e25b9ff31f5532933ed7e1"
  end
  version "5793.0.0"
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
