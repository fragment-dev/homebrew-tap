require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.30-darwin-x64.tar.gz"
    sha256 "a9ffa6b52108be69bc17d22adf0a27a7816f1bbd07656742e77f6eee85990b2a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.30-darwin-arm64.tar.gz"
      sha256 "7970fb3888a02710c80c7be5872f440bf9e143596512cc2e4e3889630af505a0"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.30-linux-x64.tar.gz"
    sha256 "e2fbfda740c6cbbd66838d44a8bbfa13bfc59b7f7c17aaa00ed7f76b225475a2"
  end
  version "2023.6.30"
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
