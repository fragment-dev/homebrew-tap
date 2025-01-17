require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6097.0.0-darwin-x64.tar.gz"
    sha256 "907888258022eac5f609194ce0d2de410cbc0a0a12674e891d3655a5f2d6c402"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6097.0.0-darwin-arm64.tar.gz"
      sha256 "8a724d04ee511c093bd595b19087ffd1c03b211aec56a46015cc0151158a7a4f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6097.0.0-linux-x64.tar.gz"
    sha256 "859db63704da4f82bed190a49a5e10a67cbff9ac2dadb54bdca733506f5d2ff5"
  end
  version "6097.0.0"
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
