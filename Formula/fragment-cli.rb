require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-darwin-x64.tar.gz"
    sha256 "cbaad16cbcd96c9dfdf9f0fe16c1e003803574aec0bd197248e9b15ff56079f0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-darwin-arm64.tar.gz"
      sha256 "131823460edb5d315a8e0421625e4a4b98586122a0feb3e6e76fa1dcfcbb0621"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.21-linux-x64.tar.gz"
    sha256 "14580864af05bda4c6dfdd028012f52358ec5397f22aa8b34ef06ed112ff1f45"
  end
  version "2024.5.21"
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
