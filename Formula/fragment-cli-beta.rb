require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2319.0.0-darwin-x64.tar.gz"
    sha256 "a5e5eb2b40489ac0ca36803399c6ac10afc6bc8b912707fb776f7c6243bc9945"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2319.0.0-darwin-arm64.tar.gz"
      sha256 "475349d5b8a0689e1e4703719999b623de1ea36afe55bf214e8bd910f76be937"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2319.0.0-linux-x64.tar.gz"
    sha256 "bae5331454c62916965045032f06d01e3052d915d151dee309cb84843436920d"
  end
  version "2319.0.0"
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
