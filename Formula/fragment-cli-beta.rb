require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5242.0.0-darwin-x64.tar.gz"
    sha256 "e50a6ea8cd5498b78768dbf8cfdb654a7031ec53aacca53d2149f89cb4287be2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5242.0.0-darwin-arm64.tar.gz"
      sha256 "096eff5725f4e6ad9d39760c67f0002405e8d9846e0847ece044bc79d4ebf7cb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5242.0.0-linux-x64.tar.gz"
    sha256 "0781da0cc9adfe32f425e11be575a4348419a867dea92fa8b64b68d60b23ef7e"
  end
  version "5242.0.0"
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
