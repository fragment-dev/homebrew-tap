require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4671.0.0-darwin-x64.tar.gz"
    sha256 "676d3edca466328b856553618c46d6d078617b13c0b9745baba6f6bff4956bf4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4671.0.0-darwin-arm64.tar.gz"
      sha256 "da059cbe11bf85dcd049c5cc12914240999cd66aca7da4f8a96e3315500f0037"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4671.0.0-linux-x64.tar.gz"
    sha256 "4a9829b2d12770715d5b6768a366d63c99ca8e0fac9803a2e636fb8711597c33"
  end
  version "4671.0.0"
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
