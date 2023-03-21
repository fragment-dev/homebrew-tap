require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2249.0.0-darwin-x64.tar.gz"
    sha256 "aff595e9ccb2c2cafa963705a8c19c381ea54eeab3762098c4f2ee662e9deef8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2249.0.0-darwin-arm64.tar.gz"
      sha256 "b679ba02f359ee29208e5e4c9c68b4a85dd5926d73fa9c9a583872d7f9c02d86"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2249.0.0-linux-x64.tar.gz"
    sha256 "435f60a356f7d13544b8faaba928e0d6daba25c597bdc33b43a7f9acda83982f"
  end
  version "2249.0.0"
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
