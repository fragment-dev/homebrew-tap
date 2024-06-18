require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5291.0.0-darwin-x64.tar.gz"
    sha256 "0f66feb70ad8b892d5881dbc9730ebd38eddd205614a18805f362ef219601df4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5291.0.0-darwin-arm64.tar.gz"
      sha256 "cef5d1d4d741a8fb6d901162d17207149f1775f27c18a507c73afac0e2b02ad2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5291.0.0-linux-x64.tar.gz"
    sha256 "e50f1a85d9419899f48ac0355c57a2d00feb3da276bf865ecd16ea18fc87ac02"
  end
  version "5291.0.0"
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
