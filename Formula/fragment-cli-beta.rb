require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4562.0.0-darwin-x64.tar.gz"
    sha256 "afe271a2e052e37f096a2b2da8eeffdbae7995964ce425997ec4bc4551ba69f1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4562.0.0-darwin-arm64.tar.gz"
      sha256 "c4c60eeb585bfa5cc08a2bfa0101c4dea9731af4b27e143974fe82041505fc95"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4562.0.0-linux-x64.tar.gz"
    sha256 "b058d700fadc1f41c109981c63176671f3909fa2514c9bf4e8a813d478034ee2"
  end
  version "4562.0.0"
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
