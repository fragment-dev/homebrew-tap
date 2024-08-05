require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5473.0.0-darwin-x64.tar.gz"
    sha256 "5bd19db9203125fa024a7706fe0761e505f0b055d0414dba0dcc5f59a9da125d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5473.0.0-darwin-arm64.tar.gz"
      sha256 "ce9e4a3806c83a062cff94876b15fb5cfac4bfed1e5450b6c6fb85cde2c5679c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5473.0.0-linux-x64.tar.gz"
    sha256 "cd7c591370dd226437f313b668070cbd16c8f2966b41deee0fe57ffb9715df67"
  end
  version "5473.0.0"
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
