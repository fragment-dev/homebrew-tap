require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3147.0.0-darwin-x64.tar.gz"
    sha256 "17eeef563da9ebbdc5065f7668c9fa6c654abf76856827deb8fcdbed8807b166"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3147.0.0-darwin-arm64.tar.gz"
      sha256 "bffcaf013a0c80bc472a34c75b0a5fab3773166c534eb16af8900863d7679fdb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3147.0.0-linux-x64.tar.gz"
    sha256 "1645c732b2a1b25e7a20fc7709db50a5fb1288ff2bc3256f1d29a5d0d2ead359"
  end
  version "3147.0.0"
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
