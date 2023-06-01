require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2780.0.0-darwin-x64.tar.gz"
    sha256 "41f5b5cc07fbcb809fb6a6831297ebdf870b0a77f9789088f598729b2607e58d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2780.0.0-darwin-arm64.tar.gz"
      sha256 "a5cc4332d35e33609a710d25dab33076263114dfc3cb47a7559d70fe7d68db5d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2780.0.0-linux-x64.tar.gz"
    sha256 "c9bfb2878df5ca4ffb831e0a88631c2a3b46471a10503eee16b4e2353d7185de"
  end
  version "2780.0.0"
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
