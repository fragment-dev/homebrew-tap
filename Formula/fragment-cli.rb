require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-darwin-x64.tar.gz"
    sha256 "09fb963bdffb91d5c2325cfc144027aded0aae1d1d7df663462351c12d735323"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-darwin-arm64.tar.gz"
      sha256 "d5457c6ffd6114af61f9a7ac39b267cb1065e1370a2e405569c539e2b65d22d2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.11-linux-x64.tar.gz"
    sha256 "97872b5fbcb172123bc2697ff9985b20c6dc6e8f61b8cc103dc8a0b12a270156"
  end
  version "2024.1.11"
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
