require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5439.0.0-darwin-x64.tar.gz"
    sha256 "c3a7c3012f524a4b084b51411bfc167f63ee7aa15897acbe977cf876476f4d52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5439.0.0-darwin-arm64.tar.gz"
      sha256 "246c250ff822c684370c769f7363132a08c8d9fa2172f8ca94141f24b9811dc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5439.0.0-linux-x64.tar.gz"
    sha256 "74f3eef053d03363af64d204446c17d76083322e293f17abb82f318fd6f55121"
  end
  version "5439.0.0"
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
