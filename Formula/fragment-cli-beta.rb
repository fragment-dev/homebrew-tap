require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-x64.tar.gz"
    sha256 "e1c31418790be490bf8e003f08ceb3551737ee145d0320d683191f1f1d5fcd7b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-darwin-arm64.tar.gz"
      sha256 "1e92f85495785a5d86cf4f63bbcb8f52ff20b217504b936001d396614f1f6290"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v1.0.0-linux-x64.tar.gz"
    sha256 "758c87d2267be81ca5c833be32ee30dd5b787126fef2ff444acf0093d457d347"
  end
  version "1.0.0"
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
