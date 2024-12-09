require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5865.0.0-darwin-x64.tar.gz"
    sha256 "9431737cd62ebcfad8b49f3f5224811f57fd340c23866770ae00ef11a2db373a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5865.0.0-darwin-arm64.tar.gz"
      sha256 "6490dbe039d965d149d8e4db6f1abd38bd9896ff84a3435aba88e708d63912bd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5865.0.0-linux-x64.tar.gz"
    sha256 "9f4feda718a3b5340fc5750890ce25bb4df4739a1390002ee5a58a505daf8cb5"
  end
  version "5865.0.0"
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
