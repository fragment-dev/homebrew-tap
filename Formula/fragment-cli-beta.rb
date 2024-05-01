require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4979.0.0-darwin-x64.tar.gz"
    sha256 "b38910b35fda463be6756c093c5fec24467de228b4e23d2de98fb987c2ec9617"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4979.0.0-darwin-arm64.tar.gz"
      sha256 "873c39d489a7b85ce924e8c2bbf116a96d068e33076dc5ae4f70f026db0e92c3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4979.0.0-linux-x64.tar.gz"
    sha256 "d911d16fdc14f299ecc3fa72119385a8934176b0c8a2bdc7b04dbef85ac97a83"
  end
  version "4979.0.0"
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
