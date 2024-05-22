require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5107.0.0-darwin-x64.tar.gz"
    sha256 "2e19dde4e98210178d935c5167be022a70a9c5f6fa95de42136c61ba6d67d724"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5107.0.0-darwin-arm64.tar.gz"
      sha256 "dec2806c9a90e31d860a5c6ad1279f3590f1586660134ee096e71850fe431964"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5107.0.0-linux-x64.tar.gz"
    sha256 "b466b39be64779c8e3cedf0ee6e7123068dea4fbf526ffae2edfdf1efed5816c"
  end
  version "5107.0.0"
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
