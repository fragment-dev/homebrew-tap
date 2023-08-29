require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3418.0.0-darwin-x64.tar.gz"
    sha256 "b5e24ffca0ef155f3c4838087c994cedeede44e697994873ccb18b3c6f812f39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3418.0.0-darwin-arm64.tar.gz"
      sha256 "bbc39a41cc9cff7156b8e4a86680dd160d91a7ade1a54e999e7786e34f21be29"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3418.0.0-linux-x64.tar.gz"
    sha256 "10ce33515aea3b1e6320712b5d4c10a885932d48a3ed664a577b7e8e1eaa6c62"
  end
  version "3418.0.0"
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
