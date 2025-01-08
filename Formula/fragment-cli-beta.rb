require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6044.0.0-darwin-x64.tar.gz"
    sha256 "1749bb9c3a3703058ef60b9908a9427fbb8b8096ed08261ca927a8bcc972e17d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6044.0.0-darwin-arm64.tar.gz"
      sha256 "08d34c7176047b484313af0591a703d52db6b0a46338d711d4503167b261d123"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6044.0.0-linux-x64.tar.gz"
    sha256 "29c984bd1b4ecd5ac9e65d030ec7dee0700feb45694ced48583d2775f5863fc5"
  end
  version "6044.0.0"
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
