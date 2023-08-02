require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3217.0.0-darwin-x64.tar.gz"
    sha256 "7952bb2ce585802bdf04c3b72570e7c9a020c41c3b4c006202bbfee6bf9aed38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3217.0.0-darwin-arm64.tar.gz"
      sha256 "ec5c35727ea513e2885f181214bbb013be640c0a4fd77c6e74829858527c1829"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3217.0.0-linux-x64.tar.gz"
    sha256 "c9fbbbf57f63693084db0ccbecc779c96e6276921677b7173c9064961dbd8e57"
  end
  version "3217.0.0"
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
