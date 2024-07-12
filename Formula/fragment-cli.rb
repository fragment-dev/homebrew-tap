require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-1-darwin-x64.tar.gz"
    sha256 "ba0ae9aa966d66223141fcc8d3650c052a209cbdf69038280be3334332416e4a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-1-darwin-arm64.tar.gz"
      sha256 "5d6cdafe874740c1cdde6c1334392bea20eb8e47f51a449d1b526e673564f030"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.7.11-1-linux-x64.tar.gz"
    sha256 "3f2a64257cbe8245298dcaceba42077ec02236b202b3af8523c6761a9cc98e2f"
  end
  version "2024.7.11-1"
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
