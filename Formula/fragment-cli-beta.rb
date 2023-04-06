require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2366.0.0-darwin-x64.tar.gz"
    sha256 "0c5c125b9a5c8625cfaab957a7389b1a07c9964d919c7e1da769e5a34b7c4b4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2366.0.0-darwin-arm64.tar.gz"
      sha256 "b5ab0892ca944b26f9946dbb7724d1aab2dd20ffd56fc4c7c51878f4f3abd6cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2366.0.0-linux-x64.tar.gz"
    sha256 "d07c0ddaef7f7e0bb59e8c1f381363f37c19c1557b4d2ec4c506a2469689a14c"
  end
  version "2366.0.0"
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
