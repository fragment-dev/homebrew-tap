require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4282.0.0-darwin-x64.tar.gz"
    sha256 "a108d13764ca93405468b2c1f0542b41f54338f97bc2312583627ad5d7d6241d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4282.0.0-darwin-arm64.tar.gz"
      sha256 "95d809f503b3ed2fde39112168714898a724ff2e6bfd579d9c60e43b75848da9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4282.0.0-linux-x64.tar.gz"
    sha256 "08e7927ee44d3f19b784632ab5f88496553f4be11d64ea23840bad5628347746"
  end
  version "4282.0.0"
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
