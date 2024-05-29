require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5139.0.0-darwin-x64.tar.gz"
    sha256 "a5532170a768eb48e96e10cc1e31588ac0a2e128cdbb46c47b12e155ed1e7b26"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5139.0.0-darwin-arm64.tar.gz"
      sha256 "5d9be413c47a32bf22656f8f1d52d6c5c466b6ff9f1f69a566cdb61b78893855"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5139.0.0-linux-x64.tar.gz"
    sha256 "8e5ff80dbd1946a0c6b1bd501009df54a8cc6acaf58c62fdddedee987b66460e"
  end
  version "5139.0.0"
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
