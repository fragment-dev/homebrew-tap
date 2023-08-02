require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.1-1-darwin-x64.tar.gz"
    sha256 "df2a7d26ac72b00f3313684463f476e26a8a1e4b7f44dbcb5d63125ad40b901c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.1-1-darwin-arm64.tar.gz"
      sha256 "6633fa4a717668e945a1806fba3baf252ffc35a102fc9beac7d1b9051defab71"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.8.1-1-linux-x64.tar.gz"
    sha256 "79ba38dc43de7922e4d6dfd3437b50f93f8d3fdc0d7428cb97759556d33ef11b"
  end
  version "2023.8.1-1"
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
