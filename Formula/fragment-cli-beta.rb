require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2587.0.0-darwin-x64.tar.gz"
    sha256 "5410dfde362a85012722b861e6c81614599d75f1c4cfb4d993bf1c86d75959da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2587.0.0-darwin-arm64.tar.gz"
      sha256 "d8a3cfc94cf1885486bfa3b6dc968b2ea61795378d98d3ac1353f6aec0835696"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2587.0.0-linux-x64.tar.gz"
    sha256 "f8243bd2c0876f4da27571b7831fc75074038b97b68be197bf4e9b0ab2aa9e4d"
  end
  version "2587.0.0"
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
