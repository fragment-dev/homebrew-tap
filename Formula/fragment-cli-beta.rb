require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6120.0.0-darwin-x64.tar.gz"
    sha256 "4fddaa852335969b3acffa522ee88a9d236aabfc43829963054d07e063b47b0f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6120.0.0-darwin-arm64.tar.gz"
      sha256 "e0f5ba5ce73b3c6857fc901cfcb2930209b08371d56e34957870fcb90cecc5a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6120.0.0-linux-x64.tar.gz"
    sha256 "a314278a179b05808e702f36c0b6234ec08857fa197821d8ac1e20f3b8ae5a78"
  end
  version "6120.0.0"
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
