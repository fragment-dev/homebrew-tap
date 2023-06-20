require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2878.0.0-darwin-x64.tar.gz"
    sha256 "390d9c21500c6ad5d60b730d119ed8d67706a86e3783a109cc27d584013e5200"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2878.0.0-darwin-arm64.tar.gz"
      sha256 "d038149d3e4e1a9e2c15de683d3fe1526734632d3aae7288fd26eb5cf6eafdd8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2878.0.0-linux-x64.tar.gz"
    sha256 "8c6845c14b1758e31ce29abd0722cfeea6eff312829ff513a890ca1dd414cb28"
  end
  version "2878.0.0"
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
