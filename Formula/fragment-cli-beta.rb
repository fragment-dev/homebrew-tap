require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5847.0.0-darwin-x64.tar.gz"
    sha256 "be2bf3b1010908650a958bfaef616344d5edb55d91d005a89b5d593cf7c58c0a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5847.0.0-darwin-arm64.tar.gz"
      sha256 "abbbb4acc91adfe6761754412510d1382c8c785c093b3e12ffa4a7a66303e5d9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5847.0.0-linux-x64.tar.gz"
    sha256 "ca807e4cc441127142132c8dc633188f0146a6f4bb8ab58c9dcf009a4c46e9f1"
  end
  version "5847.0.0"
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
