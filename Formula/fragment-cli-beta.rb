require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6087.0.0-darwin-x64.tar.gz"
    sha256 "bff21a090ae758401a710fdb7fc530549b02f7de6bd4251f5b7c42c18fd5f09e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6087.0.0-darwin-arm64.tar.gz"
      sha256 "82469f67a7fd3a6e897b4526d91311d7b16a2e1d4486603828bd326e42327d0f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6087.0.0-linux-x64.tar.gz"
    sha256 "082748840ee669bc0818dd0184c763846138399bc4c25038621b5ba95a4251f4"
  end
  version "6087.0.0"
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
