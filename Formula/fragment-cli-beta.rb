require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3898.0.0-darwin-x64.tar.gz"
    sha256 "0a7f718a605475928f06952aa449cf5d9cacebf5f428adfc102c629765400043"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3898.0.0-darwin-arm64.tar.gz"
      sha256 "e92550aa678bf217bf14863374dbf58adb6ff9a2741eea245205f8620da7c8cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3898.0.0-linux-x64.tar.gz"
    sha256 "03a8fe06da7a13877b6b0de462f8c0a280b92d34c93cb3f1f0fdedae5954498b"
  end
  version "3898.0.0"
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
