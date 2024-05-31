require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5166.0.0-darwin-x64.tar.gz"
    sha256 "f27955c4066877f75b936893266859f0e3681511c8d3d1e64b93106a1875061e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5166.0.0-darwin-arm64.tar.gz"
      sha256 "8d76e5f1ccd0a9b0d8ea7f2ae196e6924b56e2d8a98c538364e6266f8cc34499"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5166.0.0-linux-x64.tar.gz"
    sha256 "5516fc75059df2009233465d20fd4319ff0cd5d08f07b0e576bcd8e15f88e5ba"
  end
  version "5166.0.0"
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
