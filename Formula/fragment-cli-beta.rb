require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5352.0.0-darwin-x64.tar.gz"
    sha256 "f6f4ee20f9c72f3354a8d36cf2171c79b8259fe2a440a476416ccc8e94075497"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5352.0.0-darwin-arm64.tar.gz"
      sha256 "ac76614eeff5ca8c76e7442030fa3825df49401af0368c4f2820ab89ed111fbf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5352.0.0-linux-x64.tar.gz"
    sha256 "73251417efc497b7479b8bba8e27821740fb584145c8f533b4bc080dfbb7db41"
  end
  version "5352.0.0"
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
