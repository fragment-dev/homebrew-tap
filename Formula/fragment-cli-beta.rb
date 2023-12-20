require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4181.0.0-darwin-x64.tar.gz"
    sha256 "0231d8f5d8b39af449d5249be8ed202813a41726d0b2a0d783de71ee22c407ed"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4181.0.0-darwin-arm64.tar.gz"
      sha256 "c0a02dd44ddbb5f6c9ce8ca148ac40a2c70b8930d6052341a599164b989c63ba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4181.0.0-linux-x64.tar.gz"
    sha256 "5e782e095795df6357b580f5308f95a6aae920cf9467666158d8643cfe196658"
  end
  version "4181.0.0"
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
