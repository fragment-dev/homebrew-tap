require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3774.0.0-darwin-x64.tar.gz"
    sha256 "2049e7cc1d7e4302f45d12fa10c0c629d7e422e8fb89065f142b7b5568d0c056"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3774.0.0-darwin-arm64.tar.gz"
      sha256 "f61e061d27973cf103cad4ccd5d62fdab3086c43a9f101aaefdde722aa73029b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3774.0.0-linux-x64.tar.gz"
    sha256 "d14b6769503d2d6308bb1ce45aa73404d6d46fb397d8206a875cf1822613d9c9"
  end
  version "3774.0.0"
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
