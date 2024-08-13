require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5503.0.0-darwin-x64.tar.gz"
    sha256 "6b00560c64f79eb3be052d14250e83524b4d32de15936ff6136b833ba9d52d66"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5503.0.0-darwin-arm64.tar.gz"
      sha256 "c4e309753428c77f4fea356a14123902c931bc5aeeb8a41d6224a552bd9db5e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5503.0.0-linux-x64.tar.gz"
    sha256 "85253c5b3111057c5e9f2ca2df37068fe4028b31328071896881ce4efb8b8c32"
  end
  version "5503.0.0"
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
