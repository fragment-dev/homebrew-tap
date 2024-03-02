require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-2-darwin-x64.tar.gz"
    sha256 "b3b8a998a57ddab2578c2d669eab943d593fe93cc7ae48626ef5c974856a7fe7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-2-darwin-arm64.tar.gz"
      sha256 "9d98c3e70f3db2ac0970e949f4a54c3cfe918e80502052bbd3cc60a07e9e6017"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.29-2-linux-x64.tar.gz"
    sha256 "1ccee7c161c9d5be2591bb25dfea3b07cee1212a2daef9a51792c42afbb3fe1a"
  end
  version "2024.2.29-2"
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
