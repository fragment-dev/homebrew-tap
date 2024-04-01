require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.31-darwin-x64.tar.gz"
    sha256 "a1b6cf6033cf6b8a268bb6ba7f64437d7a12969a1f3cf1eb13b8e3434bdfe383"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.31-darwin-arm64.tar.gz"
      sha256 "a9aa7d04d04d76ddfb9d20cfecf35aa180a4e748e9c49fe52037384991f1b776"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.3.31-linux-x64.tar.gz"
    sha256 "a9f89190be8e1e4f2ada03aabcf52b297bed572b571c34862bc099c1d2cf8b3e"
  end
  version "2024.3.31"
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
