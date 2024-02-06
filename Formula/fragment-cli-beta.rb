require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4508.0.0-darwin-x64.tar.gz"
    sha256 "4389682c33711d2a83fc5496ad0727e1d8e2869512ffc92b51c6ba5774619fb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4508.0.0-darwin-arm64.tar.gz"
      sha256 "5add406cb9a3781d5cf723869689d6fd14b1a826128b73214e13342ce2f10971"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4508.0.0-linux-x64.tar.gz"
    sha256 "472d01224261dae9faa15d68bc189a92231a50a1e2ad73534f07b04c0ee26491"
  end
  version "4508.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
