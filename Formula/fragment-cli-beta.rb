require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3215.0.0-darwin-x64.tar.gz"
    sha256 "3630ee161cd46072387c5e476c25a9521cd887e1c09de1f87e01f7e1da46b97c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3215.0.0-darwin-arm64.tar.gz"
      sha256 "d52a44aee0505a2e453f0dce3ed0a4df3b25990703fa90e8685db60417944a92"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3215.0.0-linux-x64.tar.gz"
    sha256 "f8004793c1c1f67adfa3a6788552953ffc1e8720f2d63bdd872d4353507121b8"
  end
  version "3215.0.0"
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
