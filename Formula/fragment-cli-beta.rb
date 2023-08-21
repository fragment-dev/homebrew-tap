require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3352.0.0-darwin-x64.tar.gz"
    sha256 "fcc64a156c7ecb9b023043172702e78b4707266bbb64f49a247f0196f04da56c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3352.0.0-darwin-arm64.tar.gz"
      sha256 "500653821772d1a3eccf1de077b3dfded97c2493041c0a7d116ea032c837d1cf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3352.0.0-linux-x64.tar.gz"
    sha256 "731110ede5fa84c1a858830797806886dad185b41f205d068038f4e93478084b"
  end
  version "3352.0.0"
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
