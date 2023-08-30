require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3443.0.0-darwin-x64.tar.gz"
    sha256 "2e0e802c4b3e0f2269ddb0e52290df7e6af344ce8d07e54b71e183114ebbd26c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3443.0.0-darwin-arm64.tar.gz"
      sha256 "210c27c565b9b5388887ae0f7280bd78c0da1b0124da710e6b24e9bf786f40fb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3443.0.0-linux-x64.tar.gz"
    sha256 "22abc1dc7e07457e47d2c94e3408b905dc2904e844809c0686cf6736fa1c07ce"
  end
  version "3443.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
