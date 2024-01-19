require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-2-darwin-x64.tar.gz"
    sha256 "a702997f097399f7e97250c3128090a14bc8ccd9ede3c5eb8d74443db96c2c90"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-2-darwin-arm64.tar.gz"
      sha256 "7ec4da33ebfb7abb2c29476c34928eaa897ea98d938e2448b90205473852124c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-2-linux-x64.tar.gz"
    sha256 "cecf71e34836ce8c2f400fbe13cf0743a7bc4ab0816aa628f91bf1af5d7908c6"
  end
  version "2024.1.18-2"
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
