require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3166.0.0-darwin-x64.tar.gz"
    sha256 "c6bb38e1370851e123653b7b789ae8b9333b4f34e4d55a2fbc4c570521871eda"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3166.0.0-darwin-arm64.tar.gz"
      sha256 "6343606a9234cf01909dc445d8120b2e3178e1cce29e5c8b9fb51d12619be88e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3166.0.0-linux-x64.tar.gz"
    sha256 "a8709978edb04adafd0cc2b7819fc84b95e1df70eb9d050036301c7530c5b17e"
  end
  version "3166.0.0"
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
