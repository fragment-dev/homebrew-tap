require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-darwin-x64.tar.gz"
    sha256 "755b4f650d14a476ee2f2ed31ae4fd45c0bc604932b4dd279c1f50306ec52ee5"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-darwin-arm64.tar.gz"
      sha256 "d8062456310e2d99bba5108c3edbdddcdec36dfdf64c7767f1a9be31c483e761"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2025.1.10-1-linux-x64.tar.gz"
    sha256 "8c529c87cebe4b62f5e023d2b516d23675ac2310d8bdcc33d8bdb40cf92d83b7"
  end
  version "2025.1.10-1"
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
