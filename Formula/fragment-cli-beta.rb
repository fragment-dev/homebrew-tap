require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3888.0.0-darwin-x64.tar.gz"
    sha256 "27f1b5ccbd42d0a48e15e1e1d59cdc179b96391d6eddc75978d6325a27a3f7be"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3888.0.0-darwin-arm64.tar.gz"
      sha256 "043ac151d995f7e712071fb2c54359db755a9da93755c33caca4898d0cbb2230"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3888.0.0-linux-x64.tar.gz"
    sha256 "3158d22b94af27cfd24cbc5359eb4ba313ac8ed7393af6e166a9f9dfc4c52a4b"
  end
  version "3888.0.0"
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
