require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-darwin-x64.tar.gz"
    sha256 "9ec1e16753d13a413a2309ac3463acea049b2f6bf645060397c0468b7a7ede65"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-darwin-arm64.tar.gz"
      sha256 "7cb70234059f1179d75e6c3924920faed7efdf127017bada8f38de570a553619"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.11.21-linux-x64.tar.gz"
    sha256 "90fff16e8c165217de51306ad7c466ec7eaa18ee752a6c4b8cf88e48bfb1c277"
  end
  version "2024.11.21"
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
