require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3758.0.0-darwin-x64.tar.gz"
    sha256 "cd8fc89d6e951ed6d91a76814ae150657d88677858b7efc398eca5e7ba051207"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3758.0.0-darwin-arm64.tar.gz"
      sha256 "9cf2e8e0beffe7c871c498eb4eccf0cffa364a4c603da919f868017754b17654"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3758.0.0-linux-x64.tar.gz"
    sha256 "b0b8f2cb01d81f8837191344947eaaaa30b47eb2154cf9e15b8e7d3ad02d34cd"
  end
  version "3758.0.0"
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
