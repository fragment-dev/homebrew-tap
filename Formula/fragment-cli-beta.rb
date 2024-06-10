require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5248.0.0-darwin-x64.tar.gz"
    sha256 "a34d3c4ba13e42d36277f569795c9c5a460b78c45f440794815d1f0a893a2f71"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5248.0.0-darwin-arm64.tar.gz"
      sha256 "848ae481c2452fb805a62001afcc60ecc63b9d7db9abea4c6ee60d8ca51af50e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5248.0.0-linux-x64.tar.gz"
    sha256 "f667e422c597778e617f7321d2567ea04d0c4c319bd543863bd62aa7d63a517d"
  end
  version "5248.0.0"
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
