require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4932.0.0-darwin-x64.tar.gz"
    sha256 "93ec09dc7dc943506b88490eb1c6907aad39dd3609a7fff225f7dfeb36dc9155"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4932.0.0-darwin-arm64.tar.gz"
      sha256 "9955ebb9ed131b481468dc6308d01efbd730ef3609e47bfce14cd65f5a4a0776"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4932.0.0-linux-x64.tar.gz"
    sha256 "9e956f7df6b5e907e3de1d3ff2231eb0f4b468c3d7061ffb938af60f2870183a"
  end
  version "4932.0.0"
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
