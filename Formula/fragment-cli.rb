require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-2-darwin-x64.tar.gz"
    sha256 "17279b974354dca984c668479fa393d6cd8fa8349f734648236b96957320b4b0"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-2-darwin-arm64.tar.gz"
      sha256 "a80fda99df77c3aa34488ea4f6c108876a355f7d44a06e712adbe9523794b360"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.2.14-2-linux-x64.tar.gz"
    sha256 "6271d53caa4d13273a2e656940a7f916a3a849c0339b18f780c0a7f4e23e9379"
  end
  version "2024.2.14-2"
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
