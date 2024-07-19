require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-darwin-x64.tar.gz"
    sha256 "8044d5806b0d66b9b8804ac3ff57f10b31b4f47f58992d2acc032d677eb64fe6"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-darwin-arm64.tar.gz"
      sha256 "b1bf9f83103774e9d09b3cd59e4234dc38c28b935f406db78793c1cee95a1932"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.19-linux-x64.tar.gz"
    sha256 "f90b2d1b8cd079fe377f9396df48956e626db28b77d30381b17a99db92bb844d"
  end
  version "2024.7.19"
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
