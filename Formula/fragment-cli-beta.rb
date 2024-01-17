require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4346.0.0-darwin-x64.tar.gz"
    sha256 "353d604f3cb1098674943f7ddb415bca43dbe71eab282431ad10345a66c90873"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4346.0.0-darwin-arm64.tar.gz"
      sha256 "29a4393da19f54358df607923f1fc5562f58f42e5dde480694d32d602d02e048"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4346.0.0-linux-x64.tar.gz"
    sha256 "e2a77d5f24d40212601472f88184554fbcf28289151f29c1a17fc83a15ae0649"
  end
  version "4346.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
