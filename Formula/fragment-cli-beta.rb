require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2281.0.0-darwin-x64.tar.gz"
    sha256 "63f355851b477fdf6ccf4eaf8c8ffe2c4da9d578441678b2964efcd0b582ab34"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2281.0.0-darwin-arm64.tar.gz"
      sha256 "ba1fa4c6fcc4df7e92a08c6a0dc1176046c083ee543ff95a3752142368204a7b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2281.0.0-linux-x64.tar.gz"
    sha256 "c601e02f2e59485cb17be1428aa6915aa85c8c738e676ecc8e2f53a97430fb73"
  end
  version "2281.0.0"
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
