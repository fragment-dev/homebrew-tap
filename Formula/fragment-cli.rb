require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-darwin-x64.tar.gz"
    sha256 "29332c722865fa91e2dd349eeb30501ef68e6528500ed13a93d7e7d8957f8e88"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-darwin-arm64.tar.gz"
      sha256 "55a9a537654de8130d96f0e9b44fca799fe93b66344e3a237e220cf66f438c7b"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.7.18-linux-x64.tar.gz"
    sha256 "3afe3d35b085820750daed33ea20cdd04ecddac7e95e1387962bf8ab78e8c0f5"
  end
  version "2023.7.18"
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
