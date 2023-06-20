require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2875.0.0-darwin-x64.tar.gz"
    sha256 "e880de7ab4afa4190e9e8984ec2cfc34c78106cc636f2d709803153b4299abd9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2875.0.0-darwin-arm64.tar.gz"
      sha256 "0347ca7fb4ab315b4b641b87aec531d2efe4341f98776af85d87286de2830598"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2875.0.0-linux-x64.tar.gz"
    sha256 "0bf50206024687a016f91e31c30ae9057cb6f38ac7dccc9207059c7495949420"
  end
  version "2875.0.0"
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
