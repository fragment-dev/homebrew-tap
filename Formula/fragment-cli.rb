require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-2-darwin-x64.tar.gz"
    sha256 "08ecdf29fa3a6bc71d114670c9043f50dd3b3eb5f77a39ba0d0ac4c8f9ef54ed"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-2-darwin-arm64.tar.gz"
      sha256 "03d71f662d4b2fa1c73263870c2b671d24153072f6e44232607a51a02bd77e67"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.30-2-linux-x64.tar.gz"
    sha256 "637ac9d6cd491d73b4058be5197a13c0ff2cfe11daeed3e1d86dd1a0894debe1"
  end
  version "2024.4.30-2"
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
