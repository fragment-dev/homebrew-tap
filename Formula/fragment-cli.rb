require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-1-darwin-x64.tar.gz"
    sha256 "8eee73c147e6d04210c0721ba6216c85d5554454d4591878571fa4ffb6145228"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-1-darwin-arm64.tar.gz"
      sha256 "1bcda1cccaabf9ca50d380b6e8f4ee71fc8a523724afbd2b1385a02144517a50"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.4-1-linux-x64.tar.gz"
    sha256 "35c14ea19f9f3d508e405edb1c3e98fd5d236eebda5c9a291cde862b90d04ca6"
  end
  version "2024.6.4-1"
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
