require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2859.0.0-darwin-x64.tar.gz"
    sha256 "1aaea3bbb793710655acf559a4c5e9afcce21a0da9934ba4eeb0a1b201dafeea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2859.0.0-darwin-arm64.tar.gz"
      sha256 "823ad99f7e955a07f76dc55dba5d8f5e9d93f68515d618deb48f573043ca0e4a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2859.0.0-linux-x64.tar.gz"
    sha256 "87d068ed8b99d9b5c48a6ad34a55bae1c88990f22a2c58c7a40377e3d4a81df1"
  end
  version "2859.0.0"
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
