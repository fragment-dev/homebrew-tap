require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3967.0.0-darwin-x64.tar.gz"
    sha256 "5fc587e5d04b7f3a028e9fbde12e9cd351ded0cff9fdee41c8e63e98e17e79df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3967.0.0-darwin-arm64.tar.gz"
      sha256 "eed3c4ab1516f4abf3d796757025866e5b070aef313e8b1e04a90131f2f0dd21"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3967.0.0-linux-x64.tar.gz"
    sha256 "c2b6abb03d5d072ac7bd08e7a872f66112328aea7b8867637aa35abefe3ea818"
  end
  version "3967.0.0"
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
