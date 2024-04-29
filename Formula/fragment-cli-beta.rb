require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4964.0.0-darwin-x64.tar.gz"
    sha256 "cc32b92ddc541b23ea73754753a78e7bd335825dacd404d1483ff545eb5b7309"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4964.0.0-darwin-arm64.tar.gz"
      sha256 "95027f0fb49074181643f776d4fbaef3890ebb6321f5413d6c7c5bd12acc6590"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4964.0.0-linux-x64.tar.gz"
    sha256 "c4c3de26fb3b6f6a3cc64bde31287e2322a6448394840613d55fce9005d2132b"
  end
  version "4964.0.0"
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
