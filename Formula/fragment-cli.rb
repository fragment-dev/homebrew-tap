require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.5-darwin-x64.tar.gz"
    sha256 "f03c3a1142400314892d94b307fb5d696dd001f9719cef0726010583604d01f8"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.5-darwin-arm64.tar.gz"
      sha256 "79dd088a1b87f52be89dd78e1fe328415527eec04e044a37eefcbaef536e7d69"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.5-linux-x64.tar.gz"
    sha256 "da914bdf585dd4eadd285462c44a29d3c39e59aa7649d3acf3401ea5605d9e80"
  end
  version "2023.6.5"
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
