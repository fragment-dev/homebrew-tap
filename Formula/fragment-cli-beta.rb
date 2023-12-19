require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4164.0.0-darwin-x64.tar.gz"
    sha256 "35bdfa63e9ae027e23643cbb5d3210d8b0ec7011c864f6ec9b9d24d00bbdc6ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4164.0.0-darwin-arm64.tar.gz"
      sha256 "4026b0a26c8060b51db6d7edfa98ae9be870108d88d9181ede7a1d47e2dde216"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4164.0.0-linux-x64.tar.gz"
    sha256 "f7a11416f34eaa13da9b2da2c9cf685ab0ce51c7b23f68f0af364d9777c94868"
  end
  version "4164.0.0"
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
