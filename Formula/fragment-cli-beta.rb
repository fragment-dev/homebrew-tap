require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5618.0.0-darwin-x64.tar.gz"
    sha256 "6f809877bcc3af9ee866c6732fcf14c1ee05be3806938f306385fdf577cba965"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5618.0.0-darwin-arm64.tar.gz"
      sha256 "eca9eea13ed0836093e958970499e213fea29922f6444a430734ca831c81e017"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5618.0.0-linux-x64.tar.gz"
    sha256 "0eb379fca4025a8dcf3b3224c59c7a731db1fa46882357b03fcf5fca7d61d842"
  end
  version "5618.0.0"
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
