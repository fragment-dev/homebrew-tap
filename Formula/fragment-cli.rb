require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-1-darwin-x64.tar.gz"
    sha256 "ac5bc8c1ac6c03a6442fab7901123c95f7cbae21ed80bbda1a3f3ef2e66ce7c4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-1-darwin-arm64.tar.gz"
      sha256 "62087c9e1ad94f51b94f002e19636c8414c703dfda710f553c4bd349723e1e41"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.8.29-1-linux-x64.tar.gz"
    sha256 "34c6c118f00471d5d355b0647be1da763b2bf3af24dd3a35dff1b55eaa2a2e7e"
  end
  version "2024.8.29-1"
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
