require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2965.0.0-darwin-x64.tar.gz"
    sha256 "24c6a41e6e83ebf565e23af98f3c0543486fb60a75451606b6c8824b69ae0b73"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2965.0.0-darwin-arm64.tar.gz"
      sha256 "0934b4ae5d9031cc234c515507571d020077118d33b25f59e32c096caa681966"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2965.0.0-linux-x64.tar.gz"
    sha256 "b928a44baee21606cef7e43663e7b5236fd1932eed03b49c214590620ea66637"
  end
  version "2965.0.0"
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
