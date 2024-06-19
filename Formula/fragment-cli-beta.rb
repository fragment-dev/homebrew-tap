require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5297.0.0-darwin-x64.tar.gz"
    sha256 "763a2634e927c48073fcdde6b631fbd02fcaf647fe2e4f22401d7accdb7220c9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5297.0.0-darwin-arm64.tar.gz"
      sha256 "53e9c9b8d7bfceb93e73f113c883d69b0f96eab315bd214527931338c56c3c32"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5297.0.0-linux-x64.tar.gz"
    sha256 "973c7d80c60aebf31d0b7db91740d1baadf38cf42fcffd7b91ec7425b879c3a3"
  end
  version "5297.0.0"
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
