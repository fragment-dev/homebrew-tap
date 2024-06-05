require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5214.0.0-darwin-x64.tar.gz"
    sha256 "505eeff15f42fef08d8d38fb0c77668a45530d44931f3e4388a28db1fec3ee65"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5214.0.0-darwin-arm64.tar.gz"
      sha256 "80e24987155b59554373be5c8f733256956bb48a1a7189b827977b71f86c84a7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5214.0.0-linux-x64.tar.gz"
    sha256 "cd55ce977be047fe5f50868dd59044a68068725a644b7b1ec61316c3202eb432"
  end
  version "5214.0.0"
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
