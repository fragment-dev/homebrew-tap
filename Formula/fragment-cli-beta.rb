require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2997.0.0-darwin-x64.tar.gz"
    sha256 "349f5fbf2c4e3301a459a5ab31f73e7c377018e4c2555fcbb8056588d4f21181"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2997.0.0-darwin-arm64.tar.gz"
      sha256 "f1716c1b0fdde6faa78ac0fb8c47018342fe1f7744115aa3510a8758a2acb172"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2997.0.0-linux-x64.tar.gz"
    sha256 "16a0f3faea1586e7d0f347f889f96dbe90b81c559949822d8af94ed91a3fc578"
  end
  version "2997.0.0"
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
