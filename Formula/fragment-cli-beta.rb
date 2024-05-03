require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4997.0.0-darwin-x64.tar.gz"
    sha256 "063348aa33cac0495e7d965d39cdd583d2a8e8d67964f23d86190ca56d83f225"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4997.0.0-darwin-arm64.tar.gz"
      sha256 "e872549238c3dfbb756bfdfa75dee7c0897fd92e94e392b09c4f70918331bf08"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4997.0.0-linux-x64.tar.gz"
    sha256 "e29a032efdc222ea366d1710294043f8467ff4f5c4ce9e5e730b9e88412d3f56"
  end
  version "4997.0.0"
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
