require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3713.0.0-darwin-x64.tar.gz"
    sha256 "8513290ec5c0f75c0e1e376a1697a015ee8f095ce109ba0a5bf7f272b39b1efc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3713.0.0-darwin-arm64.tar.gz"
      sha256 "98d167320055e324614ac57e3e5b077373db76d25d2bfe85830d693d74fd1357"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3713.0.0-linux-x64.tar.gz"
    sha256 "5e1bf7712ab7b53ac48a72f277c4752029b57f90d2db787f3adbb7ef4e794e3e"
  end
  version "3713.0.0"
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
