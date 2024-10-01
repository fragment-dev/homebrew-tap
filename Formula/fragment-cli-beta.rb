require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5635.0.0-darwin-x64.tar.gz"
    sha256 "c4188f03f398003f359fa8b331d003999471dbefe4e12f49863974ef88f072fb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5635.0.0-darwin-arm64.tar.gz"
      sha256 "f0fe80f21abfb722673360477464dcf525132057e426233f1bc26f3e060097c0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5635.0.0-linux-x64.tar.gz"
    sha256 "bb6be1c5d38b4ebd95e55e8827b05eb66b3e332f9e5f9782a4d3edb79eec1a5c"
  end
  version "5635.0.0"
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
