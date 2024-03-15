require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4772.0.0-darwin-x64.tar.gz"
    sha256 "e31cbdafdf71b1a4c66752890cac91c1ac59da175da268949b9815917e52a58f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4772.0.0-darwin-arm64.tar.gz"
      sha256 "0e057433a92fd7e8bfde1746d3004c8ec241960c90ed2159a6ac76d589746919"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4772.0.0-linux-x64.tar.gz"
    sha256 "4bf5c82e83417d984bd4035e90e3560c302eb36ebdc05fffe67d7daf8bf59941"
  end
  version "4772.0.0"
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
