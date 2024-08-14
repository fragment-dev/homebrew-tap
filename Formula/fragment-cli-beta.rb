require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5505.0.0-darwin-x64.tar.gz"
    sha256 "4d9ddba72ed85680e8b810fb5c63a921730d12f7535470a0c6de4e66f1da782b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5505.0.0-darwin-arm64.tar.gz"
      sha256 "b6d5886a552ad434c0b7c717ef626bc01b4c869a665f811e9e46bf54fb90740a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5505.0.0-linux-x64.tar.gz"
    sha256 "1e5819434e4fdc86497a89f04cd976893f3eee197b2b907f8537a02766375c00"
  end
  version "5505.0.0"
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
