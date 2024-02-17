require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-1-darwin-x64.tar.gz"
    sha256 "0367b3a164bbd1e1e0766776e58e8fb8049413a32fd3a03f6cfcde28bce002dc"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-1-darwin-arm64.tar.gz"
      sha256 "d5880214bffd123848e46b4266ae9303f4208429fd9e51367d0f39d43b496d38"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.16-1-linux-x64.tar.gz"
    sha256 "c6a2cea4ef31109663b8a9723f355ea8b826f4a960a74e93ab069106adad428c"
  end
  version "2024.2.16-1"
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
