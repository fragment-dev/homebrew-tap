require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5000.0.0-darwin-x64.tar.gz"
    sha256 "432d697a92925f6d829628a5f83678227ac235a63cda922889540794cdc125cd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5000.0.0-darwin-arm64.tar.gz"
      sha256 "28e1db557f5d05feed25e19cd877b02b458318f101014c3ccc20d8839b35cf13"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5000.0.0-linux-x64.tar.gz"
    sha256 "0778b9dcaef42a94e0d92299a9b06654fce471293206d67b558c506df5bce9d8"
  end
  version "5000.0.0"
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
