require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5528.0.0-darwin-x64.tar.gz"
    sha256 "7382e757810affa890973f2ab11f01569e33c17d0b59cc4b01fbe5642014a30f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5528.0.0-darwin-arm64.tar.gz"
      sha256 "698d3aa1c30994f32e6e73146e1ff99fcf35118fadd34bdfef25270523e738f2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5528.0.0-linux-x64.tar.gz"
    sha256 "60069d1081147f8aa4e92ddc730e3801eb9dfb9ec09a60faa51e710c9ab9e190"
  end
  version "5528.0.0"
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
